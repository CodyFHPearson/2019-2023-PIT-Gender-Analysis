

# Introduction

This data analysis was done was done as the capstone project for Google Data Analytics course on Coursera.  This project follows the 6 steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act. 

During the process of selecting a topic for the project, I knew that I needed a subject matter that not only was unique to me but also possessed real-world implications. When I expressed this to a friend they gave me the idea for this project. Working with real world data has its own unique benefits one of them being as this data was already well maintained and put together there was  little to no cleaning necessary. However, as a person new to data analysis it also presented unique challenges that I had to find solutions for on my own. This lead to me learning a ton during this project, and I will continue to update it and improve on it as I gain experience and knowledge in the field of data analytics.



# ASK

In this data analysis we will explore the question of gender equality as it relates to sheltered and unsheltered homeless people. 

Specifically we will be looking at:

##### **Are Non-Binary and Transgender people underserved by shelters in 2023 in California?**

##### What are the trends in the last five years in regards to the sheltering of non-binary and transgender people in California?

# Prepare/Process

First i found and imported PIT(point-in-time) Data by state at https://www.hudexchange.info/resource/3031/pit-and-hic-data-since-2007/ where it is officially housed. 

I created a copy of each sheet I needed starting from 2023-2019 and added a year field in order to conduct historical trend analysis. 

I noticed immediately that the column names were much longer than the 64 character limit of MySQL and confirmed this with the =len() function. After trying for some time to truncate the longer names using a combination of find and replace and the =left() function I ultimately decided it was best to create a pivot table for each sheet I needed and only include the columns that were appropriate for my analysis.

I first used find and replace to replace all instances of “Gender is not singularly male or female” with “Non_Binary.” I then used find and replace to replace all dashes and spaces with underscores and to remove any instance of multiple underscores and commas in order to make SQL queries easier.

I then familiarized myself with each column in order to choose what would be best to go into each pivot table. After creating each pivot table I saved them to a folder and imported them into MySQL, and combined the data for all 5 tables using the import wizard. 

I then queried the data filtering for the state of California and conducted data integrity checks comparing the values in each field to the raw data. 

While comparing the data I Immediately noticed a difference in the 2021 data compared to the data in the years before and after. After conducting some research I learned that according to the United States Interagency Council on Homelessness 2021 PIT counts were greatly affected by Covid-19 with many CoC’s unable to conduct unsheltered counts. In light of this I decided to remove 2021 data from my analysis by using the WHERE NOT statement.



# Analyze and Share

 First in MySQL, I divided the total sheltered by overall homeless for each gender to get the percent sheltered, and then created a common table expression to calculate growth per year of overall homeless and total sheltered homeless using the lag function.

You can view the full SQL code [here](https://github.com/CodyFHPearson/2019-2023-PIT-Gender-Analysis/blob/master/Pit.sql)

After I exported the data in csv format I uploaded it into Tableau for further analysis and visualization.

![](https://github.com/CodyFHPearson/2019-2023-PIT-Gender-Analysis/blob/master/percent_shelt_overall_v_shelt_2023.png)

In this first bar graph we see the percentage of each gender sheltered in 2023 in California with transgender and non-binary people being sheltered the least.  In the bottom two pie charts we can see that these two groups are sheltered at a lower proportion than their overall population would dictate. In a completely equitable world these two pie charts would be identical.

![](https://github.com/CodyFHPearson/2019-2023-PIT-Gender-Analysis/blob/master/Percentage_Each_Gender_Sheltered_2019-2023_V2.png)

In this line chart we see the the shelter trends of each gender from 2019-2023 in California. Please note that 2021 is placeholder in this graph as the data from that year was unreliable as stated earlier. Each genders percent sheltered has increased during the given time period. However, transgender and non-binary homeless people percent sheltered has increased far more than that of  male and female homeless people.

 ![](https://github.com/CodyFHPearson/2019-2023-PIT-Gender-Analysis/blob/master/non_binary_transgender_growth.png)

In the above two bar charts we see the growth of non-binary and transgender homeless people compared to their population growths in California.  Although the data is limited for both graphs, we can see a large increase in growth of non-binary homeless people using shelters in comparison to the increase in population. For transgender homeless people the growth is more variable, yet we still see an increase in shelter usage greater than the population increase. 

# Act/Conclusions

Despite their relatively small populations transgender and non-binary people are underserved by shelter services in proportion to their population. However, it is impossible to say the reason for this without qualitative data such as a surveys. 

On the bright side transgender and non-binary people are consistently using shelter services more often since 2019.  These two groups have by far had the most growth in this area over the past 5 years. 

Recommendations: 

1. Take survey data of transgender and non-binary people to find out why they might not be using the services available to them.
2. Inform transgender and non-binary people of the services available to them and how to access them. 





