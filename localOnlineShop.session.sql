/* 
This code deploy a database for an online shop with different table.
The UML linked to this database can be found in the .jpg in the Git project.
*/
-- Create database
CREATE DATABASE OnlineShop;
USE OnlineShop;

-- Categories' Table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY, -- PK
    name VARCHAR(255) NOT NULL, -- categorie's name 
    description TEXT 

-- Products' Table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL, -- unit price
    stock INT NOT NULL, 
    categorieID INT, -- FK linked to the table categories
    FOREIGN KEY (categorieID) REFERENCES categories(id)
);

-- Clients' Table
CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL, 
    email VARCHAR(255) NOT NULL UNIQUE, -- One client by mail
    address TEXT,
    city VARCHAR(255),
    postalCode VARCHAR(10),
    Country VARCHAR(255)
);

-- Orders' Table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    clientID INT,
    orderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2),
    statut ENUM('waiting', 'processing', 'sent', 'delivered', 'canceled') DEFAULT 'waiting',
    FOREIGN KEY (clientID) REFERENCES clients(id)
);

-- Orders' details' Table
CREATE TABLE detailsOrder (
    id INT AUTO_INCREMENT PRIMARY KEY,
    commandeID INT,
    productID INT,
    quantity INT NOT NULL,
    unitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (commandeID) REFERENCES orders(id),
    FOREIGN KEY (productID) REFERENCES products(id)
);

-- Comments' Table
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produitID INT,
    clientID INT,
    grade INT CHECK (grade >= 1 AND grade <= 5),
    comment TEXT,
    commentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (productID) REFERENCES products(id),
    FOREIGN KEY (clientID) REFERENCES clients(id)
);
