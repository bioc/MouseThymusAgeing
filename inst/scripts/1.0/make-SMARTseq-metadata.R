info <- data.frame(
    Title = sprintf("SMARTseq %s",
                    c(sprintf("processed counts (day %i)", c(1:5)),
                      "rowData",
                      sprintf("colData (day %i)", c(1:5)),
                      sprintf("size factors (day %i)", c(1:5)),
                      sprintf("reduced dimensions (day %i)", c(1:5)),
                      sprintf("raw counts (day %i)", c(1:5)))
    ),
    Description = sprintf("%s for the mouse ageing thymus single-cell RNA-seq dataset",
                          c(sprintf("Processed counts for day %i", c(1:5)),
                            "Per-gene metadata for all days",
                            sprintf("Per-cell metadata for day %i", c(1:5)),
                            sprintf("Size factors for day %i", c(1:5)),
                            sprintf("Reduced dimensions for day %i", c(1:5)),
                            sprintf("Raw counts for day %i", c(1:5)))
    ),
    RDataPath = c(
        file.path("MouseThymusAgeing", "SMARTseq", "1.0.0",
                  c(sprintf("counts-processed-day%i.rds", c(1:5)),
                    "rowdata.rds",
                    sprintf("coldata-day%i.rds", c(1:5)),
                    sprintf("sizefactors-day%i.rds", c(1:5)),
                    sprintf("reduced-dims-day%i.rds", c(1:5)),
                    sprintf("counts-raw-day%i.rds", c(1:5)))
    )),
    BiocVersion="3.12",
    Genome="mm10",
    SourceType="TXT",
    SourceUrl=c(
        rep(
            c("https://content.cruk.cam.ac.uk/jmlab/thymus_data"),
            c(5 * 5 + 1))
    ),
    SourceVersion=paste(
        c(rep("raw_counts.mtx.gz", 5),
          "genes.tsv.gz",
          rep("meta.tab.gz", 5),
          rep("sizefactors.tab.gz", 5),
          rep("pcas.rds", 5),
          sprintf("sample_%i_counts.tsv.gz", c(1:5))
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

write.csv(file="../../inst/extdata/metadata-SMARTseq.csv", info, row.names=FALSE)
