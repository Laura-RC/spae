rule join_assembly_stats_megahit:
    input:
        coverm = os.path.join(dir.megahit, "{sample}-pr", "results", "sample_coverage.tsv"),
        viralverify = os.path.join(dir.megahit, "{sample}-pr", "final.contigs_result_table.csv"),
        comp = os.path.join(dir.megahit, "{sample}-pr", "graph_seq_details_megahit.tsv"),
        checkv = os.path.join(dir.megahit, "{sample}-pr", "checkv", "quality_summary.tsv")
    output:
        csv = os.path.join(dir.assembly, "{sample}-assembly-stats_megahit.csv")
    conda:
        os.path.join(dir.env, "graph.yaml")
    script:
        os.path.join(dir.script, 'joining_stats.py')


rule join_assembly_stats_flye:
    input:
        coverm = os.path.join(dir.flye, "{sample}-sr", "results", "sample_coverage.tsv"),
        viralverify = os.path.join(dir.flye, "{sample}-sr", "assembly_result_table.csv"),
        comp = os.path.join(dir.flye, "{sample}-sr", "graph_seq_details_flye.tsv"),
        checkv = os.path.join(dir.flye, "{sample}-sr", "checkv", "quality_summary.tsv")
    output:
        csv = os.path.join(dir.assembly, "{sample}-assembly-stats_flye.csv")
    conda:
        os.path.join(dir.env, "graph.yaml")
    script:
        os.path.join(dir.script, 'joining_stats.py')
