/*
 * Index mapped sorted bams for native and IVT data using samtools index
 */

process indexmappedbams {

    publishDir "$params.outdir/mappedbams_16s_native", pattern: "*native*16s*", mode:'copy'
    publishDir "$params.outdir/mappedbams_16s_ivt", pattern: "*ivt*16s*", mode:'copy'
    publishDir "$params.outdir/mappedbams_23s_native", pattern: "*native*23s*", mode:'copy'
    publishDir "$params.outdir/mappedbams_23s_ivt", pattern: "*ivt*23s*", mode:'copy'
    
    tag "index the mapped sorted bam file"

    container 'https://cloud.sylabs.io/library/bhargava-morampalli/containers/samtools:1.16.1'

    input:
    path mappedsortedbams

    output:
    path "*.bam.bai", emit: mappedsortedbamindex

    script:

    """
    samtools index $mappedsortedbams
    """
}