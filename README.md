\# 📉 Project: Customer Churn Risk Tracker

\*\*Business Case:\*\* In the DVD rental industry, retaining existing customers is more cost-effective than acquiring new ones. This project identifies "At-Risk" customers based on their inactivity and historical spending habits.



\### 🛠️ Technical Implementation

\* \*\*Common Table Expressions (CTEs):\*\* Used to isolate complex aggregations like `MAX(rental\_date)` before performing date arithmetic.

\* \*\*Date Arithmetic:\*\* Utilizes PostgreSQL date subtraction to calculate the exact number of days since a customer's last transaction.

\* \*\*Aggregations:\*\* Calculates the `AVG` payment amount per customer to distinguish high-value patrons from casual users.



\### 📊 Business Logic

The script filters for a specific segment of the database:

1\. \*\*Recency:\*\* Customers who have not rented a movie in over \*\*30 days\*\*.

2\. \*\*Value:\*\* Customers whose average spend per rental is greater than \*\*$4.00\*\*.







\### 📂 File Structure

\* `customer\_churn\_risk.sql`: Contains the full CTE and filtering logic.



---

\*\*How to use:\*\* Run the script in your SQL tool. The output provides a targeted list for marketing teams to send "Re-engagement" discount codes to high-value users who are likely to churn.

