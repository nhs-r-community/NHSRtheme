
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-5-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
<!-- README.md is generated from README.Rmd. Please edit that file -->

# NHS-R Theme <img src="https://raw.githubusercontent.com/nhs-r-community/NHSRtheme/main/inst/images/nhsrthemelogo.png" width="120" align = "right" alt = "NHSRtheme"/>

<a href='https://nhsrcommunity.com/'><img src='https://nhs-r-community.github.io/assets/logo/nhsr-logo.png' width="100"/></a>
*This package is part of the NHS-R Community suite of [R
packages](https://nhsrcommunity.com/packages.html).*

<!-- badges: start -->

[![R build
status](https://github.com/nhs-r-community/NHSRtheme/workflows/R-CMD-check/badge.svg)](https://github.com/nhs-r-community/NHSRtheme/actions)
[![R-CMD-check](https://github.com/nhs-r-community/NHSRtheme/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/nhs-r-community/NHSRtheme/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

This repo attempts to build an R package that can provide themes to
ggplot for producing charts that follow the [NHS
Identity](https://www.england.nhs.uk/nhsidentity/).

This package will also produce xaringan presentation slides that can be
viewed as HTML. For more details please see the vignette provided.

# Installing NHSRtheme

`{NHSRtheme}` is not currently on CRAN, so you will have to install it
directly from Github using devtools.

If you do not have the devtools package installed, you will have to run
the first line in the code below as well.

``` r
# install.packages('devtools')
devtools::install_github('nhs-r-community/NHSRtheme')
```

## Examples

``` r
library(ggplot2)
library(NHSRtheme)
df <- data.frame(x = c("a", "b", "c", "d"), y = c(3, 4, 1, 2))
bars <- ggplot(df, aes(x, y, fill = x)) + 
    geom_bar(stat = "identity") + 
    labs(x = NULL, y = NULL) +
    theme(legend.position = "none")
```

``` r
bars + scale_fill_nhs()
```

![](man/figures/README-default_bars-1.png)<!-- -->

``` r
bars + scale_fill_nhs(palette = 'blues')
```

![](man/figures/README-blues_bars-1.png)<!-- -->

``` r
bars + scale_fill_nhs(palette = 'neutrals') 
```

![](man/figures/README-neutral_bars-1.png)<!-- -->

``` r
bars + scale_fill_nhs(palette = 'support greens')
```

![](man/figures/README-green_bars-1.png)<!-- -->

``` r
df2 <- data.frame(x = c("a", "b", "c", "d", "e", "f" ,"g", "h"), 
                  y = c(3, 4, 1, 2, 5, 9, 7, 4))

bars2 <- ggplot(df2, aes(x, y, fill = x)) + 
    geom_bar(stat = "identity") + 
    labs(x = NULL, y = NULL) +
    theme(legend.position = "none")

bars2 + scale_fill_nhs(palette = 'highlights')
```

![](man/figures/README-highlights_bars-1.png)<!-- -->

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/anyaferguson"><img src="https://avatars.githubusercontent.com/u/157487567?v=4?s=100" width="100px;" alt="Anya Ferguson"/><br /><sub><b>Anya Ferguson</b></sub></a><br /><a href="#design-anyaferguson" title="Design">🎨</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://tjmt.uk/"><img src="https://avatars.githubusercontent.com/u/12023696?v=4?s=100" width="100px;" alt="Tom Jemmett"/><br /><sub><b>Tom Jemmett</b></sub></a><br /><a href="https://github.com/nhs-r-community/NHSRtheme/commits?author=tomjemmett" title="Code">💻</a> <a href="https://github.com/nhs-r-community/NHSRtheme/commits?author=tomjemmett" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://silviacanelon.com"><img src="https://avatars.githubusercontent.com/u/49913337?v=4?s=100" width="100px;" alt="Silvia Canelón"/><br /><sub><b>Silvia Canelón</b></sub></a><br /><a href="https://github.com/nhs-r-community/NHSRtheme/commits?author=spcanelon" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://chrisbeeley.github.io/chris_beeley_blog/"><img src="https://avatars.githubusercontent.com/u/1259867?v=4?s=100" width="100px;" alt="Chris Beeley"/><br /><sub><b>Chris Beeley</b></sub></a><br /><a href="https://github.com/nhs-r-community/NHSRtheme/commits?author=ChrisBeeley" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://rhian.rbind.io"><img src="https://avatars.githubusercontent.com/u/7017740?v=4?s=100" width="100px;" alt="Rhian Davies"/><br /><sub><b>Rhian Davies</b></sub></a><br /><a href="https://github.com/nhs-r-community/NHSRtheme/commits?author=StatsRhian" title="Code">💻</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!