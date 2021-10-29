ID, EXTRA, CAD_EXT = glob_wildcards("original/{id, [sni]\d{2}}o_{extra}.{cad_ext, .[^.~]+}")
RES = ["c", "u", "b"]


def input_cadext(name):
    cad_ext, = glob_wildcards("original/"+name+".{cad}")
    if len(cad_ext) != 1:
        print("ERROR: a single extension should correspond to the name of the CAD file")
        exit(1)
    return cad_ext[0]
##end def input_cad

