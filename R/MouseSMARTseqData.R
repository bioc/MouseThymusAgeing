#' Mouse ageing thymus droplet single-cell RNA-sequencing data
#'
#' Obtain the processed counts for the mouse ageing thymus droplet scRNA-seq data set.
#'
#' @param samples Integer or character vector specifying the samples for which data (processed or raw) should be obtained.
#' If \code{NULL} (default), data are returned for all (36) samples.

#' @return
#' A \linkS4class{SingleCellExperiment} is returned containing processed data from selected samples.
#'
#' List elements are named after the corresponding sample.
#'
#' @details
#' This function downloads the data for the mouse ageing thymus droplet scRNA-seq
#' data from Baran-Gale et al. (2020).
#'
#' The dataset contains 6 10X Genomics samples. The available samples are:
#' \code{ZsG_1Run1, ZsG_1Run2, ZsG_2Run1, ZsG_2Run2, ZsG_3Run1, ZsG_3Run2}.
#'
#'
#' In the data, cell-containing libraries have already been identified in each sample
#' using the \code{emptyDrops} function from \pkg{DropletUtils}.
#' The count matrix contains the raw count vectors for the cells called from all samples in this manner.
#' Size factors were computed using the \code{computeSumFactors} function from \pkg{scran}.
#' The column metadata for called cells contains:
#' \describe{
#' \item{\code{Cell}:}{Character, unique cell identifier across all samples.}
#' \item{\code{SampID}:}{Character, Short unique identified for the experimental sample.}
#' \item{\code{CellOrigin}:}{Character, experimental sample identifier}
#' \item{\code{SumFactor}:}{Numeric, Estimated normalized factor across all cells and experimental samples.}
#' \item{\code{Class}:}{Character, Either Singlet or Multiplet Identifies cells called as a multiplet from hash-tag demultiplexing.}
#' \item{\code{HTO}:}{Character, Hashtag oligo (HTO) character identifier, used for multiplexing experimental samples.}
#' \item{\code{Age}:}{Character, Age of mouse at the time of doxycycline treatment. Age at time of data acquisition is +4weeks.}
#' \item{\code{SortType}:}{Character, Flow cytometry sorting group, either ZsGreen+ (ZsGp) or ZsGreen- (ZsGn).}
#' \item{\code{Cluster}:}{Integer, Cluster to which cells were assigned based on using the Walktrap community detection algorithm on a k-NN graph.}
#' \item{\code{ClusterAnnot}:}{Character, Annotation assigned to cluster.}
#' }
#' Reduced dimension representations of the data are also available in the \code{reducedDims} slot of the SingleCellExperiment object.
#' The \code{SingleCellExperiment} object has row metadata that contains the Ensembl ID \code{ensembl_gene_id} and Gene
#' symbols \code{external_gene_name} for each gene, as well as gene chromosome, strand and both start and end positions.
#'
#' @author Mike Morgan, based on originals by Aaron Lun & Jonathan Griffiths
#' @examples
#' drop.data <- MouseSMARTseqData(samples = "ZsG_1Run1")
#'
#'
#' @references
#' Baran-Gale J, Morgan MD, et al. (2020)
#' Ageing compromises mouse thymus function and remodels epithelial cell differentiation
#' \emph{eLife} 9:e56221.
#'
#' @export
#' @importFrom ExperimentHub ExperimentHub
#' @importFrom SingleCellExperiment SingleCellExperiment
#' @importFrom BiocGenerics sizeFactors
#' @importClassesFrom S4Vectors DataFrame
#' @importFrom methods as
MouseSMARTseqData <- function(samples=NULL){
    samp.names <- paste0("day", c(1:5))

    versions <- list(base="1.0.0")

    if(any(!samples %in% samp.names)){
        warning(paste0("Incorrect samples found. Should be in list:", paste(samp.names, collapse=",")))
    }

    if(length(intersect(samples, samp.names)) > 0){
        MouseThymusAgeing:::.getProcOrRaw("SMARTseq", versions, samples)
    } else{
        stop(paste0("No matching samples found. Must be in list:", paste(samp.names, collapse=",")))
    }
}
