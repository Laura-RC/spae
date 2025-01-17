"""
Running phynteny to improve the anntoation 
"""
rule phynteny_run_paired:
    input:
        gbk=os.path.join(dir.pharokka, "{sample}-pr", "pharokka.gbk")
    params:
        odir=os.path.join(dir.pharokka, "{sample}-pr", "phynteny"),
        model=os.path.join(dir.db, "phynteny_models")
    output:
        pkl=os.path.join(dir.pharokka, "{sample}-pr", "phynteny", "phynteny.gbk")
    conda:
        os.path.join(dir.env, "phynteny.yaml")
    threads:
        config.resources.smalljob.cpu
    resources:
        mem_mb = config.resources.smalljob.mem,
        time = config.resources.smalljob.time
    log:
        os.path.join(dir.log, "phynteny.{sample}.log")
    shell:
        """
        phynteny {input.gbk} -o {params.odir} \
            -m {params.model} -f\
            2> {log}
        """


rule phynteny_run_nanopore:
    input:
        gbk=os.path.join(dir.pharokka, "{sample}-sr", "pharokka.gbk")
    params:
        odir=os.path.join(dir.pharokka, "{sample}-sr", "phynteny"),
        model=os.path.join(dir.db, "phynteny_models")
    output:
        pkl=os.path.join(dir.pharokka, "{sample}-sr", "phynteny", "phynteny.gbk")
    conda:
        os.path.join(dir.env, "phynteny.yaml")
    threads:
        config.resources.smalljob.cpu
    resources:
        mem_mb = config.resources.smalljob.mem,
        time = config.resources.smalljob.time
    log:
        os.path.join(dir.log, "phynteny.{sample}.log")
    shell:
        """
        phynteny {input.gbk} -o {params.odir} \
            -m {params.model} -f \
            2> {log}
        """
