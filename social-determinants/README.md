# Social Determinants

In this activity, you'll use data from [this paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3134519/) to calculate the **number of deaths** attributable to a variety of social determinants. The data included has the following columns:

- `level`: The level at which the social determinant was evaluated (`individual` or `area`)
- `determinant`: The social determinant being evaluated (`Low Education`, `Poverty`, etc.)
- `age`: The age group being evaluated (`25 - 64`, `65+`, or `all.ages`)
- `relative.risk`: The relative risk of death given exposure to the social determinant
- `percent.prevalence`: The **percentage** prevalence in the population (hint: this may not be in the desired unit for your calculation)
- `total.deaths`: the total deaths in that age-group

You should calculate the **number of deaths** attributable to each social determinants by doing the following:

- Using a the prevalence based formula, calculate the **percentage** of deaths attributable to the social determinant (**PAF**)
- Based on the attributable fraction, calculate the **number** of deaths attributable to the social determinant
