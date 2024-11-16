create database hotel;
use hotel;
drop database hotel;

create table Rooms(
	RoomID  int Primary key auto_increment,
    RoomType varchar(155) not null,
    RoomNumber int unique,
    capacity int not null,
    Rate int not null
);

create table Guests(
	GuestID int primary key auto_increment,
    FirstName varchar(155) not null,
    LastName varchar(155) not null,
    Email varchar(155) unique not null,
    phone varchar(155) not null
);
create table Reservations(
	ReservationID int primary key auto_increment,
    GuestID int,
    RoomID int,
    CheckInDate Date not null,
    CheckOutDate Date not null,
    TotalCost int not null,
    Foreign key(GuestID) References Guests(GuestID),
	Foreign key(RoomID) References Rooms(RoomID)
);
create table Payments(
		PaymentID int primary key auto_increment,
        ReservationID int,
        PaymentMethod varchar(155) not null,
        PaymentDate Date not null,
        Amount int not null,
        Foreign key(ReservationID) References Reservations(ReservationID)
);
create table Staff(
		StaffID int primary key auto_increment,
		FirstName varchar(155) not null,
		LastName varchar(155) not null,
		StaffRole varchar(155) not null,
		Email varchar(155) unique not null
);
INSERT INTO Rooms (RoomID, RoomType, RoomNumber, Capacity, Rate)
VALUES
(1, 'Deluxe', 101, 2, 1500),
(2, 'Suite', 202, 4, 3000),
(3, 'Standard', 303, 1, 1000),
(4, 'Executive', 404, 2, 2000),
(5, 'Luxury', 505, 4, 4000);

INSERT INTO Guests (GuestID, FirstName, LastName, Email, Phone)
VALUES
(1, 'John', 'Prabhu', 'john@gmail.com', '9878675645'),
(2, 'Jana', 'krishna', 'jana@gmail.com', '9345234567'),
(3, 'Baby', 'Sharmila', 'sharmila@gmail.com', '9867562342'),
(4, 'suki', 'Bala', 'suki@gmail.com', '8976458976'),
(5, 'Dharani', 'Subramanian', 'dharani@gmail.com', '8976543423');

INSERT INTO Reservations (ReservationID, GuestID, RoomID, CheckInDate, CheckOutDate, TotalCost)
VALUES
(1, 1, 1, '2024-03-01', '2024-03-03', 4500),
(2, 2, 2, '2024-03-05', '2024-03-07', 6000),
(3, 3, 3, '2024-03-10', '2024-03-12', 2000),
(4, 4, 4, '2024-03-15', '2024-03-17', 4000),
(5, 5, 5, '2024-03-20', '2024-03-22', 8000);

INSERT INTO Payments (PaymentID, ReservationID, PaymentMethod, PaymentDate, Amount)
VALUES
(1, 1, 'Credit Card', '2024-02-20', 4500),
(2, 2, 'Cash', '2024-03-05', 6000),
(3, 3, 'Bank Transfer', '2024-03-09', 2000),
(4, 4, 'Credit Card', '2024-03-14', 4000),
(5, 5, 'Cash', '2024-03-19', 8000);

INSERT INTO Staff (StaffID, FirstName, LastName, StaffRole, Email)
VALUES
(1, 'Sam', 'kumar', 'Manager', 'sam@gmail.com'),
(2, 'dani', 'joyson', 'Receptionist', 'dani@gmail.com'),
(3, 'sara', 'sri', 'Housekeeping', 'sara@gmail.com'),
(4, 'david', 'james', 'Front Desk', 'david@gmail.com'),
(5, 'krishna', 'Moorthy', 'Maintenance', 'krishna@gmail.com');
select * from Rooms;
select * from Guests;
select * from Reservations;
select * from Payments;
select * from Staff;
SELECT 
    r.ReservationID, 
    g.FirstName, 
    g.LastName, 
    ro.RoomType, 
    r.CheckInDate, 
    r.CheckOutDate, 
    p.PaymentMethod, 
    p.Amount
FROM 
    Reservations r
JOIN 
    Guests g ON r.GuestID = g.GuestID
JOIN 
    Rooms ro ON r.RoomID = ro.RoomID
JOIN 
    Payments p ON r.ReservationID = p.ReservationID;

SELECT * FROM Reservations WHERE CheckInDate = '2024-03-01';
SELECT * FROM Guests WHERE FirstName = 'John'; 
SELECT * FROM Reservations ORDER BY CheckInDate desc;
set sql_safe_updates=0;
update Guests set FirstName = "Nivetha" where GuestID = 5;
select * from Payments Group by PaymentMethod; 
select concat(firstname,lastname) as fullname from Guests;
select * from payments group by paymentmethod having amount > 3000;
select distinct paymentmethod from payments;
alter table reservations modify column checkindate datetime;
select paymentmethod,count(*) as total_count from payments group by paymentmethod;
select * from guests where firstname like 'j%';
select * from guests where firstname like '%a';
select * from guests where lastname like '%ar%';
select * from guests where firstname like 'j__%';
select sum(amount) from payments;
select max(amount) from payments;
select min(amount) from payments;
select avg(amount) from payments;
select * from payments where amount=( select min(amount) from payments);
select * from reservations as r left join guests as g on g.guestid = r.reservationid
union
select * from reservations as r right join guests as g on g.guestid = r.reservationid;
select * from reservations as r inner join guests as g on g.guestid = r.reservationid;
