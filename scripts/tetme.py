import gmsh
import sys
import yaml

def get_model_yaml(path):
    config = yaml.safe_load(open(path))
    return config

def info_model(path):
    meta = get_model_yaml(path)
    
    info = get_model_yaml(meta['info'])

    for (key, value) in info.items():
        print("-- ", key, ": ", value)
    
    return meta, info['original']

def set_bounding_mesh(options):
    gmsh.model.occ.synchronize()
    # original volume
    volume = gmsh.model.getEntities(3)
    ipts   = gmsh.model.getEntities(0)
    # the original bounding box
    xmin, ymin, zmin, xmax, ymax, zmax = gmsh.model.getBoundingBox(-1, -1)
    dx = xmax - xmin
    dy = ymax - ymin
    dz = zmax - zmin
    factor = 2
    eps = (factor - 1)/2
    bsize = eps * min(dx, dy, dz)
    # adding a larger bounding box
    box = gmsh.model.occ.addBox(xmin-dx*eps, ymin-dy*eps, zmin-dz*eps, factor*dx, factor*dy, factor*dz)
    # make the whole thing consistent
    gmsh.model.occ.cut([(3, box)], volume, removeTool=False)
    gmsh.model.occ.synchronize()
    apts = gmsh.model.getEntities(0)
    gmsh.model.mesh.setSize([pts for pts in apts if pts not in ipts], bsize)
    print("- point size of inner volume:")
    for opt in options["gmsh.model.mesh.setSize"]:
        for key, value in opt.items():
            if key == "ipts":
                print(key, ": ", opt["ipts"])
                gmsh.model.mesh.setSize(ipts, value)
## end def set_bounding_mesh


def generate_mesh(path_input, path_output, options, bounding=False):
    gmsh.initialize([],False)
    if path_input[-4:] == ".geo":
        gmsh.merge(path_input)
    elif path_input[-4:] == "step"  or path_input[-4:] == ".stp" or path_input[-4:] == "brep":
        gmsh.model.occ.importShapes(path_input)
        gmsh.model.occ.synchronize()
    else:
        raise ValueError("format "+path_input[-4:]+" is not implemented")
    ##end if-else
    if bounding:
        set_bounding_mesh(options)
    ##end if bounding
    v = gmsh.model.getEntities(3)
    for vi in v:
        gmsh.model.addPhysicalGroup(3, [vi[1]], vi[1])
    ##end for (d, t)
    f = gmsh.model.getEntities(2)
    for fi in f:
        gmsh.model.addPhysicalGroup(2, [fi[1]], fi[1])
    ##end for si
    l = gmsh.model.getEntities(1)
    for li in l:
        gmsh.model.addPhysicalGroup(1, [li[1]], li[1])
    ##end for li
    p = gmsh.model.getEntities(0)
    for pi in p:
        gmsh.model.addPhysicalGroup(0, [pi[1]], pi[1])
    ##end for pi
    print("- gmsh.option.setNumber:")
    for opt in options["gmsh.option.setNumber"]:
        for key, value in opt.items():
            print("\t *" + str(key) + ": " + str(value))
            gmsh.option.setNumber(key, value)
    ##end for optType
    print("- generate lines ...")
    gmsh.model.mesh.generate(1)
    print("- generate triangles ...")
    gmsh.model.mesh.generate(2)
    print("- generate tetrahedra ...")
    gmsh.model.mesh.generate(3)
    print("- meshed :-)")
    nodeTags,_,_ = gmsh.model.mesh.getNodes(-1,-1)
    nbvert = len(nodeTags)
    _, elemTags, _ = gmsh.model.mesh.getElements(1, -1)
    nblines = len(elemTags[0])
    _, elemTags, _ = gmsh.model.mesh.getElements(2, -1)
    nbtri = len(elemTags[0])
    _, elemTags, _ = gmsh.model.mesh.getElements(3, -1)
    nbtet = len(elemTags[0])
    print("- output stats: " + str(nbvert) + " vertices, " + str(nblines) + " lines, " + str(nbtri) + " triangles, " + str(nbtet) + " tetrahedra")
    print("- export to:", path_output)
    gmsh.write(path_output)
    gmsh.finalize()


###########################################################
_msh_ = {'c': "coarse", 'u': "uniform", 'b': "bounding"}


snakeinput   = sys.argv[1]
snakeoutput  = sys.argv[2]
snakewildres = sys.argv[3]

meta, cad = info_model(snakeinput)
print("================================================")
print("--generate "+_msh_[snakewildres]+" mesh\t . . .")
generate_mesh(cad, snakeoutput, meta, snakewildres=='b')
print("--"+_msh_[snakewildres]+" mesh is generated and exported :-)")
print("================================================")
