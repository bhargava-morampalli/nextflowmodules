/*
 * Convert sams into sorted bams for both 16s and 23s data
 */

process sortedbams {

    publishDir "$params.outdir/bams_16s_native", pattern: "*native*16s*", mode:'copy'
    publishDir "$params.outdir/bams_16s_ivt", pattern: "*ivt*16s*", mode:'copy'
    publishDir "$params.outdir/bams_23s_native", pattern: "*native*23s*", mode:'copy'
    publishDir "$params.outdir/bams_23s_ivt", pattern: "*ivt*23s*", mode:'copy'

    tag "convert sam to sorted bam"

    container 'https://cloud.sylabs.io/library/bhargava-morampalli/containers/samtools:1.16.1'

    input:
    path sams

    output:
    path "*_sorted.bam", emit: sortedbams

    script:

    """
    samtools view -S -b -h $sams | samtools sort -o ${sams.simpleName}_sorted.bam
    """
}