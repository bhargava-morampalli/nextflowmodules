/*
 * Convert multifast5s into single fast5s
 */

process multitosingle {

    publishDir "$params.outdir/${multitosingleinputpath.simpleName}_single", mode:'copy'

    tag "convert multifast5s into single fast5s"

    input:
    path multitosingleinputpath

    output:
    path "*", emit: singlefast5s_ch
    path "filename_mapping.txt"
    val true, emit:multitosingledone

    script:

    """
    multi_to_single_fast5 --input_path $multitosingleinputpath --save_path ./ --recursive
    """
}