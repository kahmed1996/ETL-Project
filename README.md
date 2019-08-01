# ETL-Project

We are attempting to combine Census demogaphic data with Cuyahoga county precinct-level turnout data to determine which demographic factors are correlated with increased likelihood to vote.

To do this we will combine a csv from the County elections board, which has precinct-level data on which registered voters voted and who did not; with the US Census block-level and city-level data for the county. Block level data will be correlated with electoral precincts by use of the following Github project:

Extraction

To do this we combined a csv from the County elections board, which has precinct-level data on which registered voters voted and who did not; with the US Census block-level and city-level data for the county. Block level data will be correlated with electoral precincts by use of the following Github project:

 The sources for our dataset are as follows:
We used 1 dataset from the public platform Kaggle. The data here is taken from the DP03 and DP05 tables of the 2015 American Community Survey 5-year estimates. The full datasets and much more can be found at the American Factfinder website.

acs2015_census_tract_data.csv: Data for each census tract in the US

Transformation

Our first steps in cleaning up the datasets involved figuring out which variables were not relevant.

Load

The last step was to transfer our final output into a Database. We created a database and respective tables to match the columns from the final Panda’s Data Frame using Postgres and then connected to the database using SQLAlchemy and loaded the result.

https://github.com/mggg/ohio-precincts

In case that is not workable we will endeavor to get data on which blocks are in which precincts from the County. If that does not work we will use city-level data for the suburbs.
The github pages can be accessed at https://kahmed1996.github.io/ETL-Project/
