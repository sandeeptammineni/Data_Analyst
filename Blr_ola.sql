create table Blr_ola(
				Ride_date	date,
				Ride_time	time,
				Booking_id	varchar(20),
				Booking_status	varchar(50),
				Customer_id	varchar(10),
				Vehicle_type	varchar(20),
				Pickup_location	varchar(20),
				Drop_location	varchar(20),
				Avg_VTAT	float,
				Avg_CTAT    float,
				Cancelled_by_customer	boolean,
				Reason_for_cancelling_by_customer varchar(50),	
				Cancelled_rides_by_driver	boolean,
				Reason_for_cancelling_by_driver	varchar(100),
				Incomplete_rides	boolean,
				Incomplete_rides_reason	varchar(100),
				Booking_value	float,
				Payment_method	varchar(20),
				Ride_distance	float,
				Driver_ratings	float,
				Customer_rating	float
)

select count(*) from blr_ola;

--no of success vs failed rides
SELECT 
  CASE 
    WHEN booking_status = 'Success' THEN 'Success'
    ELSE 'Failed rides' 
  END AS status_category,
  COUNT(*) AS ride_count
FROM blr_ola 
GROUP BY 
  CASE 
    WHEN booking_status = 'Success' THEN 'Success'
    ELSE 'Failed rides' 
end

--avg vtat
select avg(avg_vtat) from blr_ola

--cancelled by driver vs cancelled by customer
select
booking_status,count(*) from blr_ola
group by booking_status order by count(*) desc

--top 3 reasons customers cancelling the rides
select reason_for_cancelling_by_customer,count(*) from blr_ola
group by reason_for_cancelling_by_customer order by count(*) desc

--top 3 reasons drivers cancelling the rides
select reason_for_cancelling_by_driver,count(*) from blr_ola
group by reason_for_cancelling_by_driver order by count(*) desc

--hour vs Cancellations
SELECT 
  CASE 
    WHEN EXTRACT(HOUR FROM ride_time) = 0 THEN '12 AM'
    WHEN EXTRACT(HOUR FROM ride_time) BETWEEN 1 AND 11 THEN 
      EXTRACT(HOUR FROM ride_time)::TEXT || ' AM'
    WHEN EXTRACT(HOUR FROM ride_time) = 12 THEN '12 PM'
    ELSE 
      (EXTRACT(HOUR FROM ride_time) - 12)::TEXT || ' PM'
  END AS hour_12_format,
  COUNT(*) AS Cancellations
FROM blr_ola 
WHERE booking_status = 'Cancelled by Customer'  -- Note: your data had space, not underscore
GROUP BY EXTRACT(HOUR FROM ride_time)
ORDER BY Cancellations DESC;


--wait time vs cancellations
select avg_vtat,booking_status from blr_ola
where booking_status='Cancelled by Customer' and avg_vtat !=null

--comparing wait times for completed and cancelled rides
select booking_status,avg(avg_vtat) from blr_ola
group by booking_status

--revenue by vehicle type
select vehicle_type,'Rs. '||round(sum(booking_value))::TEXT as revenue_generated from blr_ola
group by vehicle_type order by revenue_generated desc

--booking count by location
select pickup_location,count(*) as No_of_rides from blr_ola
group by pickup_location order by No_of_rides desc

--cancellation count by location
select pickup_location,count(booking_status) as Cancellation from blr_ola
where booking_status = 'Cancelled by Customer' or
booking_status='Cancelled by Driver'
group by pickup_location order by Cancellation desc

--most used payment method
select distinct payment_method,count(*) as ride_count from blr_ola
where payment_method is not null
group by payment_method
order by ride_count desc

--incomplete rides reason
select incomplete_rides_reason,count(*) from blr_ola
where incomplete_rides_reason is not null
group by incomplete_rides_reason

--distance vs booking value
select ride_distance,booking_value,vehicle_type,
booking_value/ride_distance as revenue_per_km
from blr_ola
where booking_value is not null
order by ride_distance desc,revenue_per_km desc