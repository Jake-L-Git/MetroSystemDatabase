-- creation of database
CREATE DATABASE Madrid_Metro_Lines;
USE Madrid_Metro_Lines;

-- enabling event scheduler, to later be used to update age and active cards
SET GLOBAL event_scheduler = ON;



-- Creating Zone Table
CREATE TABLE Zone (
	City VARCHAR(50) NOT NULL Primary Key,
    Zone VARCHAR(2) NOT NULL
);


-- Inserting Zone Data (static) based on what is provided in the documentation
INSERT INTO Zone (City, Zone)
VALUES 
('Madrid Centre', 'A');

-- Insert Zone B1
INSERT INTO Zone (City, Zone)
VALUES 
('Alcobendas', 'B1'),
('Alcorcón', 'B1'),
('Cantoblanco', 'B1'),
('Coslada', 'B1'),
('Facultad de Informática', 'B1'),
('Getafe', 'B1'),
('Leganés', 'B1'),
('Paracuellos del Jarama', 'B1'),
('Pozuelo de Alarcón', 'B1'),
('Rivas Vaciamadrid', 'B1'),
('San Fernando de Henares', 'B1'),
('San Sebastián de los Reyes', 'B1');

-- Insert Zone B2
INSERT INTO Zone (City, Zone)
VALUES 
('Ajalvir', 'B2'),
('Belvis y Los Berrocales Urb.', 'B2'),
('Boadilla del Monte', 'B2'),
('Fuenlabrada', 'B2'),
('Fuente del Fresno Urb.', 'B2'),
('Las Matas', 'B2'),
('Las Rozas de Madrid', 'B2'),
('Majadahonda', 'B2'),
('Mejorada del Campo', 'B2'),
('Móstoles', 'B2'),
('Parla', 'B2'),
('Pinto', 'B2'),
('Torrejón de Ardoz', 'B2'),
('Tres Cantos', 'B2'),
('Velilla de San Antonio', 'B2'),
('Villaviciosa de Odón', 'B2');

-- Insert Zone B3
INSERT INTO Zone (City, Zone)
VALUES 
('Alcalá de Henares', 'B3'),
('Algete', 'B3'),
('Arganda', 'B3'),
('Arroyomolinos', 'B3'),
('Brunete', 'B3'),
('Ciempozuelos', 'B3'),
('Ciudalcampo', 'B3'),
('Cobeña', 'B3'),
('Collado Villalba', 'B3'),
('Colmenar Viejo', 'B3'),
('Colmenarejo', 'B3'),
('Daganzo de Arriba', 'B3'),
('Galapagar', 'B3'),
('Griñón', 'B3'),
('Hoyo de Manzanares', 'B3'),
('Humanes de Madrid', 'B3'),
('Loeches', 'B3'),
('Moraleja de Enmedio', 'B3'),
('Navalcarnero', 'B3'),
('San Agustín de Guadalix', 'B3'),
('San Martín de la Vega', 'B3'),
('Torrejón de la Calzada', 'B3'),
('Torrejón de Velasco', 'B3'),
('Torrelodones', 'B3'),
('Valdemoro', 'B3'),
('Villanueva de la Cañada', 'B3'),
('Villanueva del Pardillo', 'B3');

