samp.names <- c("ZsG_1Run1", "ZsG_1Run2", "ZsG_2Run1", "ZsG_2Run2", "ZsG_3Run1", "ZsG_3Run2")

info <- data.frame(
    Title = sprintf("Droplet %s",
                    c(sprintf("processed counts (sample %s)", samp.names),
                      "rowData",
                      sprintf("colData (sample %s)", samp.names),
                      sprintf("size factors (sample %s)", samp.names),
                      sprintf("reduced dimensions (sample %s)", samp.names))
    ),
    Description = sprintf("%s for the mouse ageing thymus ZsGreen droplet single-cell RNA-seq dataset",
                          c(sprintf("Processed counts for sample %s", samp.names),
                            "Per-gene metadata for all samples",
                            sprintf("Per-cell metadata for sample %s", samp.names),
                            sprintf("Size factors for sample %s", samp.names),
                            sprintf("Reduced dimensions for sample %s", samp.names))
    ),
    RDataPath = c(
        file.path("MouseThymusAgeing", "Droplet", "1.0.0",
                  c(sprintf("counts-processed-%s.rds", samp.names),
                    "rowdata.rds",
                    sprintf("coldata-%s.rds", samp.names),
                    sprintf("sizefac-%s.rds", samp.names),
                    sprintf("reduced-dims-%s.rds", samp.names))
        )),
    BiocVersion="3.13",
    Genome="mm10",
    SourceType="TXT",
    SourceUrl=c(
        rep(
            c("https://content.cruk.cam.ac.uk/jmlab/thymus_data"),
            c(6 * 4 + 1))
    ),
    SourceVersion=paste(
        c(paste(samp.names, "raw_counts.mtx.gz", sep="_"),
          "genes.tsv.gz",
          rep("ZsG_meta_data.tsv.gz", 6),
          rep("sizefactors.tsv.gz", 6),
          rep("ZsG_PCs.tsv.gz", 6)
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

write.csv(file="../../extdata/metadata-Droplet.csv", info, row.names=FALSE)
