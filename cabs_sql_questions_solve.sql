-- SQL Questions:
-- 1. Retrieve all successful bookings:
create view Successful_Bookings as 
select * from bookings where Booking_Status="success";

-- 2 Find the average ride distance for each vehicle type:

create view avg_distance_by_vehicle as
select Vehicle_Type,round(avg(Ride_Distance),2) as Avg_distance  from bookings group by Vehicle_Type order by Vehicle_Type;

-- 3. Get the total number of canceled rides by customers:
create view count_canceled_by_customer as
select count(*) from bookings where Booking_Status="Canceled by Customer";

select * from bookings;

-- 4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select Customer_ID, count(Customer_ID) as total_rides from bookings group by Customer_ID order by total_rides desc limit 5;

-- 5. Get the number of rides canceled by drivers due to personal and car-related issues:
create view canceled_by_driver_issue as 
select count(*) from bookings where Canceled_Rides_by_Driver="Personal & Car related issue";


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view driver_rating_prime_sedan as
select Vehicle_Type ,max(Driver_Ratings) as max_rating, min(Driver_Ratings) as min_rating from bookings where Vehicle_Type='Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI:
create view payment_via_upi as
select * from bookings where Payment_Method="UPI";

-- 8. Find the average customer rating per vehicle type:
create view customer_rating_vehicle as
select Vehicle_Type, round(avg(Customer_Rating),2) as avg_customer_rating from bookings group by Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:
create view sum_successful_rides as
select sum(Booking_Value) from bookings where Booking_Status="Success";

-- 10. List all incomplete rides along with the reason:
create view incomplete_rides_with_reason as
select booking_id ,Incomplete_Rides_Reason from bookings where Incomplete_Rides="yes";


