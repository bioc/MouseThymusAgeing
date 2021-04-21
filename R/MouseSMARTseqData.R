#' Mouse ageing thymus SMART-seq2 single-cell RNA-sequencing data
#'
#' Obtain the processed counts for the mouse ageing thymus SMART-seq2 scRNA-seq data set.
#'
#' @param samples Integer or character vector specifying the samples for which data should be obtained.
#' If \code{NULL} (default), data are returned for all (5) samples.

#' @return
#' A \linkS4class{SingleCellExperiment} is returned containing processed data from selected samples.
#'
#' List elements are named after the corresponding sample.
#'
#' @details
#' This function downloads the data for the mouse ageing thymus droplet scRNA-seq
#' data from Baran-Gale et al. (2020).
#'
#' The dataset contains 5 different SMART-seq2 samples, split by the day of acquisition. The available samples are:
#' \code{day1, day2, day3, day4, day5}.
#'
#' In the data, poor-quality cells have already been removed based on insufficient sequencing depth, high mitochondrial
#' content, excessive proportion of expression from ERCC spike-in and ribosomal genes. Exact details can be found in the
#' methods section of Baran-Gale et al. (2020).
#'
#' The count matrix contains the raw count vectors for the cells that pass QC.
#' Size factors were computed using the \code{computeSumFactors} function from \pkg{scran}.
#' The column metadata for called cells contains:
#' \describe{
#' \item{\code{CellID}:}{Character, unique cell identifier across all samples.}
#' \item{\code{ClusterID}:}{Numeric, The cluster to which cells were assigned based on community detection on a shared-NN grpah.}
#' \item{\code{Position}:}{Character, Plate position of the index-sorted cell (384 well plate format).}
#' \item{\code{PlateID}:}{Character, A unique ID for the 384-well plate into which each cell was index-sorted.}
#' \item{\code{Column}:}{Integer, A value from 1-24 corresponding to the plate column.}
#' \item{\code{Row}:}{Character, A value from A-P corresponding to the plate row.}
#' \item{\code{SortType}:}{Character, Flow cytometry sorting group, mTEClo, mTEChi, gmTEC or cTEC.}
#' \item{\code{SortDay}:}{Integer, Day on which cells were sorted - corresponds to the sample IDs for downloading data and replicate.}
#' \item{\code{Age}:}{Character, Mouse age at the time of data acquisition.}
#' \item{\code{SubType}:}{Character, Annotation assigned to clusters.}
#' \item{\code{SizeFactor}:}{Numeric, Estimated normalized factor across all cells and experimental samples.}
#' }
#' Reduced dimension representations of the data are also available in the \code{reducedDims} slot of the SingleCellExperiment object.
#' The \code{SingleCellExperiment} object has row metadata that contains the Ensembl ID \code{ensembl_gene_id} and Gene
#' symbols \code{external_gene_name} for each gene, as well as gene chromosome, strand and both start and end positions.
#'
#' @author Mike Morgan, based on original code by Aaron Lun & Jonathan Griffiths
#' @examples
#' smart.data <- MouseSMARTseqData(samples = "day1")
#' smart.data
#'
#' @references
#' Baran-Gale J, Morgan MD, et al. (2020)
#' Ageing compromises mouse thymus function and remodels epithelial cell differentiation
#' \emph{eLife} 9:e56221.
#' @author Mike Morgan
#' @name MouseSMARTseqData
#' @rdname MouseSMARTseqData
#'
#' @export
#' @importFrom ExperimentHub ExperimentHub
#' @importFrom SingleCellExperiment SingleCellExperiment
#' @importFrom BiocGenerics sizeFactors
#' @importClassesFrom S4Vectors DataFrame
#' @importFrom methods as
MouseSMARTseqData <- function(samples=NULL){
    samp.names <- paste0("day", c(1:5))
    if(is.null(samples)){
        samples <- samp.names
    }

    versions <- list(base="1.0.0")

    if(!is.null(samples) & any(!samples %in% samp.names)){
        warning(paste0("Incorrect samples found. Should be in list:",
                       paste(samp.names, collapse=",")))
    }

    if(length(intersect(samples, samp.names)) > 0){
        MouseThymusAgeing:::.getProcOrRaw("SMARTseq", versions, samples)
    } else{
        stop(paste0("No matching samples found. Must be in list:",
                    paste(samp.names, collapse=",")))
    }
}
