process xporeanalysis {

    publishDir "$params.outdir/${yamlfile.simpleName}", mode:'copy'

    input:
    path yamlfile
    val flag
    val flag

    output:
    path "*.bed", emit: yanobed
    path "*_sm_preds.json", emit: yanojson
    val true, emit: xporeanalysis

    script:
    """
    xpore diffmod --config $yamlfile
    """
}