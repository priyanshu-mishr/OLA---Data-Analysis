create database ola;
use ola;

-- Retrieve all successful bookings 
create view Successful_Bookings as
select * from Bookings 
where Booking_Status = "Success";

-- Find the average ride distance for each vehicle type:
create view Ride_Distance_For_Each_Vehicle as
select  vehicle_Type, avg(Ride_Distance) as Avg_Distance from Bookings
group by vehicle_Type;

-- Get the total number of cancelled rides by customers:
create view Cancelled_Rideds_By_Customers as
select count(*) from Bookings
where Booking_Status = "Canceled by Customer";

-- List the top 5 customers who booked the highest number of rides:
create view Top_5_Customers as
select Customer_ID, count(Booking_ID) as Total_Rides from Bookings
group by Customer_ID
order by Total_Rides desc limit 5;

-- Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_cancelled_by_Drivers_P_C_Issuess as
select count(*) from Bookings
where Canceled_Rides_by_Driver = "Personal & Car related issue";

-- Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Max_Min_Driver_Rating as
select Vehicle_Type, max(Driver_Ratings) as Max_Rasting, min(Driver_Ratings)as Min_Rasting from Bookings
where Vehicle_Type = "Prime Sedan";

-- Retrieve all rides where payment was made using UPI:
create view UPI_Payment as
select Payment_Method from Bookings 
where Payment_Method = "UPI";

-- Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating as
select Vehicle_Type, avg(Customer_Rating) from Bookings
group by Vehicle_Type;

-- Calculate the total booking value of rides completed successfully:
create view total_successful_ride_value as
select Booking_Status, sum(Booking_Value) from Bookings
where Booking_Status = "Success";

-- List all incomplete rides along with the reason:
create view Incomplete_Rides_Reason as
select Booking_ID, Incomplete_Rides_Reason from Bookings
where Incomplete_Rides = "Yes";











 