# Welcome to NHS-R Community NHSRtheme contributing guide <!-- omit in toc -->

Thank you for investing your time in contributing to our project! Any contribution you make will be reflected on [nhs-r-community.github.io/NHSRtheme](https://nhs-r-community.github.io/NHSRtheme) :sparkles:. 

Read our [Code of Conduct](./CODE_OF_CONDUCT.md) to keep our community approachable and respectable.

In this guide you will get an overview of the contribution workflow from opening an issue, creating a PR, reviewing, and merging the PR.

## New contributor guide

To get an overview of the project, read the [README](README.md).

### Issues

#### General issues

If you're having general trouble, rather than a bug, please do join the [NHS-R slack](https://nhsrcommunity.slack.com/) and ask on the #help-with-r channel.

#### Create a new issue

If you spot a problem with the package, [search if an issue already exists](https://github.com/nhs-r-community/issues). If a related issue doesn't exist, you can open a new issue using a relevant [issue form](https://github.com/nhs-r-community/issues/new). 

#### Solve an issue

Scan through our [existing issues](https://github.com/nhs-r-community/issues) to find one that interests you. You can narrow down the search using `labels` as filters. As a general rule, we don’t assign issues to anyone. If you find an issue to work on, you are welcome to open a PR with a fix.

### Make Changes

The easiest way to make changes is to clone the repository using [RStudio](https://resources.github.com/whitepapers/github-and-rstudio/#:~:text=Open%20RStudio%20on%20your%20local,Click%20Create%20Project%20.).

First, make sure to [fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repository into your own userspace. Once you have done that, you can then clone the repository in RStudio.

Once you have cloned the repository, create a new [branch](https://r-bio.github.io/intro-git-rstudio/).

An easy way to make sure you have all of the packages required for development is to use the `{devtools}` R package:

``` r
devtools::install_deps(dependencies = TRUE)
```

You can also use the `devtools::load_all()` function to test the package out without having to install it first.

You can now start working on the changes that you wish to make. Once you have finished, make sure to open a Pull Request (you can do this easily in R using `usethis::pr_push()`).
