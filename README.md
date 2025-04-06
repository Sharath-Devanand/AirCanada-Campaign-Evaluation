# Airline Campaign Evaluation


## Project Background


As a Data Analyst at Air Canada, I'm collaborating with the Marketing department to evaluate the effectiveness of the 2018 Promotion Campaign. I'm focusing on three KPIs - year-on-year member (YoY) growth, cancellation rate, and Customer Lifetime Value (CLV). Additionally, I aim to uncover the impact of demographic attributes (gender, education) on flight activity and CLV.


## Executive Background




## Data Description


The dataset consists of two tables - Customer and Flight, with the following attributes:


1. Customer: The Customer table is divided into two sections -

1.1 Demographics - Gender, Location, Education, Marital Status, and Salary.

1.2 Membership: Month and year of enrollment and cancellation (if cancelled), along with the card type, enrollment type, and Customer Lifetime Value (CLV).


2. Flights - The Flights table contains entries of the flights booked solo and with companion information on the year and month of booking along with points accumulated and redeemed in that month by the member (Loyalty Number).


<p align="center">
  <img src="https://github.com/Sharath-Devanand/Airline-loyalty-analysis/blob/master/imgs/airline_schema.png?raw=true" width="60%">
</p>




## Analysis & Insights


The Analysis is organised into the below three subsections for better flow -


1. Historical Trends (2013 - 2017)
2. Campaign Performance
3. Performance Evaluation


### Historical Trends (2013–2017)


A baseline is established for evaluating the campaign's performance across diverse demographics. Following are the insights for the last five years before the Campaign promotion started.


#### 1. Demographic Metrics


a. There has been an equal representation of both genders (Male and female) with an incremental increase in female members. Marketing strategies should primarily focus on gender-neutral campaigns.


b. Married members dominate throughout history with an average of 60% followed by singles (27%). This denotes holiday-based promotions will highly resonate within the customer base.

c. 80% of the members have a salary under 100K AUD and a minimum of a college degree. Promotional benefits should incorporate price sensitive audience and value-for-money benefits.


d. Ontario (31%) and British Columbia (25%) have the highest share of customers due to being the business and service hubs respectively. Members belong to a well-updated community on their lifestyle choices including flying preferences. A large portion of members could benefit from benefits due to frequent flying such as lower boarding times.


#### 2. Membership Trends & Flight Activity


a. Customer Lifetime value averages between 7000 and 8000 AUD with minimal variance due to the proportional rate of cancellations against enrollment rates. The lowest card tier (Star) remains the most used option (45%) with a skewed benefits structure. Re-balancing member benefits for card tier could generate higher CLV.


b. Same-year cancellations have been an increasing trend, depicting inefficient retention strategies for early-joined members. Early-joined members also booked the fewest flights and the lowest average of points redeemed suggesting declining onboarding quality.


d. 70% of the members flying alone could be beneficial in redesigning marketing efforts with individual traveller benefits such as adding lounge access and personalised food/drink preferences.


### 2018 Promotion Campaign Overview


A Promotion Campaign focusing on higher customer loyalty has been presented for members in the year 2018. Insights into demographic and flight activity of members joining through the promotion are as follows


#### Demographic Attributes


a. A continued increase in female members compared to earlier enrollment years - this indicates a gradual shift towards females which should be maximised in terms of retention strategies tailored to engage more females.


b. Factors such as Location (Province), Education and Marital Status remain identical in distribution to the last five years - The campaign had not reached new segments, indicating a diversified rebranding for AirCanada targeting a wider audience.


c. The members with less than a 100K salary continue to grow - This suggests a call for revising card tier pricing strategies to focus on affordability for price-conscious members.


#### Membership Distribution & Flight Activity


a. Although only 22% of the member distribution was part of Aurora (the highest tier), they generated the highest average CLV. This demonstrates that the campaign has successfully targeted high-value customers.


b. The Cancellation rates are reported to be the highest at 11.8% from the campaign members. An inefficient onboarding process for early joiners, lack of engagement and unbalanced tier benefits are the root causes of the cancellation rate.


c. Members enrolled in the Campaign contributed to a 6% increase in the total flights booked in the year 2018. In comparison to the flights booked in the year 2017, there has been a 4.7% increase in flights booked by standard members and an 11.4% increase overall. Additionally, Campaign members contributed to 37% of the total points redeemed over the year 2018. This indicates a strong capture of members that effectively utilise their membership.


### Performance Metrics Evaluation


Measuring the impact of the 2018 campaign using three key indicators:


3.1 Year-on-Year (YoY) Growth – There has been an average YoY growth of 1% every year (Apart from the year 2013 - 42% YoY). The marketing campaign in 2018 broke the historic average with a YoY increase of 21% despite an 18% decrease in standard members. The campaign has effectively brought in high-valued customers to counter the churn rates challenge.


3.2 Cancellation Rate – Historically, the cancellations are consistent with an average of 5% YoY. The year 2018 observed an improvement in cancellation rate by a decline to 2% overall YoY cancellations and 5% standard YoY Cancellations. Although the campaign has effectively decreased the cancellation ratio, new member cancellations remain a concern - need for early member engagement strategies.


3.3 Average Customer Lifetime Value (CLV) - No significant changes were observed in 2018 due to the campaign with the average CLV continuing at 8000 AUD. Restructuring the loyalty benefits would pave the way for growing customer value.




## Recommendations

1. Demographic Shift - 

Three provinces capture 76% of the members leaving other areas with untapped potential. Outreach programs targeting the underrepresented market could boost growth.

With an incremental shift to more female representation, exploiting marketing promotions tailored to women will expedite growth.

Degree holders with salaries below 100K AUD dominating the customer base highlight the need for benefits and marketing promotions to align with a price-sensitive audience with a strong value for money.


2. Loyalty Tier Restructure - The card tier (Aurora) with the highest CLV has the least representation (22%). A re-evaluation of the benefits for card types leading to a balanced distribution will increase the ratio of Aurora members. An analysis of the impact created by each benefit across tiers will aid in redesigning the loyalty program structure.


3. Early Joiner benefits - A high same-year cancellation rate indicates a focus on highlighting new-joiner benefits. Introductory bonus offers such as earning more points in the first 3-5 flights will boost new joiner engagement with the company. A personalised onboarding which includes a detailed walkthrough of the loyalty program imparts clarity for new joiners leading to loyal customers. Periodic check-ins with customers on updating benefits reinforce engagement and loyalty with their airline partner.


4. Campaign Impact - The Marketing Campaign proved to bring in high-value (Aurora tier) customers who contributed to points redeemed and flight bookings throughout 2018. Similar campaigns must be conducted periodically - seasonal or themed campaigns to attract new customers consistently.


## Assumptions and Caveats


1. The Campaign Promotion ran throughout that year.
2. Data Quality - Some of the Salary values are negative - Need for Data Validation protocols for customer data entry.
3. College degree members had salary columns as NULL (Reason unknown). The average of the province was imputed.




## Technical Tools
1. SQL - Data Analysis, Exploration
2. Python - Statistical Analysis
3. Tableau - Report, Dashboard Visualisation
