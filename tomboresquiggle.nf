/*
 * Resuiggle the fast5s using tombo tool
 */

process tomboresquiggle {

    publishDir "$params.outdir/${singlefast5s.simpleName}", mode:'copy'

    tag "resquiggle fast5s with tombo"

    container '/home/bhargavam/Documents/containers/tombo_new.sif'

    input:
    path singlefast5s
    path reference
    val flag

    output:
    path "*", optional: true
    val true, emit: resquiggledone_ch

    script:
    """
    tombo resquiggle $singlefast5s $reference --rna --processes 50 --overwrite --num-most-common-errors 5
    """
}