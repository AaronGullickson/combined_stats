Below is a list of commands that we will use this term. This list should be comprehensive but it is possible that a few commands have been missed. We will update the list if we discover missing items. 

You can view a help file in *RStudio* for each command by searching for the command name in the help tab in the lower right panel. You can also just type the name of the command preceded by a "?" into the console. For example, if you wanted to understand how `barplot` works, type: 

```r
?barplot
```

### Plotting
- **abline**: add an OLS regression line to an existing scatterplot
- **barplot**: graph the distribution of a categorical variable or compare distributions across categories of another variable
- **boxplot**: graph the distribution of a quantitative variable or compare distributions across categories of another variable
- **histogram**: graph the distribution of a quantitative varible
- **legend**: add a legend to an existing plot
- **par**: adjust parameters (e.g. margin sizes) for a plot. To adjust margins `par(mar=c(bottom,left,top,right))` where bottom, left, top, right are numbers. 
- **plot**: graph a scatterplot of two quantitative variables


### Univariate and Bivariate Statistics
- **mean**: calculate the mean of a quantitative variable
- **median**: calculate the median of a quantitative variable
- **sd**: calculate the standard deviation of a quantitative variable
- **IQR**: calculate the interquartile range of a quantitative variable
- **quantile**: calculate percentiles of a distribution
- **table**: calculate the frequencies of a categorical variable
- **prop.table**: calculate proportions from a one-way or two-way table
- **mar.table**: calculate marginal frequencies from a two-way table
- **tapply**: calculate a statistic for a quantitative variable across the categories of a categorical variable
- **cor**: calculate the correlation coefficient between two quantitative variables

### Statistical Inference
- **qt**: Calculate the t-value needed for a confidence interval
- **pt**: Calculate the p-value for a hypothesis test

### OLS Regression Models
- **lm**: Run an OLS regression model