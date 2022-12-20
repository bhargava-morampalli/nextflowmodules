/*
 * Convert multifast5s into single fast5s
 */

process multitosingle {

    publishDir "$params.outdir/${multitosingleinputpath.simpleName}_single", mode:'copy'

    tag "convert multifast5s into single fast5s"

    container 'https://cloud.sylabs.io/library/bhargava-morampalli/containers/ont-fast5-api:4.1.0'

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