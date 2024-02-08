WITH lagged_data AS (
    SELECT 
		Year,
		LAG(Overall_Homeless_Female) OVER (ORDER BY Year) AS Previous_Year_Female_Homeless,
		LAG(Overall_Homeless_Male) OVER (ORDER BY Year) AS Previous_Year_Male_Homeless,
        LAG(Overall_Homeless_Transgender) OVER (ORDER BY Year) AS Previous_Year_Transgender_Homeless,
		LAG(Overall_Homeless_Non_Binary) OVER (ORDER BY Year) AS Previous_Year_Non_Binary_Homeless,
        LAG(Sheltered_Total_Homeless_Female) OVER (ORDER BY Year) AS Previous_Year_STH_Female,
		LAG(Sheltered_Total_Homeless_Male) OVER (ORDER BY Year) AS Previous_Year_STH_Male,
        LAG(Sheltered_Total_Homeless_Transgender) OVER (ORDER BY Year) AS Previous_Year_STH_Transgender,
         LAG(Sheltered_Total_Homeless_Non_Binary) OVER (ORDER BY Year) AS Previous_Year_STH_Non_Binary
        
    FROM
        pit_counts_2019_2023.`pit_counts_2019_2023.pit_counts_2019_2023_combined` PC
    WHERE State = "CA"
    AND NOT PC.Year = "2021"
)

SELECT 
    *,
    Sheltered_Total_Homeless_Female / Overall_Homeless_Female AS Percent_Female_Sheltered,
    Sheltered_Total_Homeless_Male / Overall_Homeless_Male AS Percent_Male_Sheltered,
    Sheltered_Total_Homeless_Transgender / Overall_Homeless_Transgender AS Percent_Transgender_Sheltered,
    Sheltered_Total_Homeless_Non_Binary / Overall_Homeless_Non_Binary AS Percent_Non_Binary_Sheltered,
    (Overall_Homeless_Female- lagged_data.Previous_Year_Female_Homeless)/lagged_data.Previous_Year_Female_Homeless*100  AS Overall_Female_Homeless_Growth,
	(Overall_Homeless_Male- lagged_data.Previous_Year_Male_Homeless)/lagged_data.Previous_Year_Male_Homeless*100  AS Overall_Male_Homeless_Growth,
    (Overall_Homeless_Transgender- lagged_data.Previous_Year_Transgender_Homeless)/lagged_data.Previous_Year_Transgender_Homeless*100  AS Overall_Transgender_Homeless_Growth,
    (Overall_Homeless_Non_Binary- lagged_data.Previous_Year_Non_Binary_Homeless)/lagged_data.Previous_Year_Non_Binary_Homeless*100  AS Overall_Non_Binary_Homeless_Growth,
    (Sheltered_Total_Homeless_Female-lagged_data.Previous_Year_STH_Female)/lagged_data.Previous_Year_STH_Female*100 AS Overall_Female_STH_Growth,
    (Sheltered_Total_Homeless_Male-lagged_data.Previous_Year_STH_Male)/lagged_data.Previous_Year_STH_Male*100 AS Overall_Male_STH_Growth,
    (Sheltered_Total_Homeless_Transgender-lagged_data.Previous_Year_STH_Transgender)/lagged_data.Previous_Year_STH_Transgender*100 AS Overall_Transgender_STH_Growth,
    (Sheltered_Total_Homeless_Non_Binary-lagged_data.Previous_Year_STH_Non_Binary)/lagged_data.Previous_Year_STH_Non_Binary*100 AS Overall_Non_Binary_STH_Growth
    
FROM 
    pit_counts_2019_2023.`pit_counts_2019_2023.pit_counts_2019_2023_combined` PC
JOIN
    lagged_data ON lagged_data.Year = PC.Year
WHERE 
    State = "CA"
AND 
    NOT PC.Year = "2021";
