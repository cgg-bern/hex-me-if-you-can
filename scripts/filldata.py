import gmsh
import subprocess
import numpy as np

def strsum(L):
    return str(sum(L))


snakewild = snakemake.wildcards
snakein = snakemake.input
snakeout = snakemake.output

##
gmsh.initialize([], False)

if snakein.cad[-3:]=="geo":
    gmsh.merge(snakein.cad)
else:
    gmsh.model.occ.importShapes(snakein.cad)
    gmsh.model.occ.synchronize()
geo = np.array([g for (g,_) in gmsh.model.getEntities()])

fin  = open(snakein.md, "r+")
source = fin.read()

source = source.replace("ID_NAME", snakein.msh.split('/')[-1][:-4])
source = source.replace("NPTS", strsum(geo==0))
source = source.replace("NLINES", strsum(geo==1))
source = source.replace("NSURF", strsum(geo==2))
gmsh.finalize()
##
gmsh.initialize([], False)
gmsh.merge(snakein.msh)
msh, tag,  _ = gmsh.model.mesh.getElements()
nodes, _,  _ = gmsh.model.mesh.getNodes()
placeholder = {1: "NEDG", 2: "NTRI", 4: "NTET", 15: "NVERT"}
for (m, t) in zip(msh, tag):
    source = source.replace(placeholder[m], str(len(t)))
source = source.replace("NNODES", str(len(nodes)))
gmsh.finalize()
##
source = source.replace("ICN_TET", snakein.stat[0])
source = source.replace("ICN_TRI", snakein.stat[1])
source = source.replace("VIEW_0", snakein.pic[0])
source = source.replace("VIEW_1", snakein.pic[1])
source = source.replace("VIEW_2", snakein.pic[2])
source = source.replace("VIEW_3", snakein.pic[3])

fin.close()
##
fout = open(snakeout.md, "w")
fout.write(source)
fout.close()

subprocess.run(['pandoc', snakeout.md, '-o', snakeout.tmp])
subprocess.call(['gs',
                 '-o', snakeout.pdf,
                 '-sDEVICE=pdfwrite',
                 '-dDownsampleColorImages=true',
                 '-dDownsampleGrayImages=true',
                 '-dDownsampleMonoImages=true',
                 '-dColorImageResolution=200',
                 '-dGrayImageResolution=200',
                 '-dMonoImageResolution=200',
                 '-dColorImageDownsampleThreshold=1.0',
                 '-dGrayImageDownsampleThreshold=1.0',
                 '-dMonoImageDownsampleThreshold=1.0',
                 snakeout.tmp])

