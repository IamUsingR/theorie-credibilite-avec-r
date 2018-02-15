### Emacs: -*- coding: utf-8; fill-column: 62; comment-column: 27; -*-
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

## Charger le package actuar dans la session de travail.
library(actuar)

data(hachemeister)
hachemeister

## Modèle de Bühlmann (sans tenir compte des volumes)
fit.B <- cm(~state, hachemeister,
            ratios = ratio.1:ratio.12)
summary(fit.B)

## Modèle de Buhlmann-Straub (estimateur sans biais de la variance
## inter).
fit.BS1 <- cm(~state, hachemeister,
             ratios = ratio.1:ratio.12,
             weights = weight.1:weight.12)
summary(fit.BS1)

## Modèle de Buhlmann-Straub (pseudo-estimateur de la variance inter).
fit.BS2 <- cm(~state, hachemeister,
             ratios = ratio.1:ratio.12,
             weights = weight.1:weight.12,
             method = "iterative")
summary(fit.BS2)
