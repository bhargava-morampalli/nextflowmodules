process xporeanalysis {
    
    publishDir "$params.outdir/xporefinal_${yaml.simpleName}", mode:'copy'

    container 'https://cloud.sylabs.io/library/bhargava-morampalli/containers/xpore:2.1'
    
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
