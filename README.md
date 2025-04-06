# Airline Loyalty Analysis

## Project Background

As a Data Analyst at Air Canada I'm collaborating with the Marketing department to evaluate the effectiveness of the Promotion Campaign 2018 by year-on-year growth, cancellation rate, and Customer Lifecycle Value. Additionally, I aim to identify the impact of demographics attributes(e.g., gender, education), on flight activity (e.g., flights booked, points accumulated/redeemed) and Lifetime Value. 


## Executive Background


## Data Description

The dataset consists of two tables - Customer and Flight, with the following attributes:

1. Customer: The Customer table is divided into two sections for easier interpretation

1.1 Demographics: This section includes five demographic attributes: Gender, Location, Education, Marital Status, and Salary.

1.2 Membership: This section provides information on the month and year of enrollment and cancellation (if applicable), along with the card type, enrollment type, and Customer Lifetime Value (CLV).

2. Flights - The Flights table contains entries of the flights booked solo and with companion information on the year and month of booking along with points accumulated and redemed in that month by the member (Loyalty NUumber).

<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/airline_schema.png?raw=true" width="60%">
</p>


## Analysis & Insights

The Analysis is organised into the below three subsections for better flow - 

1. Historical Trends (2013 - 2017)
2. Campaign Performance
3. Performance Evaluation

1. Historical Trends (2013–2017)

A baseline is established for evaluating the campaign's performance across diverse demographics. Following are the insights for the last five years before the Campaign promotion started.

1.1 Demographic Metrics

a. There has consistently been an equal representation of both genders (Male, Female) with an incremental increase in female members. Marketing programs should primarily focus on gender-neutral campaigns.

b. Married members dominate throughout history with an average of 60%. The difference of 30% from the second largest group in Marital Status (Single - 27%) indicates a high-volume of members with preference of AirCanada for holiday bookings.

c. 80% of the members have their salary under 100K AUD and a minimum of a college degree. Promotional benefits should incorportae price sensitive audience and value-for-money benefits.

d. Ontario and British Columbia have the highest share of customers (31% and 25% respectively) due to being the hubs for business and service respectively. Members are part of a well-updated community on their lifestyle choices including flying preferences.

1.2 Membership Trends & Flight Activity

a. Average Lifetime value averages between 7000 and 8000 AUD with minimal variance due to proportional rate of cancellations against enrollment rates. The lowest card tier (Star) remains the most popular option (45%) with skewed benefits toward the Star Card members. Re-evalution of member benefits for card types will generate higher CLV and balanced card type distribution.

b. Cancellations in the same year has been proportionally increasing, depicting inefficient retention strategies for early-joined members. Early joined members have also booked the least flights and the least average of points redeemed suggesting declining member-loyalty.

d. 70% of the members flying alone could be beneficial in redesigning marketing efforts with member benefits such as adding lounge access and faster boarding time.

2. Promotion Campaign 2018 Overview

A Promotion Campaign focusing on higher customer loyalty has been presented for members in the year 2018. Insights of demographic and flight activity of members joining through the promotion are as follows

2.1 Demographic Distribution – Breakdown of new members by gender, location, education, marital status, and salary.

a. An increase in female members compared to earlier enrollment years - this indicates a gradual shift towards females which should be maximised in-terms of retention.

b. Factors such as Location (Province), Education and Marital Status remains to have an identical distribution to the last five years - A vital rebranding for AirCanada targeting wider targeting audience could alleviate a change in the distribution.

c. The members with less than 100K salary continues to grow - This indicates a call for reiterating the target audience - Promote campaigns realigning to a more price-sensitive audience.

2.2 Membership Distribution & Flight Activity

a. Although the highest tier (Aurora) has the least member distribution (22%), it generates the highest average CLV. This demonstrates that the campaign has achieved to target high-valued customers.

b. The Cancellation rates are reported to be the highest at 11.8% from the campaign members. A challenging on-boaring process for early joiners and unbalanced tier benefits are the root causes for the cancellation rate.

c. Members enrolled from the Campaign contributed to a 6% increase in the total flights booked in the year 2018. In comparison to the flights booked in the year 2017, there has been a 4.7% increase in flights booked by standard members and a 11.4% increase overall. Additionally, Campaign members contributed to 37% of the average points redeemed over the year 2018. This indicates a strong capture of members that effectively utilise their membership.

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
3. College degree members had salary column as NULL (Why?). The verage of the province was imputed.


## Technical Tools
1. SQL - Data Analysis, Exploration
2. Python - Statsticial Analysis
3. Tableau - Report,Dashboard Visualisation