-- Insert Zone C1
INSERT INTO Zone (City, Zone)
VALUES 
('El Álamo', 'C1'),
('Alpedrete', 'C1'),
('Anchuelo', 'C1'),
('Aranjuez', 'C1'),
('Batres', 'C1'),
('Becerril de la Sierra', 'C1'),
('El Boalo', 'C1'),
('Camarma de Esteruelas', 'C1'),
('Campo Real', 'C1'),
('Casarrubuelos', 'C1'),
('Collado-Mediano', 'C1'),
('Cubas de la Sagra', 'C1'),
('Chinchón', 'C1'),
('El Escorial', 'C1'),
('Fresno de Torote', 'C1'),
('Fuente el Saz de Jarama', 'C1'),
('Guadarrama', 'C1'),
('Manzanares El Real', 'C1'),
('Meco', 'C1'),
('El Molar', 'C1'),
('Moralzarzal', 'C1'),
('Morata de Tajuña', 'C1'),
('Pedrezuela', 'C1'),
('Perales de Tajuña', 'C1'),
('Pozuelo del Rey', 'C1'),
('Quijorna', 'C1'),
('Ribatejada', 'C1'),
('San Lorenzo de El Escorial', 'C1'),
('Los Santos de la Humosa', 'C1'),
('Serranillos del Valle', 'C1'),
('Sevilla la Nueva', 'C1'),
('Soto del Real', 'C1'),
('Titulcia', 'C1'),
('Torres de la Alameda', 'C1'),
('Valdeavero', 'C1'),
('Valdemorillo', 'C1'),
('Valdeolmos-Alalpardo', 'C1'),
('Valdetorres de Jarama', 'C1'),
('Valverde de Alcalá', 'C1'),
('Villaconejos', 'C1'),
('Villalbilla', 'C1');


-- Creation of Discount Table
CREATE TABLE Discount (
	DiscountType VARCHAR(50) NOT NULL Primary Key,
	DiscountAmount FLOAT CHECK (DiscountAmount > 0 AND DiscountAmount <= 1)
);

-- Insertion of Data (static) into Discount table to hold discounts and values of discounts (ex. if discount is 40%, value is 0.6)
INSERT INTO Discount (DiscountType, DiscountAmount)
VALUES 
	('BFN', 0.8),
    ('BFS', 0.6),
    ('DIS', 0.35),
    ('None', 1);
    

-- Creating BasePricing Table (determining base price for client based on agegroup and zone)
CREATE TABLE BasePricing (
	AgeGroup VARCHAR(20) NOT NULL Primary Key,
	A FLOAT NOT NULL,
    B1 FLOAT NOT NULL,
    B2 FLOAT NOT NULL,
    B3 FLOAT NOT NULL,
    C1 FLOAT NOT NULL,
    C2 FLOAT NOT NULL,
    E1 FLOAT NOT NULL,
    E2 FLOAT NOT NULL
);

-- Inserting static data into basepricing table 
INSERT INTO BasePricing (AgeGroup, A, B1, B2, B3, C1, C2, E1, E2)
VALUES 
	('Joven', 20.00, 20.00, 20.00, 20.00, 20.00, 20.00, 20.00, 20.00),
    ('Normal', 54.60, 63.70, 72.00, 82.00, 89.50, 99.30, 110.60, 131.80),
    ('Tercera Edad', 6.30, 6.30, 6.30, 6.30, 6.30, 6.30, 6.30, 6.30);



-- Creation of Client Table to store important data on client
CREATE TABLE Client (
CID INT Primary Key NOT NULL,
CFirstName VARCHAR(50) NOT NULL,
CLastName VARCHAR(50) NOT NULL, 
Phone VARCHAR(20) NOT NULL,
Email VARCHAR(50) NOT NULL, 
DOB DATE NOT NULL,
Age INT NOT NULL,
Is_Student BOOL,
AgeGroup VARCHAR(20) NOT NULL,
StreetAdd VARCHAR(50),
City VARCHAR(50) NOT NULL,
ZipCode INT,
cZone VARCHAR(2) NOT NULL,
DiscountType VARCHAR(30), 
Price FLOAT,
FOREIGN KEY (AgeGroup) REFERENCES BasePricing(AgeGroup) ON UPDATE CASCADE,
FOREIGN KEY (City) REFERENCES Zone(City) ON UPDATE CASCADE,
FOREIGN KEY (DiscountType) REFERENCES Discount(DiscountType) ON UPDATE CASCADE
);



-- SERIES OF TRIGGERS to fill important derived attributes of Client


