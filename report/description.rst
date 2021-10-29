
{{snakemake.wildcards.cat}}{{snakemake.wildcards.num}}o model_

{{snakemake.wildcards.cat}}{{snakemake.wildcards.num}}{{snakemake.wildcards.res}} mesh_ (logfile_)

+-------+--------+
| |PIC| | |STAT| |
+-------+--------+


.. _model:  meta/{{snakemake.wildcards.cat}}{{snakemake.wildcards.num}}o_{{snakemake.wildcards.extra}}.yaml

.. _mesh: meshes/{{snakemake.wildcards.cat}}{{snakemake.wildcards.num}}{{snakemake.wildcards.res}}_{{snakemake.wildcards.extra}}.vtk

.. _logfile: meshes/logs/{{snakemake.wildcards.cat}}{{snakemake.wildcards.num}}{{snakemake.wildcards.res}}_{{snakemake.wildcards.extra}}.txt

.. |PIC| image:: {{snakemake.input.pic[-1]}}
	 :height: 446
		 
.. |STAT| image:: {{snakemake.input.stat[0]}}
	  :height: 446


