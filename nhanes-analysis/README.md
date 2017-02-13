# NHANES Analysis
In this activity, you'll practice applying **sample weights** to survey data in order to calculate nationally representative averages. In order to do, you'll do the following:

1. Review NHANES [documentation](https://www.cdc.gov/nchs/tutorials/nhanes/SurveyDesign/Weighting/intro_i.htm) on survey weights

2. Take the sum of the weighting column `wtint2yr` - what is this number?

3. Create a survey design that indicates the `id`, `strata`, and `weights`

4. Using the [codebook](https://wwwn.cdc.gov/Nchs/Nhanes/2013-2014/ALQ_H.htm), find the question that asks about 12+ drinks in the last year

5. Using the `table` function get a table of 12+ drinks in the last year responses

6. Using the `prop.table` function, get the proportions of each response

7. Using the `svytable` function, compute the survey weighted responses to the same question

8. Using `prop.table` in conjunction with `svytable`, compute the survey weighted proportions

## Data Prep
Below is information on where the data was downloaded from:

- Most recent data is from [here](https://wwwn.cdc.gov/Nchs/Nhanes/Search/Nhanes13_14.aspx)
- Alcohol data (the desired data) is inside the **Questionnaire** [tab](https://wwwn.cdc.gov/Nchs/Nhanes/Search/DataPage.aspx?Component=Questionnaire&CycleBeginYear=2013)
- Codebook for alcohol use is [here](https://wwwn.cdc.gov/Nchs/Nhanes/2013-2014/ALQ_H.htm)
