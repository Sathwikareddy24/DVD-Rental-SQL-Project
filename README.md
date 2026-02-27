# 📦 Project 3: "Dead Stock" Inventory Report
**Business Case:** Inventory that doesn't move is "trapped capital." This project identifies films that have never been rented, allowing the business to clear shelf space and recover costs by selling off unpopular stock.

### 🛠️ Technical Implementation
* **LEFT JOIN Auditing:** Used multiple `LEFT JOIN` operations between `film`, `inventory`, and `rental` tables to identify gaps in transaction history.
* **NULL Detection:** Applied `WHERE r.rental_id IS NULL` to isolate records in the parent table (Film) that have no corresponding activity in the child table (Rental).
* **Financial Aggregation:** Wrapped the discovery logic in a **CTE** to calculate the **Total Replacement Cost**, quantifying the total capital tied up in "Dead Stock."

### 📊 Business Logic
The report provides two key insights:
1. **Title List:** A distinct list of movies that have zero rental history.
2. **Capital Loss:** The total financial value of unrented inventory based on replacement costs.



### 📂 File Structure
* `dead_stock_inventory.sql`: Contains the audit join logic and capital sum calculation.

---
**How to use:** This report should be run quarterly. The results help the Procurement Team decide which genres or titles to stop purchasing and which to put on a "Clearance" sale.