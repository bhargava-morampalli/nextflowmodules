/*
 * Extract specific fast5s for all mapped reads for 16s and 23s - native and IVT data using fast5_subset
 */

process extract_fast5s {

    publishDir "$params.outdir/fast5s_${idtextfile.simpleName}", mode:'copy'
    
    tag "extract multifast5s for mapped reads"

    input:
    path fast5inputpath
    path idtextfile

    output:
    path "*.fast5", emit: subsetfast5s
    path "filename_mapping.txt"
    val true, emit: extractdone_ch

    script:

    """
    fast5_subset -i $fast5inputpath -s ./ -l *.txt -f ${idtextfile.simpleName}- --recursive
    """
}