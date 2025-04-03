# Airline Loyalty Analysis

## Project Background

I am a Data Analyst at Air Canada, collaborating with the Marketing department to evaluate the 2018 Promotion Campaign by focusing on year-on-year growth, retention, and churn. I analyze data on demographics (e.g., gender, education), membership details (e.g., CLV, card type), and flight activity (e.g., flights booked, points accumulated/redeemed) to identify the demographic groups with the highest loyalty.


## Executive Background


## Data Description

The dataset consists of two tables - Customer and Flight, with the following attributes:

1. Customer: The Customer table is divided into two sections for easier interpretation

1.1 Demographics: This section includes five attributes: Gender, Location, Education, Marital Status, and Salary.

1.2 Membership: This section provides information on the month and year of enrollment and cancellation (if applicable), along with the card type, enrollment type, and Customer Lifetime Value (CLV).

2. Flight - The Flight table contains information on the year and month of flight bookings associated with the loyalty number. It includes the count of solo and companion flights booked as well as the points accumulated and points redeemed by the member.

<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/airline_schema.png?raw=true" width="60%">
</p>


## Analysis & Insights

1. Historical Trends (2013–2017)


1.1 Demographic Metrics
A baseline is established for evaluating the campaign's performance across diverse demographics. Following are the insights for the last five years before the Campaign promotion started.

a. There has consistently been an equal representation of members across both genders (Male, Female) indicating gender-neutral growth for the company over the years. A small and steady increase in Female percentage of the members could be observed which could be used advantageos to accelerate the expected representation

b. In terms of Marital Status, married members dominate across all the yeas with consistently representing 58-60% of the customers. The difference of 30% from the second largest group in Marital Status of Single (27%) indicates a high-volume of members inclined to booking holidays through AirCanada.

c. Upon oberving the Education distribution, Bachelors and College graduates occupy almost 85% of the customer base. This indicates knowledgeable members who would expect quality flying experience.

d. Ontario and British Columbia have the highest share of customers (31% and 25% respectively) owed to the fact of having the highest economy compared to the other provinces. Ontario being the business hub and British Columbia known for its service sector, people are well-informed and updated on their lifestyle choices which include flying preferences.

e. 90% of the members fall into the salary bracket of under 100k CAD indicating more conscious efforts into maintaing the budget-conscious travelers.


1.2 Membership Trends & Flight Activity

a. On the inspection of the average CLV across years, is has remained to be in the range of 7000 and 8000 AUD despite the increase in membership count through the years. This indicates an indication of growing customer value over time leading to members cancelling their membership.

b. A steady rising trend in cancellation presents a critical challenge needed to be resolved by the organisation. With the increase in cancellation, it can be seen that the number of cancellations in the same year has been proportionally increasing depicting inadequate retention policies and strategies for early-joined members through the years.

c. Star Card type remains the most popular option (45%) across card categories indicating a major challenge of members not progressing to higher tiers. This could mean that either the standards set to progress are too high to upgrade or the benefits of the Star type outweigh benefits from the higher card types. A restructure of the benefits along with the standards to progress is a necessory next step into growing members retention and loyalty.

d. Members wo enrolled in the last two years have booked relatively lesser flights than the older members proving absence of early retention strategies. This could also indicate that more recent members experiment with booking a few flights and then cancelling it due to unsatisfactory benefits. A decrease in average points redeemed from the early members further reiterate the need for policy structures to  maintain new-joiners

e. A constant domination of 70% of the members flying solo presents an oppurtunity to add solo-flying focused benefits such as lounge access and quicker boarding time.

2. 2018 Promotion Campaign Overview

A Promotion Campaign focusing on higher customer loyalty has been presented for members in the year 2018. Insights of demographic and flight activity of members joining through the promotion are as follows

2.1 Demographic Distribution – Breakdown of new members by gender, location, education, marital status, and salary.

a. An increase in female members compared to earlier enrollment years - this indicates a gradual shift towards females which should be maximised in-terms of retention.

b. Province, Education and Marital Status distribution remains to be in the same range as the last five years - A vital rebranding for AirCanada targeting wider targeting audience could alleviate a change in the distribution. Some brandin strategies based on the three factors could be designing family-oriented travel benefits focusing underrepresented provinces.

c. The members with less than 100K salary continues to grow - This indicates a call for reiterating the target audience - Promote campaigns realigning to a more price-sensitive audience.

