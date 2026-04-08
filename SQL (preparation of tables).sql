Use media_analytics_project;
select * from facebook;
select count(*) from  facebook;
## if you need to alter the column name
##Alter table facebook rename column `Campaign _Name` to  Campaign_Name;

# Creating facebook_analysis_table
Create table facebook_campaign_analysis as
select 
    `Campaign _Name`,
    Age_Group,
    date(ReportDate) as report_date,
    sum(Impressions) as total_impressions,
    sum(reach) as total_reach,
    sum(cost) as total_cost,
    sum(Total_Social_Interactions) as total_interactions
from facebook
group by `Campaign _Name`, Age_Group,date(ReportDate);

select count(*) from  facebook_campaign_analysis;  
select * from  facebook_campaign_analysis;  

# Creating campaign_summary from facebook_campaign_analysis table 
Create table campaign_summary as 
select 
      `Campaign _Name`,
       sum(total_impressions) as impressions,
       SUM(total_reach) AS reach,
       SUM(total_cost) AS cost,
       SUM(total_interactions) AS interactions
from facebook_campaign_analysis
group by `Campaign _Name`;
select * from campaign_summary;
select count(*) from campaign_summary;

