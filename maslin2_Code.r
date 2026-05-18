# Install packages if needed
install.packages("BiocManager")

BiocManager::install("Maaslin2")

install.packages(c(
  "tidyverse",
  "data.table",
  "pheatmap"
))
library(Maaslin2)
library(tidyverse)
library(data.table)
library(pheatmap)

# Species abundance table
samples_df <- read.csv(
  "samples_df.csv",
  row.names = 1,
  check.names = FALSE
)

# Metadata
input_metadata <- read.csv(
  "metadata.csv",
  row.names = 1
)

# Check dimensions
dim(samples_df)
dim(input_metadata)

head(samples_df[,1:5])
head(input_metadata)

# Ensure sample IDs match
all(rownames(samples_df) %in% rownames(input_metadata))

# Reorder metadata to match samples
input_metadata <- input_metadata[
  rownames(samples_df),
]


input_metadata$associated_phenotype <-
  factor(
    input_metadata$associated_phenotype,
    levels = c("health", "graves disease")
  )

input_metadata$subject <-
  factor(input_metadata$subject)


fit_data_filter <- Maaslin2(
  input_data = samples_df,
  input_metadata = input_metadata,

  normalization = "NONE",
  transform = "LOG",

  output = "Prevalence_filter",

  fixed_effects = c("associated_phenotype"),

  reference = c(
    "associated_phenotype,health"
  ),

  random_effects = c("subject"),

  min_prevalence = 0.1,
  min_abundance = 0.0001
)


results <- read.table(
  "Prevalence_filter/all_results.tsv",
  header = TRUE,
  sep = "\t"
)

# Significant taxa
sig_results <- results %>%
  filter(qval < 0.05)

sig_results


anaerostipes_result <- results %>%
  filter(feature == "Anaerostipes.butyraticus")

anaerostipes_result

#Visualize Species Abundance
species_name <- "Anaerostipes.butyraticus"

plot_df <- data.frame(
  abundance = samples_df[, species_name],
  phenotype = input_metadata$associated_phenotype
)
#volcano plot
ggplot(plot_df,
       aes(x = phenotype,
           y = abundance)) +
  geom_boxplot() +
  geom_jitter(width = 0.2) +
  labs(
    title = "Anaerostipes butyraticus abundance",
    x = "Phenotype",
    y = "Relative abundance"
  ) +
  theme_minimal()

#heatmap
significant_features <- sig_results$feature

heatmap_data <- samples_df[
  ,
  significant_features,
  drop = FALSE
]

pheatmap(
  scale(heatmap_data),
  annotation_row =
    input_metadata["associated_phenotype"],
  show_rownames = FALSE,
  fontsize_col = 8
)
