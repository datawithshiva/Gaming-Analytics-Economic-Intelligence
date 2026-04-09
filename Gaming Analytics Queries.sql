Q1. Top 5 Most Popular Games(by sessions)

SELECT "Game_ID", SUM("Daily_Active_Sessions") AS "Total_Sessions"
FROM gaming_data
GROUP BY "Game_ID"
ORDER BY "Total_Sessions" DESC
LIMIT 5;

Q2. Total Revenue per Game

SELECT "Game_ID" , SUM("Ads_Revenue" + "InApp_Purchase_Revenue") AS "Total_Revenue"
FROM gaming_data
GROUP BY "Game_ID"
ORDER BY "Total_Revenue" DESC;

Q3. Genre-Wise Average Session Duration

SELECT "Genre", 
ROUND(AVG("Avg_Session_Duration")::numeric, 2) AS Avg_Duration
FROM gaming_data
GROUP BY "Genre";

Q4. Monthly Revenue Trend

SELECT TO_CHAR("Session_Date", 'Mon') AS Month_Name,
SUM("Ads_Revenue" + "InApp_Purchase_Revenue") AS Revenue
FROM gaming_data
GROUP BY TO_CHAR("Session_Date", 'Mon'), DATE_PART('month', "Session_Date")
ORDER BY DATE_PART('month', "Session_Date");

Q5. Economy Imbalance Detection (Coins)

SELECT "Game_ID" , 
SUM("Coins_Earned") AS Earned,
SUM("Coins_Spent") AS Spent,
SUM("Coins_Earned" - "Coins_Spent") AS Economy_Gap
FROM gaming_data
GROUP BY "Game_ID"
ORDER BY Economy_Gap DESC;

Q6. Games with Highest Bug Reports

SELECT "Game_ID", SUM("Bug_Reports") AS Total_Bugs
FROM gaming_data
GROUP BY "Game_ID"
ORDER BY Total_Bugs DESC;

Q7. Downtime Impact Analysis

SELECT "Game_ID", SUM("Server_Downtime_Min") AS Total_Downtime
FROM gaming_data
GROUP BY "Game_ID"
ORDER BY Total_Downtime DESC;

Q8. Games with High Engagement 

SELECT "Game_ID",
AVG("Avg_Session_Duration") AS Avg_Duration
FROM gaming_data
GROUP BY "Game_ID"
HAVING AVG("Avg_Session_Duration") > 30;

Q9. Correlation Insight (Sessions vs Revenue)

SELECT "Game_ID",
SUM("Daily_Active_Sessions") AS Total_Sessions,
SUM("Ads_Revenue"::numeric + "InApp_Purchase_Revenue"::numeric) AS Revenue
FROM gaming_data
GROUP BY "Game_ID";

Q10. Low Performing Games As Per Revenue

SELECT "Game_ID",
SUM("InApp_Purchase_Revenue") AS Revenue
FROM gaming_data
GROUP BY "Game_ID"
ORDER BY Revenue ASC
LIMIT 5;