2.2 Membership Distribution & Flight Activity

a. Although the the card type distribution presents the Aurora (highest tier) to have the least percentage (22%), it generates the highest average Customer Lifetime Value. This indicates that the campaign had achieved to reach the higher valued customers across similar demographic patterns historically.

b. The Cancellation rates are reported to be at an all time high of 11.8% of the members who enrolled from the campaign have cancelled their membership. A challenging on-boaring process for early joiners and unbalanced tier benefits could be the root causes for this high cancellation rate from the campaign.

c. Members enrolled from the Campaign contributed to a 6% increase in the total flights booked in the year 2018. In comparison to the flights booked in the year 2017, there has been a 4.7% increase in flights booked by standard members and a 11.4% increase overall. This indicates a strong capture of members that effectively utilise their membership.

d. Upon inspecting the Month on Month comparison of flights booked in 2017 and 2018 (overall and standard) - the flights booked by campaign members are year-round. Although there is a dip in economical months, a huge spike in booking in the summer and winder holiday periods. 

e. Campaign members contribute to 37% of the average points redeemed over the year 2018. Similar to flight bookings trends, there is an increase in the average redemption of points compared to the 2017 and this impact was accomplished solely by the members from the campaign. They have effectively utilised the loyalty program for their journeys indicating loyalty for AirCanada. The Month on Month trend comparison for the years 2017 and 2018 reflect a year round increase in points redemptions through Standard and Campaign members.

3. Performance Metrics Evaluation
Measuring the impact of the 2018 campaign using three key indicators:

3.1 Year-on-Year (YoY) Growth – The first year (2013) has recorded the highest growth (42%) over the six years of operations of the company. From 2014 till 2018, there has been an average growth of 1% every year. Focusing on the growth for the year 2018, in terms of Enrollment type, there is a massive decrease in Standard members from the previous year (-18%) while looking at the overall trend - there is a 21% increase in members. This depicts that the campaign has effectively brought in customers to counter the high cancellation rates across the years.

3.2 Cancellation Rate – There has been a constant cancellation rate over the year averaging at 15% YoY. In the year 2018, there has been a sharp decline in cancellation rate leading to a 5% YoY Cancellations in Standard members and 2% YoY cancellations overall. The Campaign has effectively decrease the cancellation ratio of new members albeight a high rate still prevails. A possible root case of the lower cancellation rate for the year 2018 from the Standard members could have partially been indirect influence of the campaign promotion.

3.3 Average Customer Lifetime Value (CLV) - An average CLV of 8000 AUD has been maintained across 2013 till 2018. The effect of campaign in CLV has ben negligibly insignificant. The Average CLV has increased by 0.1% (8007 to 8019 AUD) through the campaign promotion. The ability to grow customer value has been a constant challenge for AirCanada which needs to be addressed.


## Recommendations


1. Rebranding potential - With declining flight bookings and points redemption, it presents the right time to diversify the target audiences. Three provinces capture 76% of the members leaving other areas with untapped potential. With incremental shift to more female representation, exploiting marketing promotions aligned to women could expedite growth. Lower Salary members with a degree dominating the customer base indicates price-sensitive audiences with strong value for money presence.


2. Customer Lifetime Value remains constant through the years presenting strong efforts added to understanding customer preferences and aligning the benefits based on it. Restructuring the benefits across Card Types - Aurora, Star and Nova could promote loyalty and higher flight bookings.


3. Early Joiner benefits - Steady increase in Cancellation rates and more especially more cancellations from members enrolled in the same year pushs deeper focus and analysis of early-joining benefits. Imparting relevant knowledge on the tier system and associated benefits for new members could improve clarity for members in continuing their flying experience in AirCanada.

4. Campaign Impact based on performance metrics - The Marketing Campaign proved to bring in a low percentage of members but with high-value (Aurora members with the maximum average CLV). The members have significantly contributed to points redeemed and flight bookings throughout 2018. Early cancellations continue to pose a challenge to retain customers from the campaign.


## Assumptions and Caveats

1. The Campaign Promotion started on 01/01/2018 and is throughout that year
2. Some of the Salary values are negative - Need for Data Validation methods for customer info forms.
3. For all the members with the Education as College - Salary was NULL - Average of the province was imputed


## Technical Tools
1. SQL - Data Analysis, Exploration
2. Python - Statsticial Analysis
3. Tableau - Report,Dashboard Visualisation
