<!-- Emacs: -*- coding: utf-8; eval: (auto-fill-mode -1); eval: (visual-line-mode t) -*- -->

> **Ce projet est maintenant hébergé [dans GitLab](https://gitlab.com/vigou3/theorie-credibilite-avec-r).**
> **Les fichiers du présent dépôt ne sont plus mis à jour depuis le 2018-06-27.**

# Théorie de la crédibilité avec R

La théorie de la crédibilité constitue la pierre angulaire des mathématiques de l'assurance IARD. *Théorie de la crédibilité avec R* offre un traitement rigoureux et exhaustif des modèles de base de la crédibilité, soit la crédibilité de stabilité (*limited fluctuations*), la tarification basée sur l'expérience purement bayésienne et les modèles classiques de Bühlmann et de Bühlmann-Straub.

Le paquetage [**actuar**](https://cran.r-project.org/package=actuar) pour l'environnement statistique [R](https://www.r-project.org) permet d'effectuer les calculs relatifs aux modèles de crédibilité abordés dans l'ouvrage. Nous expliquons comment utiliser la fonction `cm` du
paquetage par le biais de code informatique distribué avec le document.

L'ouvrage intègre le recueil de [Cossette et Goulet (2008)](https://libre.act.ulaval.ca/index.php?id=451). Il compte donc près de 90 exercices de tous les niveaux de difficulté. Certains proviennent d'anciens examens de la [Society of Actuaries](https://www.soa.org) et de la [Casualty Actuarial Society](https://www.casact.org).

## Auteur

Vincent Goulet, professeur titulaire, École d'actuariat, Université Laval

## Modèle de développement

Le processus de rédaction et de maintenance du projet se conforme au modèle [*Gitflow Workflow*](https://www.atlassian.com/git/tutorials/comparing-workflows#gitflow-workflow). Seule particularité: la branche *master* se trouve [sur GitHub]((https://github.com/vigou3/theorie-credibilite-avec-r)), alors que la branche de développement se trouve dans un [dépôt public](https://projets.fsg.ulaval.ca/git/scm/vg/theorie-credibilite-avec-r-develop) de la Faculté des sciences et de génie de l'Université Laval.

Prière de passer par ce dépôt pour proposer des modifications; consulter le fichier `COLLABORATION-HOWTO.md` dans le dépôt pour la marche à suivre.

## Composition du document

La production du document repose sur la programmation lettrée avec LaTeX et
[Sweave](https://stat.ethz.ch/R-manual/R-devel/library/utils/doc/Sweave.pdf). La composition du document, c'est-à-dire la transformation du code source vers le format PDF, requiert les outils suivants.

### LaTeX

LaTeX est l'un des systèmes de mise en page les plus utilisés dans le monde, particulièrement dans la production de documents scientifiques intégrant de multiples équations mathématiques, des graphiques, du code informatique, etc.

La composition d'un document requiert d'abord une distribution du système LaTeX. Nous recommandons la distribution [TeX Live](https://tug.org/texlive) administrée par le [TeX Users Group](https://tug.org/). 

- [Vidéo expliquant l'installation sur Windows](https://youtu.be/7MfodhaghUk)
- [Vidéo expliquant l'installation sur macOS](https://youtu.be/kA53EQ3Q47w)

Ensuite, des connaissances de base sur le fonctionnement de LaTeX sont nécessaires. Consulter [*Rédaction avec LaTeX*](https://vigou3.github.io/formation-latex-ul/), la formation LaTeX de l'Université Laval. 

>  *Rédaction avec LaTeX* est distribué avec TeX Live. 

Le moteur XeLaTeX est utilisé pour composer le document. 

### Polices de caractères

La compilation du document requiert les polices de caractères suivantes:

- [Lucida Bright OT, Lucida Math OT et Lucida Mono DK](https://tug.org/store/lucida/). Ces polices de très grande qualité sont payantes. La Bibliothèque de l'Université Laval détient une licence d'utilisation de cette police. Les étudiants et le personnel de l'Université peuvent s'en procurer une copie gratuitement en écrivant à [mailto:lucida@bibl.ulaval.ca].
- [Myriad Pro](https://fontsup.com/fr/family/myriad+pro.html) en versions *Regular*, *Bold*, *Italic* et *Bold Italic*. Cette police est normalement livrée avec Acrobat Reader.
- [Font Awesome](http://fontawesome.io/). Cette police fournit une multitude d'icônes et de symboles. Télécharger la plus récente version de la distribution et installer la police `fontawesome-webfont.ttf` du dossier `fonts`.

### Outils Unix additionnels

La composition du document de référence est rendue plus facile par l'utilisation de l'outil Unix standard `make`. Celui-ci n'est livré ni avec Windows, ni avec macOS.

#### Installation des outils sous Windows

Il y a différentes manières d'installer des outils Unix sous Windows. Nous recommandons l'environnement de compilation [MSYS2](http://www.msys2.org/).

- [Télécharger MSYS2](http://www.msys2.org/) (Windows seulement)

> Vous devez savoir si vous disposez d'[une version 32 ou 64 bits de Windows](https://support.microsoft.com/fr-ca/help/15056/windows-7-32-64-bit-faq) et choisir la distribution de MSYS2 en conséquence. 

Une fois l'installation de MSYS2 complétée (bien lire les instructions sur la page du projet), démarrer l'invite de commande MSYS et entrer

    pacman -S make

pour installer le paquetage additionnel.

#### Installation des outils sous macOS

Les outils Unix de compilation sont livrés avec XCode sous macOS. Pour pouvoir les utiliser depuis la ligne de commande, il faut installer les *Command Line Tools*. Entrer simplement à l'invite de commande du Terminal

    xcode-select --install

puis suivre les instructions.

### Lancement de la composition

Nous avons automatisé le processus de compilation avec l'outil Unix standard `make`. Le fichier `Makefile` fournit les recettes principales suivantes:

- `pdf` crée les fichiers `.tex` à partir des fichiers `.Rnw` avec Sweave et compile le document maître avec XeLaTeX;

- `zip` crée l'archive contenant le document et le code source des sections d'exemples;

- `release` crée une nouvelle version (*tag*) dans GitHub, téléverse les fichiers PDF et `.zip` et modifie les liens de la page web;

Question d'éviter les publications accidentelles, `make all` est équivalent à `make pdf`.

## Historique des versions

### (en développement)

#### Autres modifications

- Correction à l'introduction de l'annexe B: l'annexe ne fournit pas les distributions marginales.

### 2018.02-4 (2018-02-26)

#### Nouveautés

- Ajout des listes d'objectifs spécifiques pour chacun des chapitres.

#### Autres modifications

- Exemple 2.3 transformé en texte normal. Son équation principale est maintenant numérotée.
- Améliorations à la typographie des nombres en divers endroits, notamment dans les pourcentages.
- Correction d'une référence incomplète au début de l'annexe C.

### 2018.02-3 (2018-02-19)

#### Nouveautés

- Chapitre 5 entièrement révisé.
- Fichier de code informatique `buhlmann-straub.R` reprenant les calculs de l'exemple numérique de la section 5.4.
- Références pour le modèle de Hachemeister à la section 5.4.3.
- Calculs avec `cm` ajoutés à la solution de l'exercice 5.8.
- Ajout d'une introduction à l'ouvrage.

#### Autres modifications

- Texte de l'introduction du chapitre 4 légèrement retravaillé.

### 2018.02-2 (2018-02-13)

#### Nouveautés

- Chapitre 4 entièrement révisé.
- Fichier de code informatique `buhlmann.R` bonifié.
- Un fichier COLLABORATEURS est maintenant livré avec le document. Il contient la liste des personnes ayant contribué à l'amélioration du document via le dépôt Git.

#### Autres modifications

- Utilisation plus constante de l'indice *i* dans la notation à la section 3.3 jusqu'à  l'exemple 3.2.

### 2018.02-1 (2018-02-08)

#### Nouveautés

- Section 3.6 d'introduction à l'évaluation numériques de modèles de crédibilité avec R. (L'ancienne section 3.6 sur le modèle de Jewell est maintenant la section 3.7.)
- Section 3.8 contenant du code informatique démontrant l'utilisation de la fonction `cm` du paquetage **actuar** pour le calcul de primes bayésiennes linéaires. Le fichier de script correspondant, `bayesienne.R`, est livré dans l'archive.
- Calculs de primes avec `cm` dans la solution de l'exercice 3.25.

#### Autres modifications

- Le fichier de script `buhlmann.R` a été ajouté dans l'archive.

### 2018.01-3a (2018-02-02)

Correctifs de la version précédente, notamment aux exercices du chapitre 3.

- Il manquait un détail important dans le résultat de Jewell (1974) cité à la section 3.6: la fonction de vraisemblance doit provenir de la famille exponentielle.
- Exemple 3.3 identifié en entête comme le cas Bernoulli/bêta.
- Les exercices qui étaient numérotés 3.32, 3.33 et 3.34 dans la version précédente ont été supprimés du document.
- Nouvel exercice 3.32 dérivé de Bühlmann et Gisler (2005, section 2.6). 

### 2018.01-3 (2018-01-30)

#### Nouveautés

- Introduction du chapitre 1 entièrement révisée. Contenu inchangé, mais dorénavant en prose.
- Chapitre 3 entièrement révisé.
- Section 3.1 sur l'estimation bayésienne déplacée en annexe. Toutes les autres annexes sont décalées.

#### Autres modifications

- Notation modifiée à l'exemple 2.3.

### 2018.01-2 (2018-01-22)

Révision complète du texte et des exercices du chapitre 2.

### 2018.01-1 (2018-01-18)

Première version avec notes de cours de Vincent Goulet et exercices de Cossette et Goulet (2008). Cette version ne justifie pas tellement le «avec R» du titre, mais ça viendra.
