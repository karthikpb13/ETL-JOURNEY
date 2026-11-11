
# Exploratory Data Analysis (EDA)

## What is EDA?

Exploratory Data Analysis (EDA) is the process of investigating, summarizing, visualizing, and cleaning a dataset to understand its structure, patterns, relationships, and potential problems before building models or making decisions based on the analysis.

## Steps of EDA

1. Quick Data Audit
2. Data Cleansing Basics
3. Univariate Analysis
4. Bivariate Analysis
5. Multivariate Analysis
6. Feature Engineering and Transformation Ideas
7. Summarize, Visualize, and Document Findings (Report + Reproducible Notebook)
8. Decide Next Steps (Modeling, Data Collection, Solving Business Problems, or Domain Follow-up)

## Types of EDA

- Univariate Analysis
- Bivariate Analysis
- Multivariate Analysis

The difference between them lies in the number of features being analyzed.

### Univariate Analysis

If we perform analysis on a single feature at a time, it is called Univariate Analysis.

### Bivariate Analysis

If we analyze two features at the same time to understand their relationship, it is called Bivariate Analysis.

### Multivariate Analysis

If we analyze more than two variables at the same time to understand their relationships and interactions, it is called Multivariate Analysis.

---

## Univariate Data Analysis

A feature can be Numeric, Categorical, Date/Time, or Text.

### 1. Numeric Variables

- **Summary Statistics:** Count, Mean, Median, Standard Deviation, Minimum, Maximum, Quartiles, IQR, and Skewness.
- **Visualizations:** Histogram, Boxplot, and Density Plot.
- Check for multimodality (multiple peaks), heavy tails, and outliers.

### 2. Categorical Variables

- **Frequency Counts:** Check the frequency of each category in the dataset.
- **Visualizations:** Bar Charts and Pareto Charts.
- Check for rare categories (low-frequency levels) and cardinality.

### 3. Date/Time Variables

- Check for time range, gaps, and time granularity.
- **Visualizations:** Time Series Plot, Seasonality Checks, Heatmap (e.g., Day vs. Hour), and Bar Chart (Month/Year).

### 4. Text Variables

- Token counts, most common words, and text length distributions.
- **Visualizations:** Histogram of text lengths, Word Cloud, and Bar Chart of Top Words.

---

## Bivariate Analysis

We perform Bivariate Analysis to understand the relationship between two features.

The two features can be:

### 1. Numeric - Numeric

- Scatter Plots
- Correlation Coefficient
- Regression Line to visualize trends.

### 2. Numeric - Categorical

- Boxplots or Violin Plots grouped by category.
- Compute group means and medians.
- ANOVA to identify statistically significant differences.

### 3. Categorical - Categorical

- Contingency Tables
- Stacked Bar Charts
- Chi-square Test of Independence.

### 4. Time Series Relationships

- Lag Plots
- Autocorrelation (ACF/PACF)
- Rolling Averages.

---

## Multivariate Analysis

We check the relationships between multiple variables and understand how they affect each other.

- **Correlation Heatmap:** Visualize correlations between numeric variables.
- **Interaction Plots:** Identify interactions between two features affecting the target variable.
- **Dimensionality Reduction:** PCA, UMAP, and t-SNE to inspect clusters or underlying data structures.
- **Clustering:** Identify natural groups within the dataset.
- **Regression / Predictive Relationships:** Understand how multiple variables collectively influence an outcome.
