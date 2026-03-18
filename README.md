# 🚖 Cabs Data Analyst Project

> An end-to-end data analytics project on **100,000+ ride-booking records** using **MySQL**, **Microsoft Excel**, and **Power BI**.

---

## 📌 Project Overview

This project analyses a large-scale cab-booking dataset to uncover insights about ride trends, cancellations, revenue, customer satisfaction, and driver performance.

Think of it as a full analytics pipeline — from raw data all the way to interactive dashboards.

| 📦 Dataset Size | 🛠️ Tools Used | 📊 Dashboards Built |
|---|---|---|
| 100,000+ Records | MySQL · Excel · Power BI | 10 Visuals across 5 Pages |

---

## 🗂️ Project Structure

```
cabs-data-analyst-project/
│
├── data/
│   └── bookings.csv              # Raw dataset (100K+ rows)
│
├── sql/
│   └── queries.sql               # All 10 SQL views
│
├── excel/
│   └── data_cleaning.xlsx        # Cleaned & prepared data
│
├── powerbi/
│   └── cabs_dashboard.pbix       # Power BI report file
│
└── README.md
```

---

## 🗃️ Dataset — What's Inside?

Each row in the dataset represents **one cab booking**. Here are the key columns:

| Column | What It Means |
|---|---|
| `Booking_ID` | Unique ID for every ride |
| `Customer_ID` | Anonymised customer identifier |
| `Booking_Status` | Success / Canceled by Customer / Canceled by Driver / Incomplete |
| `Vehicle_Type` | Auto, Bike, Mini, Prime Sedan, Prime SUV, Prime Plus, E-Bike |
| `Ride_Distance` | Distance of the trip (in km) |
| `Booking_Value` | Fare charged (in ₹) |
| `Payment_Method` | Cash, UPI, Credit Card, Debit Card |
| `Driver_Ratings` | Rating given to driver by customer (1–5) |
| `Customer_Rating` | Rating given to customer by driver (1–5) |
| `Canceled_Rides_by_Driver` | Reason if driver cancelled |
| `Incomplete_Rides` | Yes / No |
| `Incomplete_Rides_Reason` | Why the ride wasn't completed |

---

## 🗄️ SQL — 10 Queries Explained

All queries are written as **reusable Views** in MySQL. Here's what each one does in simple terms:

### ✅ Q1 — All Successful Bookings
```sql
CREATE VIEW Successful_Bookings AS
SELECT * FROM bookings WHERE Booking_Status = 'Success';
```
> Filters out only the rides that were completed successfully — the foundation for all revenue analysis.

---

### 📏 Q2 — Average Ride Distance by Vehicle Type
```sql
CREATE VIEW avg_distance_by_vehicle AS
SELECT Vehicle_Type, ROUND(AVG(Ride_Distance), 2) AS Avg_distance
FROM bookings GROUP BY Vehicle_Type ORDER BY Vehicle_Type;
```
> Tells us which vehicle types are used for longer trips (e.g., Prime SUV for airports) vs short ones (e.g., Auto for last-mile).

---

### ❌ Q3 — Total Rides Cancelled by Customers
```sql
CREATE VIEW count_canceled_by_customer AS
SELECT COUNT(*) FROM bookings WHERE Booking_Status = 'Canceled by Customer';
```
> Measures how often customers are backing out — a signal of long wait times or poor driver supply.

---

### 🏆 Q4 — Top 5 Most Frequent Customers
```sql
CREATE VIEW top_5_customers AS
SELECT Customer_ID, COUNT(Customer_ID) AS total_rides
FROM bookings GROUP BY Customer_ID ORDER BY total_rides DESC LIMIT 5;
```
> Finds the platform's most loyal, high-frequency riders — ideal targets for loyalty rewards.

---

### 🔧 Q5 — Driver Cancellations Due to Personal/Car Issues
```sql
CREATE VIEW canceled_by_driver_issue AS
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
```
> Tracks how many rides were dropped because the driver had a personal emergency or vehicle problem.

---

### ⭐ Q6 — Max & Min Driver Ratings for Prime Sedan
```sql
CREATE VIEW driver_rating_prime_sedan AS
SELECT Vehicle_Type, MAX(Driver_Ratings) AS max_rating, MIN(Driver_Ratings) AS min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';
```
> Checks whether Prime Sedan (a premium category) maintains consistent service quality or has wide variance.

