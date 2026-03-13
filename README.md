# Bangalore Ola Ride Data Analysis (SQL)

This project explores a ride dataset similar to operational data used by ride-hailing platforms like Ola.  
**Objective**: Analyze ride completion rates, cancellation behavior, wait times, and demand patterns using SQL.  
**Dataset**: 49,999 ride records (booking status, VTAT, cancellation reasons, locations, vehicle types, payments).

## Dataset Overview
**Total rides**: 49,999  
**Key fields**:
- Booking status
- Pickup/drop locations  
- Driver arrival time (VTAT)
- Cancellation reasons
- Vehicle type
- Payment method
- Ride distance/revenue
- Driver/customer ratings

## Ride Outcome Analysis

| Status               | Count  | Share |
|----------------------|--------|-------|
| Success              | 33,484 | 67%   |
| Cancelled by Driver  | 9,610  | 19%   |
| Cancelled by Customer| 3,799  | 7.6%  |
| Incomplete           | 3,106  | 6.2%  |

**Insight**: ~33% rides fail. Driver cancellations = largest issue (1 in 5 rides).

## Wait Time Analysis
**Avg VTAT**: 10.48 minutes  
**Insight**: High wait → more cancellations. Optimize matching.

## Customer Cancellation Reasons

| Reason                          | Count |
|---------------------------------|-------|
| Driver not moving toward pickup | 793   |
| AC not working                  | 792   |
| Change of plans                 | 756   |
| Driver asked to cancel          | 738   |
| Wrong address                   | 720   |

**Insight**: Driver inactivity = top issue.

## Driver Cancellation Reasons

| Reason                        | Count |
|-------------------------------|-------|
| More than permitted passengers| 2512  |
| Personal/vehicle issues       | 2413  |
| Customer related issues       | 2402  |
| Customer coughing/sick        | 2283  |

**Insight**: Drivers cancel 3x more than customers—supply/behavior problem.

## Cancellation Patterns by Time
**Peak hours**: 9 AM, 1 PM, 10 AM, 12 PM  
**Insight**: Demand > supply during commutes.

## Revenue by Vehicle Type

| Vehicle Type | Revenue |
|--------------|---------|
| Bike         | ₹4.95M  |
| Prime Sedan  | ₹4.91M  |
| Prime Plus   | ₹4.90M  |
| eBike        | ₹4.88M  |
| Prime SUV    | ₹4.88M  |
| Auto         | ₹4.87M  |
| Mini         | ₹4.84M  |

**Insight**: Bikes lead revenue (volume-driven).

## High Demand Pickup Locations
**Top areas**: Area-39, Area-4, Area-8, Area-29, Area-9  
**Insight**: Multi-area demand.

## Key Takeaways
- 33% failure rate
- Drivers biggest cancel source
- VTAT: 10.48 min
- Demand peaks midday
- Bike = top revenue

## Business Recommendations
1. **Monitor driver movement** post-acceptance
2. **Reduce VTAT** via better matching
3. **Boost supply** at peak hours
4. **Vehicle quality checks** (AC issues)

## Tools Used
- **SQL** (PostgreSQL)
- Aggregation queries

---
*Analysis on Bengaluru-Ola.csv (5,885 rides)*
