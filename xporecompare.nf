/*
 * xpore compare samples to get mods
 */


process xporecompare {

    publishDir "$params.outdir", mode:'copy'

    tag "prepare the data for xpore analysis"

    input:
    path eventaligntext

    output:
    path "*.log", emit: xporelog
    path "*.index", emit: xporeindex
    path "*.json", emit: xporejson
    path "*.readcount", emit: xporereadcount
    path "eventalign.index", emit: eventalignindex
    val true, emit: xporeprepdone

    script:
    """
    xpore dataprep --eventalign $eventaligntext --out_dir ${eventaligntext.simpleName} --n_processes 40
    """
}