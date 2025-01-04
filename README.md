# Madrid Metro System Database
Database for the Madrid Metro System
Database Management System

The Madrid Metro System is a complex network that millions of people rely on each day. Here, I designed a database solution for this network to assist with card/ticket management. 

I utilized this project to practice good database design, working from the ground up, form improving research skills, design reviews, database design techniques (minimum redundancy, constraints, triggers, etc.), and much more.


# Metro System Overview
Some basic outlines of the Madrid Metro System are given below (this is not all of them): 
-	Clients register to buy personal Madrid Metro cards (limited to 1 per client), which must be recharged monthly.
-	If Client's lose their card clients must be able to replace the card and keep however much "charge" was on the old card. 
-	Client also can buy multi-entrance card (no limit), the first purchase the client must pay at least 12 euro. To recharge this card, the minimum payment is 1.7 euro. Each use for this card will detect 1.7 euro. [Note: the multi-entrance card is not refundable]
-	So essentially, the personal metro card is payed for via a set price each month and has unlimited uses, while a multi-entrance card is loaded up with money and is deducted a set fee per ride

According to Madrid Metro, there are diverse types of clients, each type has special price for their personal metro card.
-	The “Joven” for people under 26 years (or student), it will have a cost of 20 euros per month.
-	The “Normal”, for people over 26 years old (not students)[see Table 1].
-	For “Seniors” (over 65) the price drops to 6.30 euros per month.

The transportation system in Madrid works by zones: A, B1, B2, B3, C1, C2, (E1, E2, outside the Community of Madrid)
 
Depending on where the client lives or is going to live, the costs will change as in the following.

 <img width="270" alt="image" src="https://github.com/user-attachments/assets/44c91487-af5b-4c05-aa28-e666819a85d7" />
 <br />
 Table 1: Madrid Metro Zones
 <br />
 <br />
 <img width="294" alt="image" src="https://github.com/user-attachments/assets/fbae353f-493f-4ec8-b509-79aeb07293d8" />
 <br />
 Table 2: Pricing base on zone and type of client
<br />
 <br />

In addition to the basic pricing scheme, the Madrid community offers exclusive discounts for all public services and transportations for personal cards for the following: 
<br />
Holder of Big Family Normal --> 20%
<br />
Holder for Big Family Special--> 40%
<br />




