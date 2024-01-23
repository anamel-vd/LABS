
CREATE Cars;

USE Cars;

CREATE TABLE Cars (
  vehicle_identification_number VARCHAR(40) UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
  manufacturer VARCHAR(45) NULL,
  model VARCHAR(20) NOT NULL,
  car_year INT NOT NULL,
  color VARCHAR(20) NOT NULL);
  
CREATE TABLE Customers (
  customer_ID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
  customer_name VARCHAR(20) NULL,
  phone_number VARCHAR(45) NULL,
  email  VARCHAR(45) NULL,
  address  VARCHAR(45) NULL,
  city  VARCHAR(45) NULL,
  state_or_province  VARCHAR(45) NULL,
  postal_code INT NULL);

CREATE TABLE Salespersons (
  staff_ID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
  staff_name VARCHAR(45) NOT NULL,
  store VARCHAR(45) NOT NULL);
  
CREATE TABLE Invoices (
  invoice_number INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
  invoice_date DATE NOT NULL,
  vehicle_identification_number INT UNSIGNED UNIQUE NOT NULL,
  customer_ID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
  staff_ID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT);
  
  FOREIGN KEY (vehicle_identification_number) REFERENCES Cars(vehicle_identification_number),
  FOREIGN KEY (customer_ID) REFERENCES Customers(customer_ID),
  FOREIGN KEY (staff_ID) REFERENCES Salespersons(staff_ID);
  
  
  
    