-- Calculates client age based on DOB (on insertion)
DELIMITER $$$

CREATE TRIGGER CalculateAge
BEFORE INSERT ON Client
FOR EACH ROW
BEGIN
    SET NEW.Age = YEAR(CURRENT_DATE()) - YEAR(NEW.DOB)
                 - (MONTH(CURRENT_DATE()) < MONTH(NEW.DOB) OR 
                    (MONTH(CURRENT_DATE()) = MONTH(NEW.DOB) AND DAY(CURRENT_DATE()) < DAY(NEW.DOB)));
END$$$

DELIMITER ;

-- Calculates client age based on DOB (on update)
DELIMITER $$

CREATE TRIGGER CalculateAgeUP
BEFORE UPDATE ON Client
FOR EACH ROW
BEGIN
    SET NEW.Age = YEAR(CURRENT_DATE()) - YEAR(NEW.DOB)
                 - (MONTH(CURRENT_DATE()) < MONTH(NEW.DOB) OR 
                    (MONTH(CURRENT_DATE()) = MONTH(NEW.DOB) AND DAY(CURRENT_DATE()) < DAY(NEW.DOB)));
END$$

DELIMITER ;


-- Determines age group of client based on their age (on insertion)
-- (and whether or not they are a student... people over 26 are considered joven if they are student)
DELIMITER $$

CREATE TRIGGER AssignAgeGroup
BEFORE INSERT ON Client
FOR EACH ROW
BEGIN
    IF NEW.Is_Student THEN
		SET NEW.AgeGroup = 'Joven';
    ELSEIF NEW.Age < 26 THEN
        SET NEW.AgeGroup = 'Joven';
    ELSEIF NEW.Age BETWEEN 26 AND 65 THEN
        SET NEW.AgeGroup = 'Normal';
    ELSEIF NEW.Age >= 65 THEN
        SET NEW.AgeGroup = 'Tercera Edad';
    END IF;
END$$

DELIMITER ;


-- Determines age group of client based on their age (on update)
DELIMITER $$

CREATE TRIGGER AssignAgeGroupUP
BEFORE UPDATE ON Client
FOR EACH ROW
BEGIN
    IF NEW.Is_Student THEN
		SET NEW.AgeGroup = 'Joven';
    ELSEIF NEW.Age < 26 THEN
        SET NEW.AgeGroup = 'Joven';
    ELSEIF NEW.Age BETWEEN 26 AND 65 THEN
        SET NEW.AgeGroup = 'Normal';
    ELSEIF NEW.Age >= 65 THEN
        SET NEW.AgeGroup = 'Tercera Edad';
    END IF;
END$$


DELIMITER ;

-- Uses and event to update client age each day (age group automatically updates on this update) to help determine if pricing should change for them
DELIMITER $$

CREATE EVENT UpdateAgeAndAgeGroup
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO
    -- Updates clients age
    UPDATE Client
    SET Age = YEAR(CURRENT_DATE()) - YEAR(DOB)
              - (MONTH(CURRENT_DATE()) < MONTH(DOB) OR 
                 (MONTH(CURRENT_DATE()) = MONTH(DOB) AND DAY(CURRENT_DATE()) < DAY(DOB)));
$$DELIMITER ;






-- Uses the zip code or city of the client in order to determine their zone (on insertion)
DELIMITER $$

CREATE TRIGGER FindZone
BEFORE INSERT ON Client
FOR EACH ROW
BEGIN
	-- first checks the zipcode, as all zipcodes starting with 280 are in madrid centre
    IF NEW.ZipCode LIKE '280%' THEN
		SET NEW.cZone = (SELECT Zone 
			FROM Zone 
			WHERE Zone.City = 'Madrid Centre');
	ELSE
		SET NEW.cZone = (SELECT Zone 
			FROM Zone 
			WHERE Zone.City = NEW.City);
    END IF;
END$$

DELIMITER ;


