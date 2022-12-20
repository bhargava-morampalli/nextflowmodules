/*
 * get mapping statistics for all sam files using samtools flagstat
 */

process mapstats_samtools {

    publishDir "$params.outdir/mapstats_flagstat", mode:'copy'
    
    tag "mapping stats with samtools flagstat"

    container 'https://cloud.sylabs.io/library/bhargava-morampalli/containers/samtools:1.16.1'

    input:
    path sams

    output:
    path "*_flagstat.txt", emit: flagstatfile

    script:

    """
    samtools flagstat $native16sams | tee ${sams.simpleName}_flagstat.txt
    """
}