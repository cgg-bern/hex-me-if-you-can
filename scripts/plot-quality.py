#!/usr/bin/python3
import matplotlib
matplotlib.use('Agg')
import sys
import numpy as np
import subprocess
import matplotlib.pyplot as plt
try:
    import gmsh
except ImportError:
    sys.exit("Failed to import gmsh")



def quality(fig, dim):
    element = {"tri": "triangles", "tet": "tetrahedra"}
    
    gmsh.plugin.setNumber("AnalyseMeshQuality", "ICNMeasure", 1)
    gmsh.plugin.setNumber("AnalyseMeshQuality", "DimensionOfElements", dim)
    gmsh.plugin.setNumber("AnalyseMeshQuality", "CreateView", 1)
    gmsh.plugin.setNumber("AnalyseMeshQuality", "Recompute", 1)
    gmsh.plugin.run("AnalyseMeshQuality")
    
    
    
    dt, tags, icn, _, nc = gmsh.view.getHomogeneousModelData(0, 0)


    #icn = np.array([arr[0] for arr in data])

    plt.figure()
    plt.hist(icn, 100, (0, 1), color="Gray")

    plt.plot(icn.min(), 0, 'r^', markersize=20 )
    plt.plot((np.median(icn),)*2,     plt.ylim(), 'b--', linewidth=1.5)
    plt.xlabel("ICN Stiffness Matrix")
    plt.ylabel("Number of "+element[snakemake.wildcards.elem])
    plt.title("Worst: {:.4e} | Average: {:.4e}".format(icn.min(), icn.mean()))
    plt.grid()
    plt.tight_layout()
    plt.savefig(fig)
    
##end def quality


wild2dim = {"tri": 2, "tet": 3}

gmsh.initialize([], False)
gmsh.merge(snakemake.input.msh)
quality(snakemake.output[0], wild2dim[snakemake.wildcards.elem])
gmsh.finalize()
subprocess.call(['convert', '-trim', snakemake.output[0], snakemake.output[0]])
