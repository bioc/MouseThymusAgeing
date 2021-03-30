#' @importFrom ExperimentHub ExperimentHub
#' @importFrom SingleCellExperiment SingleCellExperiment
#' @importFrom BiocGenerics sizeFactors
#' @importFrom BiocGenerics sizeFactors<-
#' @importClassesFrom S4Vectors DataFrame
#' @importFrom S4Vectors List
#' @importFrom methods as
#' @importFrom SummarizedExperiment rowData
#' @importFrom SummarizedExperiment colData
#'
#' @export
.getProcOrRaw <- function(dataset, version, samples){
    hub <- ExperimentHub()
    host <- file.path("MouseThymusAgeing", dataset)

    #get rowdata
    ver <- .fetch_version(version, "rowData")
    rowdata <- hub[hub$rdatapath==file.path(host, ver, "rowdata.rds")][[1]]

    # Temporary function for data extraction
    EXTRACTOR <- function(target, version_name) {
        ver <- .fetch_version(version, version_name)
        lapply(samples, function(i){
            hub[hub$rdatapath==file.path(host, ver, sprintf("%s-%s.rds", target, i))][[1]]
        })
    }

    count_list <- EXTRACTOR("counts-processed")
    assays <- list(counts=do.call(cbind, count_list))

    coldata_list <- EXTRACTOR("coldata", "colData")
    sf_list <- EXTRACTOR("sizefac", "sizefactors")
    reducedDims_list <- EXTRACTOR("reduced-dims", "reducedDims")

    # Handle data with multiple reducedDims
    reducedDims_names <- names(reducedDims_list[[1]])
    reducedDims_combined <- lapply(reducedDims_names, function(x){
        do.call(rbind, lapply(reducedDims_list, function(y) y[[x]]))
    })
    names(reducedDims_combined) <- reducedDims_names

    sce <- SingleCellExperiment(
        assays=assays,
        colData=as(do.call(rbind, coldata_list), "DataFrame"),
        reducedDims=reducedDims_combined,
        rowData=rowdata
    )
    sizeFactors(sce) <- unlist(sf_list)
    rownames(sce) <- rowData(sce)$Geneid
    colnames(sce) <- colData(sce)$CellID
    return(sce)
}

#from Aaron Lun's celldex with modification
#for consistent usage in-package, use "base" as element 1, anything
#with a different version gets an entry in version in .getProcOrRaw
#there should be in {counts,spliced,raw_counts,
#sizefactors,rowData,colData,reducedDims}
#spliced represents version for all spliced count measurements
.fetch_version <- function(version, field) {
    opt <- version[[field]]
    if (is.null(opt)) {
        version[[1]]
    } else {
        opt
    }
}
