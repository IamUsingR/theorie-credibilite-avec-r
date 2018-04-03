### Redéfinition locale de la méthode 'print' des objets 'cm' pour
### faire en sorte que les lignes du Call soient moins longues. Il
### doit y avoir un meilleur moyen de parvenir à cela, mais c'est tout
### ce que j'ai trouvé pour le moment.
##
## Copyright (C) 2018 Vincent Goulet
##
## Ce fichier fait partie du projet
## «Théorie de la crédibilité avec R»
## http://github.com/vigou3/theorie-credibilite-avec-r
##
## Cette création est mise à disposition selon le contrat
## Attribution-Partage dans les mêmes conditions 4.0
## International de Creative Commons.
## http://creativecommons.org/licenses/by-sa/4.0/

print.cm <- function(x, ..., width.cutoff = 25L)
{
    chkDots(...)                        # method does not use '...'
    nlevels <- length(x$nodes)
    level.names <- names(x$nodes)
    b <- if (is.null(x$iterative)) x$unbiased else x$iterative

    cat("Call:\n",
        paste(deparse(attr(x, "call"), width.cutoff = width.cutoff),
              sep = "\n", collapse = "\n"),
        "\n\n", sep = "")

    cat("Structure Parameters Estimators\n\n")
    cat("  Collective premium:", x$means[[1]], "\n")
    for (i in seq.int(nlevels))
    {
        if (i == 1L)
        {
            ## Treat the Hachemeister model separately since in this
            ## case the variance components vector is a list, with the
            ## first element a matrix. (Note that since a matrix with
            ## empty column names is printed to the screen, there will
            ## be a blank line in the display. Hence the inserted
            ## newline in the 'else' case.)
            if (attr(x, "model") == "regression")
            {
                m <- b[[1]]
                dimnames(m) <- list(c(paste("  Between", level.names[i], "variance: "),
                                      rep("", nrow(m) - 1)),
                                    rep("", ncol(m)))
                print(m)
            }
            else
                cat("\n  Between", level.names[i], "variance:",
                    b[i], "\n")
        }
        else
            cat("  Within ", level.names[i - 1],
                "/Between ", level.names[i], " variance: ",
                b[i], "\n", sep = "")
    }
    cat("  Within", level.names[nlevels], "variance:",
        b[[nlevels + 1]], "\n", fill = TRUE)
    invisible(x)
}
