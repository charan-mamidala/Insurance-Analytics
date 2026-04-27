-- create database Insurance;
-- use Insurance
-- select * from brokerage;
-- select * from individual_budgets;
-- select * from fees;
-- select * from invoice;
-- select * from meeting;
-- select * from  opportunity;

-- Total brokerage amount
select concat(round(sum(amount)/1000000,2),"M") as `Total Amount`, count(policy_number) as 'Total Policies' from brokerage;

-- total policies
select count(policy_number) 'Total Policies' from brokerage;

-- total inactive policies
select count(policy_status) as `Total Inactives` from brokerage
where policy_status="Inactive";

-- total active policies
select count(policy_status) as `Total Actives` from brokerage
where policy_status="Active";

-- total customers
select count(distinct client_name) 'No of customers' from brokerage;

-- total meetings
select count(meeting_date) as 'Total Meetings' from meeting;

-- total meetings by executives
select `Account Executive`, count(global_attendees) as `Total Meetimgs` from meeting
group by `Account Executive`;

-- Top 10 opportunities
select opportunity_name, sum(revenue_amount) 'Total Amount' from opportunity
group by opportunity_name
order by sum(revenue_amount) desc
limit 10;

-- stage wise revenue
select stage, concat(round(sum(revenue_amount)/100000,2),"L") 'Total Amount' from opportunity
group by stage;