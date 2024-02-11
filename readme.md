

# Introduction

This data analysis was conducted as the capstone project for the Google Data Analytics course on Coursera. The project follows the six steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act.

During the process of selecting a topic for the project, I knew that I needed a subject matter that was not only unique to me but also had real-world implications. When I expressed this to a friend, they suggested looking into gender differences regarding shelters. Working with real-world data has its own unique benefits. For instance, since this data was already well-maintained and organized, there was little to no cleaning necessary. However, as someone new to data analysis, it also presented unique challenges that required me to find solutions beyond the scope of the Coursera course. This led to me learning a great deal during this project, and I will continue to update and improve it as I gain experience and knowledge in the field of data analytics.

# ASK

In this data analysis we will explore the question of gender equality as it relates to sheltered homeless people. 

Specifically we will be looking at:

##### **Are non-binary and transgender people underserved by shelters in 2023 in California?**

##### What are the trends in the last five years in regards to the sheltering of non-binary and transgender people in California?

# Prepare/Process

Here's the proofread version:

First, I found and imported PIT (point-in-time) Data by state from the official source at https://www.hudexchange.info/resource/3031/pit-and-hic-data-since-2007/.

I created a copy of each sheet I needed, starting from 2023 to 2019, and added a year field to conduct historical trend analysis.

I immediately noticed that the column names exceeded the 64-character limit of MySQL. I confirmed this with the =len() function. After attempting to truncate the longer names using a combination of find and replace along with the =left() function, I ultimately decided it was best to create a pivot table for each sheet I needed, including only the columns appropriate for my analysis.

First, I used find and replace to replace all instances of “Gender is not singularly male or female” with “Non_Binary.” Then, I replaced all dashes and spaces with underscores and removed any instances of multiple underscores and commas to facilitate SQL queries.

Next, I familiarized myself with each column to determine the best content for each pivot table. After creating each pivot table, I saved them to a folder and imported them into MySQL. I combined the data from all five tables using the import wizard.

Then, I queried the data, filtering for the state of California, and conducted data integrity checks by comparing the values in each field to the raw data.

While comparing the data, I immediately noticed a difference in the 2021 data compared to the data from the years before and after. After conducting some research, I learned that according to the United States Interagency Council on Homelessness, the 2021 PIT counts were greatly affected by Covid-19, with many CoCs unable to conduct unsheltered counts. In light of this, I decided to remove the 2021 data from my analysis using the WHERE NOT statement.



# Analyze and Share

 First in MySQL, I divided the total sheltered by overall homeless for each gender to get the percent sheltered, and then created a common table expression to calculate growth per year of overall homeless and total sheltered homeless using the lag function.

You can view the full SQL code [here](https://github.com/CodyFHPearson/2019-2023-PIT-Gender-Analysis/blob/master/Pit.sql)

After I exported the data in csv format I uploaded it into Tableau for further analysis and visualization.

![](https://github.com/CodyFHPearson/2019-2023-PIT-Gender-Analysis/blob/master/percent_shelt_overall_v_shelt_2023.png)

In this first bar graph we see the percentage of each gender sheltered in 2023 in California with transgender and non-binary people being sheltered the least.  In the bottom two pie charts we can see that these two groups are sheltered at a lower proportion than their overall population would dictate. In a completely equitable world these two pie charts would be identical.

![](https://github.com/CodyFHPearson/2019-2023-PIT-Gender-Analysis/blob/master/Percentage_Each_Gender_Sheltered_2019-2023_V2.png)

In this line chart we see the the shelter trends of each gender from 2019-2023 in California. Please note that 2021 is placeholder in this graph as the data from that year was unreliable as stated earlier. Each genders percent sheltered has increased during the given time period. However, transgender and non-binary homeless people percent sheltered has increased far more than that of  male and female homeless people.

 ![](https://github.com/CodyFHPearson/2019-2023-PIT-Gender-Analysis/blob/master/non_binary_transgender_growth.png)

In the above bar charts we see the growth of non-binary and transgender homeless people compared to their population growths. Although the data is limited for both graphs, we can see a large increase in growth of non-binary homeless people using shelters in comparison to the increase in population. For transgender homeless people the growth is more variable, yet we still see an increase in shelter usage greater than the population increase. 

# Act/Conclusions

Despite their relatively small populations transgender and non-binary people are underserved by shelter services in proportion to their population. However, it is impossible to say the reason for this without qualitative data such as a surveys. 

On the bright side transgender and non-binary people are consistently using shelter services more often since 2019.  These two groups have by far had the most growth in this area over the past 5 years. 

Recommendations: 

1. Take survey data of transgender and non-binary people to find out why they might not be using the services available to them.
2. Inform transgender and non-binary people of the services available to them and how to access them. 





