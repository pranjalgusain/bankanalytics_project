select * from finance_1;

select * from finance_2;


#KPI's 

## 1 Year wise loan amount Stats
select year(issue_d) as Year_of_issue_d , sum(loan_amnt) as Total_loan_amnt
from finance_1 
group by Year_of_issue_d
order by Year_of_issue_d;	



## 2 Grade and sub grade wise revol_bal
select grade, sub_grade , sum(revol_bal) as total_revol_bal
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by grade , sub_grade
order by grade , sub_grade;



## 3 Total Payment for Verified Vs Non Verified Status
select verification_status ,
concat("$", format(round(sum(total_pymnt)/1000000,2),2),"M") as total_payment
from finance_1
inner join finance_2
on (finance_1.id = finance_2.id)
group by verification_status;



## 4 State wise and last_credit_pull_d wise loan status
select addr_state , last_credit_pull_d , loan_status
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id )
group by addr_state , last_credit_pull_d , loan_status
order by last_credit_pull_d;



## 5 Home ownership Vs last payment date stats
select home_ownership, count(last_pymnt_d) as last_paymnt_d_stats
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id )
group by home_ownership
order by home_ownership;







