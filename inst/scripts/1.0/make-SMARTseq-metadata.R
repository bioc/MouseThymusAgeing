info <- data.frame(
    Title = sprintf("SMARTseq %s",
                    c(sprintf("processed counts (day %i)", c(1:5)),
                      "rowData",
                      sprintf("colData (day %i)", c(1:5)),
                      sprintf("size factors (day %i)", c(1:5)),
                      sprintf("reduced dimensions (day %i)", c(1:5)))
    ),
    Description = sprintf("%s for the mouse ageing thymus SMART-seq2 single-cell RNA-seq dataset",
                          c(sprintf("Processed counts for day %i", c(1:5)),
                            "Per-gene metadata for all days",
                            sprintf("Per-cell metadata for day %i", c(1:5)),
                            sprintf("Size factors for day %i", c(1:5)),
                            sprintf("Reduced dimensions for day %i", c(1:5)))
    ),
    RDataPath = c(
        file.path("MouseThymusAgeing", "SMARTseq", "1.0.0",
                  c(sprintf("counts-processed-day%i.rds", c(1:5)),
                    "rowdata.rds",
                    sprintf("coldata-day%i.rds", c(1:5)),
                    sprintf("sizefactors-day%i.rds", c(1:5)),
                    sprintf("reduced-dims-day%i.rds", c(1:5)))
    )),
    BiocVersion="3.12",
    Genome="mm10",
    SourceType="TXT",
    SourceUrl=c(
        rep(
            c("https://content.cruk.cam.ac.uk/jmlab/thymus_data"),
            c(5 * 4 + 1))
    ),
    SourceVersion=paste(
        c(rep("QC_counts.tsv.gz", 5),
          "Gene_info.tsv",
          rep("meta_data.tsv.gz", 5),
          rep("size_factors.tsv.gz", 5),
          rep("reduced_dims.tsv.gz", 5)
        ),
        sep=";"
    ),
    Species="Mus musculus",
    TaxonomyId="10090",
    Coordinate_1_based=TRUE,
    DataProvider="Mike Morgan",
    Maintainer="Mike Morgan <michael.morgan@cruk.cam.ac.uk>",
    RDataClass="character",
    DispatchClass="Rds",
    stringsAsFactors = FALSE
)

write.csv(file="../../extdata/metadata-SMARTseq.csv", info, row.names=FALSE)
