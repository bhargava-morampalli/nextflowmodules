/*
 * Yanocomp data prep step
 */


process yanocompprep {

    conda '/home/bhargavam/anaconda3/envs/yanocomp'
    publishDir "$params.outdir/yano_${summarytext.simpleName}", mode:'copy'

    input:
    path eventaligntext
    path summarytext

    output:
    path "*.hdf5", emit: yanohdf5
    val true, emit: yanoprepdone

    script:
    """
    yanocomp prep -p 50 -e $eventaligntext -s $summarytext -h ${summarytext.simpleName}.hdf5
    """
}