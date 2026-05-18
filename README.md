Title

Gut Microbiota as a Potential Therapeutic Target and Diagnostic Biomarker for Autoimmune Thyroid Disease: A Next-Generation Sequencing Analysis of Graves’ Disease

Background

Autoimmune thyroid diseases (AITDs), including Graves’ disease (GD), are characterized by immune dysregulation that affects thyroid function. Emerging evidence suggests that alterations in gut microbiota composition may contribute to immune imbalance and disease progression. Since the gut microbiome plays an essential role in immune modulation, identifying microbial signatures associated with Graves’ disease could help establish potential diagnostic biomarkers and therapeutic targets.

This project investigates gut microbial differences between individuals with Graves’ disease and healthy controls using next-generation sequencing (NGS) microbiome data from the GMRepo project PRJNA450230, titled “Gut microbiota as a potential therapeutic target and diagnostic biomarker for AITD (autoimmune thyroid disease)”.

Aim

The aim of this project is to identify bacterial species associated with Graves’ disease by comparing microbial abundance profiles between disease and healthy groups.

Objectives
To preprocess gut microbiome sequencing data obtained from GMRepo (PRJNA450230).
To compare microbial abundance between Graves’ disease patients and healthy individuals.
To identify bacterial taxa significantly associated with Graves’ disease using multivariable statistical modeling.
To evaluate whether identified microbial species could serve as potential biomarkers for disease diagnosis or therapeutic intervention.
Dataset Description

The dataset consists of microbiome sequencing profiles from gut samples:

1206 bacterial species/features (columns) representing microbial abundance.
Metadata including:
Number of reads
Phenotype (Graves’ disease vs Healthy)

The study contains approximately 10 samples per group, making it a relatively small pilot dataset.

Methodology

The statistical analysis was performed using MaAsLin2 (Multivariable Association with Linear Models), which identifies associations between microbial abundance and metadata while accounting for sample non-independence.

The model included:

Fixed Effect
associated_phenotype
Graves disease vs Healthy control
Reference Group
Healthy individuals
Random Effect
subject
Used to account for repeated measurements or sample dependence when applicable.
Feature Filtering

To reduce noise and avoid sparse features:

Minimum prevalence = 0.1
Features present in at least 10% of samples were retained.
Minimum abundance = 0.0001
Very rare taxa were removed.
Key Finding

One significantly associated species identified was:

Anaerostipes butyraticus

The species demonstrated a positive correlation with Graves’ disease:

Coefficient: 1.714554
Standard error: 0.238043
p-value: 1.06 × 10⁻⁶
q-value: 0.000171

These findings suggest that Anaerostipes butyraticus may be more abundant or prevalent in individuals with Graves’ disease than healthy controls and may contribute to disease-associated microbial dysbiosis.

Conclusion

This study identified microbial alterations associated with Graves’ disease using NGS gut microbiome data. Although Anaerostipes butyraticus showed significant association with disease phenotype, previous genus-level studies have reported negative correlations between Anaerostipes and Graves’ disease, emphasizing the need for further investigation. Due to the small sample size, larger validation studies are required before causal conclusions can be established.
