process xporefileprep {

    publishDir "$params.outdir/xporeymlfiles", mode:'copy'

    input:
    path nativedir
    path ivtdir
    val flag
    val flag

    output:
    path "$*.yml", emit: xporeyml
    val true, emit: xporeymldone

    script:
    """

    xpore diffmod --config $yamlfile
    """
}