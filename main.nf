nextflow.enable.dsl=2

process FASTQC {

    input:
    path reads

    output:
    path "*.html"

    script:
    """
    fastqc ${reads}
    """
}

workflow {

    reads = channel.fromPath("test_data/*.fastq")

    FASTQC(reads)
}
