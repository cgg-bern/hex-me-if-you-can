# [HexMe](https://hexme.algohex.eu) -- *["Hex Me If You Can"](https://diglib.eg.org/handle/10.1111/cgf14608)*

Here is **HexMe**, the first dataset composed of tetrahedral meshes *with feature-entities* whose main purpose is to humanly benchmark the hexahedral meshers, and related algorithms such as 3D frame field generation.

The originality of this dataset is to gather tetrahedral meshes with information about feature entities, in order to enable an objective basis for the assessment of the behavior of hexahedral methods.
Hence, we don't claim any rights for the CAD models that are used to produce the meshes (related licenses listed below).
They're available from this `git` repository along with the scripts and related metadata files in order to expose to the users the full pipeline of the mesh generation.

This `git` repository does **not** contain the tetrahedral meshes, **but** the files and scripts that are used to generate those meshes.

[Snakemake](https://snakemake.github.io/) orchestrates the whole pipeline.

## CAD models

The tetrahedral meshes are produced using the open source sofware [Gmsh](https://gmsh.info/) from three categories of **C**omputer-**A**ided **D**esign models:

- **S**imple models: basic shapes that are assumed to be easily hex-meshable
- **N**asty models: academic shapes that are known to be challenging to hex-mesh
- **I**ndustrial models: real life shapes whose hexahedrization is highly valuable for the Finite Element community

CAD models are gathered in the folder `original/`.

Filenames are structured as follow, `(s|n|i)(\d{2})o_{extra}.(geo|stp|step|brep)` where:

- `(s|n|i)` stands for the category.
- `(\d{2})` are the two digits corresponding to the arbirtrary and unique number of the model within its category
- `o` stands for **o**riginal
- `{extra}` corresponds to an arbitrary description (if any) of the file

CAD models come from:

- [ABC dataset](https://deep-geometry.github.io/abc-dataset/) (originally from [Onshape](https://www.onshape.com/en/))
- [Gmsh](https://gmsh.info/) (produced by us)
- [GrabCAD](https://grabcad.com/)
- [MAMBO](https://gitlab.com/franck.ledoux/mambo)
- [Siemens NX](https://www.plm.automation.siemens.com/global/en/products/nx/) (produced by us)

Relevant information about the CAD models is available within the corresponding metadata files `meta/(s|n|i)(\d{2})o_{extra}.yaml`.

## Tetrahedral meshes

For each CAD model, three kinds of meshes are provided:

- a **c**urvature-adapted mesh: only the maximal mesh size is bounded
- a **u**niform mesh: the mesh size is constant
- a **b**ox-embedded mesh: the CAD model is embedded into a box which is as twice larger than the bounding box and this box model is meshed accordingly

The mesh parameters used by Gmsh are defined in the metadata files `meta/(s|n|i)(\d{2})(c|u|b)_{extra}.yaml`, which means that for each model there are three more metadata files, one per mesh type `(c|u|b)`.

Filenames correspond to the CAD ones, i.e. `(s|n|i)(\d{2})(c|u|b)_{extra}.vtk`:

- `(s|n|i)` is the category of the CAD model
- `(\d{2})` are the two digits corresponding to the arbirtrary and unique number of the model within its category
- `(c|u|b)` is the kind of mesh
- `{extra}` corresponds to an arbitrary description (if any) of the CAD file

A [webpage](https://hexme.algohex.eu/catalog/) hosts a catalog of those meshes, where it is possible to download a specific mesh (and associated files).
Otherwise, all meshes (and the corresponding log files) are [downloadable](https://hexme.algohex.eu/catalog/hexme.zip) in a single `.zip` file (~1.5GB).


## Mesh format

Meshes are exported by Gmsh using the extension `.vtk`.
The export performed by Gmsh follows [`vtk DataFile Version 2.0`](https://kitware.github.io/vtk-examples/site/VTKFileFormats/), in ASCII mode.
Gmsh's git-version is written within the file header.
The tetrahedral mesh with its feature-entities is written as an `UNSTRUCTURED_GRID`.

The unstructured grid is defined by four sections:

1. `POINTS`: coordinates of every node
2. `CELLS`: number of nodes and nodal definition of every element (vertices, edges, triangles and tetrahedra)
3. `CELL_TYPES`: integer corresponding to the type of the cell (1: vertex, 3: edge, 5: triangle, 10: tetrahedron)
4. `CELL_DATA`: integer corresponding to the cell color which is related to the CAD feature-entity (cell color and CAD color should be the same)


## Licenses

**HexMe dataset is distributed under the [`MIT License`](https://mit-license.org/).**

The licenses related to the CAD models are given in the corresponding metadata files `meta/*.yaml`:

- [`Apache 2.0`](https://www.apache.org/licenses/LICENSE-2.0.html)
- [`GrabCAD Terms`](https://grabcad.com/terms): [related FAQ](https://help.grabcad.com/article/246-how-can-models-be-used-and-shared)
- [`MIT License`](https://mit-license.org/)
- [`Onshape Terms`](https://www.onshape.com/en/legal/terms-of-use#your_content) 1(g)(i)
- `Public Domain`


Gmsh's use is regulated by [`GNU General Public License, version 2 or later`](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html).

Snakemake's use is regulated by [`MIT License`](https://mit-license.org/).

## Contact

Pierre-Alexandre Beaufort, Computer Graphics Group, University of Bern

pierre-alexandre (dot) beaufort (at) inf (dot) unibe (dot) ch

[ERC AlgoHex](https://www.algohex.eu/), grant agreement No 853343
