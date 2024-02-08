# ASK

​	In this data analysis we will explore the question of gender equality as it relates to sheltered and unsheltered homeless people. 

Specifically we will be looking at:

**Are Non-Binary and Transgender people underserved by shelters in 2023?**

**What are the trends in the last five years in regards to the sheltering of Non-Binary and Transgender People?**

# Prepare/Process

First i found and imported PIT(point-in-time) Data by state at https://www.hudexchange.info/resource/3031/pit-and-hic-data-since-2007/ where it is officially housed. 

I created a copy of each sheet I needed starting from 2023-2019 and added a year field in order to conduct historical trend analysis 

I noticed immediately that the column names were much longer than the 64 character limit of Mysql and confirmed this with the =len() function. After trying for some time to truncate the longer names using a combination of find and replace and the =left() function I ultimately decided it was best to create a pivot table for each sheet I needed and only include the columns I needed for my analysis.

I first used find and replace to replace all instances of “Gender is not singularly male or female” with “Non_Binary.” I then used find and replace to replace all dashes and spaces with underscores and to remove any instance of multiple underscores and commas in order to make SQL queries easier.

I then familiarized myself with each column in order to choose what would be best to go into each pivot table. After creating each pivot table I saved them to a folder and imported them into Mysql and combined the data for all 5 tables using the import wizard. 

I then queried the data filtering for the state of California and conducted data integrity checks comparing the values in each field to the raw data. 

While comparing the data I Immediately noticed a difference in the 2021 data compared to the data in the years before and after. After conducting some research I learned that according to the United States Interagency Council on Homelessness 2021 PIT counts were greatly affected by Covid-19 with many CoC’s unable to conduct unsheltered counts. In light of this I decided to remove 2021 data from my analysis by using the WHERE NOT statement.

 I divided the total sheltered by overall homeless for each gender to get the percent sheltered and then created a common table expression to calculate growth per year of overall homeless and total sheltered homeless using the lag function.You can view the full sql code [https://github.com/CodyFHPearson/2019-2023-PIT-Gender-Analysis/blob/master/Pit.sql]"here"



