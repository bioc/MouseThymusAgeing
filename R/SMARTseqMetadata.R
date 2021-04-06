#' Sample metadata from the Baran-Gale et al. ageing mouse thymus
#'
#' A data frame containing mouse age and sort-type information for the
#' SMARTseq experiment data sets
#'
#' @format A data frame containing information for each replicate sample
#'
#' The object contains:
#' \describe{
#' \item{\code{sample}:}{Character, day<1:5>.}
#' \item{\code{Age}:}{Character, age of mouse cells acquired from.}
#' \item{\code{Gender}:}{Character, gender of mouse - all female.}
#' \item{\code{ncells}:}{Integer, number of cells (post-QC) per sample.}
#' }
#'
#' @examples head(SMARTseqMetadata)
#'
#' @references
#' Baran-Gale J, Morgan MD, et al. (2020)
#' Ageing compromises mouse thymus function and remodels epithelial cell differentiation
#' \emph{eLife} 9:e56221.
#'
#' @export
SMARTseqMetadata <- read.table(
    text =
        "sample,Age,Gender,ncells
        day1,1wk,female,10
        day1,4wk,female,19
        day1,16wk,female,10
        day1,32wk,female,43
        day1,52wk,female,52
        day2,1wk,female,153
        day2,4wk,female,157
        day2,16wk,female,156
        day2,32wk,female,87
        day2,52wk,female,108
        day3,1wk,female,101
        day3,4wk,female,111
        day3,16wk,female,29
        day3,32wk,female,148
        day3,52wk,female,77
        day4,1wk,female,60
        day4,4wk,female,162
        day4,16wk,female,49
        day4,32wk,female,44
        day4,52wk,female,4
        day5,1wk,female,109
        day5,4wk,female,150
        day5,16wk,female,74
        day5,32wk,female,174
        day5,52wk,female,240",
    header = TRUE,
    sep = ",",
    stringsAsFactors = FALSE)