-- Uses the zip code or city of the client in order to determine their zone (on update)
DELIMITER $$

CREATE TRIGGER FindZoneUP
BEFORE UPDATE ON Client
FOR EACH ROW
BEGIN
    -- first checks the zipcode, as all zipcodes starting with 280 are in madrid centre
	IF NEW.ZipCode LIKE '280%' THEN
		SET NEW.cZone = (SELECT Zone 
			FROM Zone 
			WHERE Zone.City = 'Madrid Centre');
	ELSE
		SET NEW.cZone = (SELECT Zone 
			FROM Zone 
			WHERE Zone.City = NEW.City);
    END IF;
END$$

DELIMITER ;


-- Uses the basepricing table to calculate the clients base price for a metrocard based on their agegroup, zone, and discount (on insertion)
DELIMITER $$

CREATE TRIGGER CalculateTotalPrice
BEFORE INSERT ON Client
FOR EACH ROW
BEGIN
	DECLARE discount_ammount FLOAT;
    SET NEW.Price = (
        CASE NEW.cZone
            WHEN 'A' THEN (SELECT A FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            WHEN 'B1' THEN (SELECT B1 FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            WHEN 'B2' THEN (SELECT B2 FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            WHEN 'B3' THEN (SELECT B3 FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            WHEN 'C1' THEN (SELECT C1 FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            WHEN 'C2' THEN (SELECT C2 FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            WHEN 'E1' THEN (SELECT E1 FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            WHEN 'E2' THEN (SELECT E2 FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            ELSE NULL
        END
    );
    
	-- applies their discount if they have one to get the final price
    IF NEW.DiscountType IS NOT NULL THEN
		
		SET discount_ammount = (SELECT DiscountAmount 
			FROM Discount 
			WHERE Discount.DiscountType = NEW.DiscountType);
        SET NEW.Price = NEW.Price * (discount_ammount);
    END IF;
END$$

DELIMITER ;


-- Uses the basepricing table to calculate the clients base price for a metrocard based on their agegroup, zone, and discount (on update)
DELIMITER $$

CREATE TRIGGER CalculateTotalPriceUP
BEFORE UPDATE ON Client
FOR EACH ROW
BEGIN
	DECLARE discount_ammount FLOAT;

    SET NEW.Price = (
        CASE NEW.cZone
            WHEN 'A' THEN (SELECT A FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            WHEN 'B1' THEN (SELECT B1 FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            WHEN 'B2' THEN (SELECT B2 FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            WHEN 'B3' THEN (SELECT B3 FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            WHEN 'C1' THEN (SELECT C1 FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            WHEN 'C2' THEN (SELECT C2 FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            WHEN 'E1' THEN (SELECT E1 FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            WHEN 'E2' THEN (SELECT E2 FROM BasePricing WHERE AgeGroup = NEW.AgeGroup)
            ELSE NULL
        END
    );
    
	-- applies their discount if they have one to get the final price
    
    IF NEW.DiscountType IS NOT NULL THEN
		
		SET discount_ammount = (SELECT DiscountAmount 
			FROM Discount 
			WHERE Discount.DiscountType = NEW.DiscountType);
        SET NEW.Price = NEW.Price * (discount_ammount);
    END IF;
END$$

DELIMITER ;


-- Inserting example clients into client table!

INSERT INTO Client 
(CID, CFirstName, CLastName, Phone, Email, DOB, Is_Student, StreetAdd, City, ZipCode, DiscountType) 
VALUES
(1, 'Alice', 'Johnson', '123-456-7890', 'alice.johnson@example.com', '2005-12-20', TRUE, '123 Main St', 'Pozuelo de Alarcón', 28101, 'BFN'),
(2, 'Bob', 'Smith', '987-654-3210', 'bob.smith@example.com', '1990-11-25', FALSE, '456 Oak St', 'Madrid Centre', 28028, 'None'),
(3, 'Charlie', 'Brown', '555-555-5555', 'charlie.brown@example.com', '1960-04-10', FALSE, '789 Pine St', 'Pozuelo de Alarcón', 28223, 'BFS'),
(4, 'Diana', 'Prince', '333-333-3333', 'diana.prince@example.com', '2002-01-30', TRUE, '101 Elm St', 'Rivas Vaciamadrid', 28521, 'DIS'),
(5, 'Edward', 'Norton', '444-444-4444', 'edward.norton@example.com', '1985-07-20', FALSE, '202 Maple St', 'Tres Cantos', 28760, 'None'),
(6, 'Fiona', 'Green', '222-222-2222', 'fiona.green@example.com', '1999-05-15', TRUE, '12 Willow Way', 'Madrid Centre', 28028, 'BFN'),
(7, 'George', 'Miller', '888-888-8888', 'george.miller@example.com', '1978-09-12', FALSE, '45 Cedar St', 'Rivas Vaciamadrid', 28522, 'DIS'),
(8, 'Hannah', 'Adams', '999-999-9999', 'hannah.adams@example.com', '1995-03-08', TRUE, '78 Birch Blvd', 'Pozuelo de Alarcón', 28224, 'BFS'),
(9, 'Ian', 'Walker', '111-111-1111', 'ian.walker@example.com', '1965-10-23', FALSE, '34 Aspen Dr', 'Tres Cantos', 28761, 'None'),
(10, 'Julia', 'Lopez', '666-666-6666', 'julia.lopez@example.com', '1987-07-14', FALSE, '89 Spruce Ln', 'Madrid Centre', 28028, 'BFN'),
(11, 'Kevin', 'Brown', '777-777-7777', 'kevin.brown@example.com', '1982-04-25', TRUE, '92 Elmwood Ave', 'Madrid Centre', 28028, 'None'),
(12, 'Laura', 'White', '444-444-4444', 'laura.white@example.com', '2004-11-16', FALSE, '66 Poplar St', 'Rivas Vaciamadrid', 28523, 'DIS'),
(13, 'Michael', 'Davis', '555-555-5555', 'michael.davis@example.com', '1991-02-28', TRUE, '29 Maple Way', 'Pozuelo de Alarcón', 28225, 'BFS'),
(14, 'Natalie', 'Moore', '333-333-3333', 'natalie.moore@example.com', '1980-12-05', FALSE, '18 Redwood Ct', 'Tres Cantos', 28762, 'None'),
(15, 'Oliver', 'Clark', '222-333-4444', 'oliver.clark@example.com', '1974-06-22', FALSE, '72 Pine Ridge', 'Leganés', 28910, 'DIS'),
(16, 'Phil', 'Dias', '221-323-4443', 'phil.dias@example.com', '1978-06-22', TRUE, '71 Pine Ridge', 'Leganés', 28910, 'BFS'),
(17, 'Sam', 'Marshall', '252-363-4434', 'sam.marshall@example.com', '1976-06-22', FALSE, '77 Pine Ridge', 'Leganés', 28910, 'None');


-- creates table for metro card
CREATE TABLE MetroCard (
	CardNum INT NOT NULL Primary Key,
	CID INT NOT NULL,
	is_Active BOOL NOT NULL,
	RechargeDate DATE NOT NULL,
	FOREIGN KEY (CID) REFERENCES Client(CID) ON UPDATE CASCADE ON DELETE CASCADE
);

-- event to deactivite expired metro cards, checking if they are 30 days past their last recharge date
DELIMITER $$

CREATE EVENT DeactivateExpiredMetroCards
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    UPDATE MetroCard
    SET is_Active = 0 
    WHERE is_Active = 1 
      AND DATEDIFF(CURRENT_DATE(), RechargeDate) > 30;
END$$

DELIMITER ;


-- making it so that when we delete a card, its balance and recharge date are transfered to a new card with all the same info but different card num
DELIMITER $$

CREATE TRIGGER TransferMetroCardOnInsert
BEFORE INSERT ON MetroCard
FOR EACH ROW
BEGIN
    -- when a new card is inserted, check that there is not already a client with this metro card, then check if there is a client with a deactivated card
    IF EXISTS (SELECT 1 
               FROM MetroCard 
               WHERE CID = NEW.CID AND is_Active = 1) THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'This client already has an active card.';
    ELSEIF EXISTS (SELECT 1 
               FROM MetroCard 
               WHERE CID = NEW.CID AND is_Active = 0) THEN
        -- Set the RechargeDate to RechargeDate of old card
        SET NEW.RechargeDate = (SELECT RechargeDate
				FROM MetroCard
				WHERE CID = NEW.CID AND is_Active = 0
				LIMIT 1);
    END IF;
END$$

DELIMITER ;

-- Trigger to check if a card is still active (within 30 days of last recharge date (helpful for when replacing card)
DELIMITER $$

CREATE TRIGGER ActiveCard
BEFORE INSERT ON MetroCard
FOR EACH ROW
BEGIN
    IF NEW.RechargeDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY) THEN
        SET NEW.is_Active = TRUE;
    ELSE
        SET NEW.is_Active = FALSE;
    END IF;
END$$

DELIMITER ;


-- Trigger to check if a card is still active (within 30 days of last recharge date) also allows functionality of canceling a card (setting it to inactive)
DELIMITER $$

CREATE TRIGGER ActiveCardUp
BEFORE UPDATE ON MetroCard
FOR EACH ROW
BEGIN
    IF NEW.RechargeDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY) AND NEW.is_Active = TRUE THEN
        SET NEW.is_Active = TRUE;
    ELSE
        SET NEW.is_Active = FALSE;
    END IF;
END$$

DELIMITER ;


-- inserting basic starting data into Metro Card
INSERT INTO MetroCard (CardNum, CID, is_Active, RechargeDate)
VALUES
(101, 1, TRUE, '2023-12-01'),
(102, 4, TRUE, '2023-12-05'),
(103, 6, TRUE, '2023-11-28'),
(104, 8, TRUE, '2023-12-03'),
(105, 11, TRUE, '2023-12-06'),
(106, 13, TRUE, '2023-12-02'),
(107, 16, TRUE, '2023-12-04'),
(108, 2, TRUE, '2023-12-04'),
(109, 3, TRUE, '2023-12-04'),
(110, 5, TRUE, '2023-12-04'),
(111, 7, TRUE, '2023-12-04'),
(112, 9, TRUE, '2023-12-04'),
(113, 10, TRUE, '2023-12-04'),
(114, 12, FALSE, '2023-06-18'),
(115, 14, FALSE, '2023-05-22'),
(116, 15, FALSE, '2023-08-01'),
(117, 17, FALSE, '2023-07-15');

-- table for multi entrance card
CREATE TABLE MultiEntryCard (
	CardNum INT NOT NULL Primary Key,
	Balance FLOAT NOT NULL
);

-- trigger to ensure that we cannot "update" a card to below 1.7 euros
DELIMITER $$

CREATE TRIGGER MultiEntrySwipe 
BEFORE UPDATE ON MultiEntryCard 
FOR EACH ROW
BEGIN
	IF NEW.Balance < 1.7 THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Balance too low';
    END IF;
END$$
DELIMITER ;


-- ensures we can't insert a card with a starting balance less than 12 euros
DELIMITER $$

CREATE TRIGGER BalanceMinimum 
BEFORE INSERT ON MultiEntryCard 
FOR EACH ROW
BEGIN
	IF NEW.Balance < 12 THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Balance must be at least 12 euros';
    END IF;
END$$

DELIMITER ;


INSERT INTO MultiEntryCard 
(CardNum, Balance) 
VALUES
(11, 50),
(12, 13);






