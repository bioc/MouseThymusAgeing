#' @title
#'  Sample metadata from the Baran-Gale et al. ageing mouse thymus droplet experiments
#'
#' A data frame containing mouse age and sort-type information for the
#' droplet single-cell RNA-sequencing experiment data sets
#'
#' @format A data frame containing information for each replicate sample
#'
#' The object contains:
#' \describe{
#' \item{\code{sample}:}{Character, sample IDs.}
#' \item{\code{Gender}:}{Character, gender of mouse - all female.}
#' \item{\code{HTO}:}{Character, hashtag oligo assignments.}
#' \item{\code{ncells}:}{Integer, number of cells (post-QC) per sample.}
#' }
#'
#' @examples head(DropletMetadata)
#'
#' @references
#' Baran-Gale J, Morgan MD, et al. (2020)
#' Ageing compromises mouse thymus function and remodels epithelial cell differentiation
#' \emph{eLife} 9:e56221.
#'
#' @author Mike Morgan
#' @name DropletMetadata
#' @rdname DropletMetadata
#' @export
DropletMetadata <- read.table(
    text =
        "sample,Gender,HTO,ncells
ZsG_1stRun1,female,Wk1_ZsGp,5160
ZsG_1stRun1,female,Wk4_ZsGp,3902
ZsG_1stRun1,female,Wk16_ZsGp,3798
ZsG_1stRun2,female,Wk1_ZsGp,3360
ZsG_1stRun2,female,Wk4_ZsGp,2355
ZsG_1stRun2,female,Wk16_ZsGp,4199
ZsG_2ndRun1,female,Wk1_ZsGn,2090
ZsG_2ndRun1,female,Wk1_ZsGp,1927
ZsG_2ndRun1,female,Wk4_ZsGn,1870
ZsG_2ndRun1,female,Wk4_ZsGp,2759
ZsG_2ndRun1,female,Wk16_ZsGn,668
ZsG_2ndRun1,female,Wk16_ZsGp,3060
ZsG_2ndRun2,female,Wk1_ZsGn,2004
ZsG_2ndRun2,female,Wk1_ZsGp,1893
ZsG_2ndRun2,female,Wk4_ZsGn,1830
ZsG_2ndRun2,female,Wk4_ZsGp,2721
ZsG_2ndRun2,female,Wk16_ZsGn,736
ZsG_2ndRun2,female,Wk16_ZsGp,2894
ZsG_3rdRun1,female,Wk1_ZsGn,1409
ZsG_3rdRun1,female,Wk1_ZsGp,1854
ZsG_3rdRun1,female,Wk4_ZsGn,1403
ZsG_3rdRun1,female,Wk4_ZsGp,2368
ZsG_3rdRun1,female,Wk16_ZsGn,1055
ZsG_3rdRun1,female,Wk16_ZsGp,1926
ZsG_3rdRun2,female,Wk1_ZsGn,1475
ZsG_3rdRun2,female,Wk1_ZsGp,2270
ZsG_3rdRun2,female,Wk4_ZsGn,1827
ZsG_3rdRun2,female,Wk4_ZsGp,3083
ZsG_3rdRun2,female,Wk16_ZsGn,1072
ZsG_3rdRun2,female,Wk16_ZsGp,2212",
    header = TRUE,
    sep = ",",
    stringsAsFactors = FALSE)
