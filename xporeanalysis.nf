process xporeanalysis {
    
    publishDir "$params.outdir/xporefinal_${yaml.simpleName}", mode:'copy'
    
    input:
    path yamlfile
    val flag
    val flag

    output:
    path "diffmod.table", emit: xporetable
    path "diffmod.log", emit: xporelog
    val true, emit: xporeanalysis

    script:
    """
    xpore diffmod --config $yamlfile
    """
}