---

### 💳 Q7 — All Rides Paid via UPI
```sql
CREATE VIEW payment_via_upi AS
SELECT * FROM bookings WHERE Payment_Method = 'UPI';
```
> Isolates UPI transactions for digital payment analysis and revenue reconciliation.

---

### 😊 Q8 — Average Customer Rating per Vehicle Type
```sql
CREATE VIEW customer_rating_vehicle AS
SELECT Vehicle_Type, ROUND(AVG(Customer_Rating), 2) AS avg_customer_rating
FROM bookings GROUP BY Vehicle_Type;
```
> Shows how drivers rate their passengers across different vehicle segments.

---

### 💰 Q9 — Total Revenue from Successful Rides
```sql
CREATE VIEW sum_successful_rides AS
SELECT SUM(Booking_Value) AS Total_Revenue
FROM bookings WHERE Booking_Status = 'Success';
```
> The headline revenue number — total money earned from completed rides only.

---

### 🚫 Q10 — Incomplete Rides with Reason
```sql
CREATE VIEW incomplete_rides_with_reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings WHERE Incomplete_Rides = 'Yes';
```
> Lists every ride that didn't finish and why — critical for improving trip completion rates.

---

## 📊 Power BI — 10 Dashboard Visuals

The Power BI report has **5 pages**: Overall · Vehicle Type · Revenue · Cancellation · Ratings

| # | Visual | Page | Chart Type | What It Shows |
|---|---|---|---|---|
| 1 | Ride Volume Over Time | Overall | Line Chart | Daily/weekly booking trends |
| 2 | Booking Status Breakdown | Overall | Donut Chart | Success vs cancellation split |
| 3 | Top 5 Vehicle Types by Ride Distance | Vehicle Type | Bar Chart | Which vehicles travel the most km |
| 4 | Avg Customer Ratings by Vehicle Type | Ratings | Column Chart | Satisfaction scores per segment |
| 5 | Cancelled Rides Reasons | Cancellation | Treemap | Top reasons for cancellations |
| 6 | Revenue by Payment Method | Revenue | Pie Chart | UPI vs Cash vs Card revenue share |
| 7 | Top 5 Customers by Booking Value | Overall | Bar Chart | Highest-spending customers |
| 8 | Ride Distance Distribution | Vehicle Type | Histogram | Short vs long trip frequency |
| 9 | Driver Ratings Distribution | Ratings | Histogram | How drivers are rated overall |
| 10 | Customer vs Driver Ratings | Ratings | Scatter Plot | Correlation between both ratings |

---

## 📈 Key Findings

- 🟢 **~62% of bookings** are successfully completed
- 💸 **Total Revenue** from successful rides: estimated ₹7–10 Crore
- 📱 **UPI is the #1 payment method** and correlates with higher booking values
- 🚗 **Prime SUV & Prime Plus** have the longest average trip distances
- ⚠️ **~35–38% of rides** are lost to cancellations or incomplete trips
- ⭐ **Average driver rating**: ~4.0 across all vehicle types

---

## 🛠️ How to Run This Project

### 1. Set up the Database
```sql
-- Import bookings.csv into MySQL
-- Then run queries.sql to create all 10 views
SOURCE sql/queries.sql;
```

### 2. Open in Excel
- Open `excel/data_cleaning.xlsx`
- Data is pre-cleaned and ready for pivot tables or further exploration

### 3. Open the Power BI Report
- Open `powerbi/cabs_dashboard.pbix` in Power BI Desktop
- Update the data source path to your local MySQL connection
- Refresh the data — all 10 visuals will populate automatically

---

## 🧰 Tech Stack

| Tool | Purpose |
|---|---|
| **MySQL** | Data storage, querying, and creating views |
| **Microsoft Excel** | Data cleaning, exploration, and preparation |
| **Power BI** | Interactive dashboards and visual storytelling |

---

## 🙋 About This Project

This project was built as a **portfolio-level data analyst case study** simulating a real-world ride-hailing analytics workflow. It covers:

- ✅ SQL query writing & view creation
- ✅ Data cleaning in Excel
- ✅ Dashboard design in Power BI
- ✅ Business insight generation from raw data

---

## 📬 Connect

If you found this project helpful, feel free to ⭐ star the repo and connect!

> *Built with 💛 using MySQL · Excel · Power BI*
