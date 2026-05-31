# Restaurant Sales Analysis | 3-Year Overview
## Independent Operations & Supply Chain Analysis

---

## Business Task

Analyze 3 years of restaurant POS sales data to identify revenue trends, understand the performance gap between dining room and bar operations, and provide actionable recommendations for menu optimization and revenue growth.

---

## Data Overview

- **Data Range:** May 2022 – May 2025 (3 full years)
- **Total Records:** 141,672 individual item orders
- **Total Revenue:** $1,419,081
- **Operating Days:** Tuesday through Sunday
- **Tools Used:** Microsoft Excel (cleaning), Google BigQuery (SQL analysis), Tableau Public (visualization)

### Data Structure
| Column | Description |
|---|---|
| order_id | Unique identifier per item ordered |
| date | Date of transaction |
| season | Season (Spring, Summer, Fall, Winter) |
| day_of_week | Day of the week |
| seat_type | Dining Room or Bar |
| meal_period | Lunch, Dinner, Brunch, or Bar |
| item_name | Name of item ordered |
| category | Category (Entrees, Burgers, Cocktails, etc.) |
| price | Price per item |
| quantity | Quantity ordered |
| revenue | Total revenue per row (price x quantity) |
| year_period | Year 1, Year 2, or Year 3 (12-month periods) |

---

## Data Cleaning & Processing

Cleaning was performed in **Microsoft Excel**:

- Formatted `date` column as YYYY-MM-DD
- Verified no blank values across all columns
- Verified no duplicate rows
- Confirmed date range: May 27, 2022 to May 26, 2025
- Added `revenue` column: `=price * quantity`
- Added `year_period` column to group data into three 12-month periods for consistent year-over-year comparison
- Exported cleaned file as CSV for BigQuery upload

Further cleaning in **BigQuery**:
- Removed two extra null columns generated during Excel CSV export
- Merged duplicate `Appetizer` and `Appetizers` category values into single `Appetizers` category

---

## Analysis Summary

### 1. Overall Revenue Decline
| Year Period | Total Revenue | Total Orders |
|---|---|---|
| Year 1 | $520,104 | 51,757 |
| Year 2 | $475,029 | 47,355 |
| Year 3 | $423,948 | 42,560 |

Total revenue declined **18.5%** over 3 years, with orders dropping by over 9,000.

### 2. Dining Room vs Bar Performance
| Year Period | Bar Revenue | Dining Room Revenue |
|---|---|---|
| Year 1 | $193,779 | $326,326 |
| Year 2 | $193,032 | $281,997 |
| Year 3 | $192,001 | $231,948 |

Bar revenue remained virtually flat (-0.9%) while dining room revenue declined **29%** — a $94,378 drop over 3 years. The bar is the stable revenue anchor of the business.

### 3. Top Revenue Categories
| Category | Total Revenue | Total Orders |
|---|---|---|
| Appetizers | $177,858 | 12,985 |
| Entrees | $160,633 | 7,361 |
| Cocktails | $135,877 | 11,718 |
| Burgers | $129,590 | 8,698 |
| Sandwiches | $125,389 | 8,740 |

### 4. Revenue by Day of Week
| Day | Total Revenue |
|---|---|
| Saturday | $328,054 |
| Friday | $281,512 |
| Sunday | $264,160 |
| Tuesday | $211,461 |
| Thursday | $181,183 |
| Wednesday | $152,712 |

Wednesday is the slowest day — **53% less revenue than Saturday.**

### 5. Seasonal Performance
| Season | Total Revenue |
|---|---|
| Summer | $361,571 |
| Fall | $356,685 |
| Winter | $356,666 |
| Spring | $344,159 |

Summer is the strongest season. Comfort food items like Irish Beef Stew, Shepherd's Pie, and Chicken Pot Pie peak in Fall and Winter. Cocktails, lighter fare, and burgers peak in Summer.

---

## Visualizations

View the full interactive dashboard on Tableau Public:
[Restaurant Sales Analysis Dashboard](https://public.tableau.com/app/profile/matthew.koch/viz/RestaurantSalesAnalyst-3YearOverview/Dashboard1?publish=yes)

The dashboard includes:
- Monthly Revenue Trend (3-year line chart)
- Dining Room vs Bar Revenue (grouped bar chart)
- Seasonal Item Performance (interactive bar chart by season)

---

## Top 3 Recommendations

**1. Reinvest in Bar Programming**
Bar revenue has held steady at ~$193K across all 3 years while dining room revenue dropped 29%. The bar is clearly the stable foundation of the business. Investing in happy hour promotions, themed nights, live music, or bar events could help offset the dining room decline and grow the bar's already consistent customer base.

**2. Seasonal Menu Optimization**
Data shows clear seasonal patterns in item performance. Burgers and draft beer are strong year-round, but cocktails and lighter fare spike in summer while comfort food items like Irish Beef Stew, Shepherd's Pie, Bangers & Mash, and Chicken Pot Pie dominate fall and winter. The restaurant should align purchasing, staffing, and promotional efforts around these seasonal patterns to maximize revenue and minimize waste on slow-moving items.

**3. Wednesday Promotions**
Wednesday is consistently the slowest revenue day at $152K total — 53% less than Saturday. A targeted weekly Wednesday promotion such as discounted appetizers, burger and beer specials, or trivia night could meaningfully boost traffic on the weakest night of the week and convert slow inventory into revenue.

---

## Tools Used
- **Microsoft Excel** — data exploration and cleaning
- **Google BigQuery** — SQL analysis and aggregations
- **Tableau Public** — interactive dashboard and visualizations
- **GitHub** — portfolio documentation

---

## SQL Queries

All SQL queries used in this project are available in the [`queries.sql`](queries.sql) file in this repository.
