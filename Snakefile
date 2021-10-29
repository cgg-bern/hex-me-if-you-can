include: "Snakemesh"

rule all:
    input:
        expand(expand("report/sheets/{id}{{res}}_{extra}.pdf", zip, id=ID, extra=EXTRA), res=RES)

rule pdf:
    input:
        cad=lambda wildcards: "original/{cat}{num}o_{extra}."+input_cadext(wildcards.cat+wildcards.num+"o_"+wildcards.extra),
        msh="meshes/{cat}{num}{res}_{extra}.vtk",
        pic=expand("figs/{{cat}}{{num}}{{res}}_{{extra}}-{iter}.png", iter=range(4)),
        stat=expand("figs/stats/{{cat}}{{num}}{{res}}_{{extra}}-ICN-{elem}.png", elem=["tet", "tri"]),
        md="scripts/template-sheet.md"
    output:
        md=temp("report/tmp/{cat, [sni]}{num, \d{2}}{res, [cub]}_{extra}.md"),        
        tmp=temp("report/sheets/TMP-{cat, [sni]}{num, \d{2}}{res, [cub]}_{extra}.pdf"),
        pdf=report("report/sheets/{cat, [sni]}{num, \d{2}}{res, [cub]}_{extra}.pdf", caption="report/description.rst" ,category="{cat}", subcategory="{res}")
    script:
        "scripts/filldata.py"

rule quality:
    input:
        msh="meshes/{id}{res}_{extra}.vtk"
    output:
        "figs/stats/{id, [sni]\d{2}}{res, [cub]}_{extra}-ICN-{elem, (tri|tet)}.png"
    script:
        "scripts/plot-quality.py"


rule pics:
    input:        
        msh="meshes/{id}{res}_{extra}.vtk"
    output:
        expand("figs/{{id}}{{res}}_{{extra}}-{iter}.png", iter=range(4))
    script:
        "scripts/gen_picture.py"

