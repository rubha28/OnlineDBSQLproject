CREATE DATABASE OnlineShoppingDB;
USE OnlineShoppingDB;


CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    address TEXT
);

select * from users;


CREATE TABLE Categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);
select * from categories;

-- Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
select * from products;

-- Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending',
    total_amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
select * from orders;

-- OrderItems Table
CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
select * from orderitems;

-- Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'debit_card', 'paypal', 'net_banking'),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE
);

select * from payments;

-- Reviews Table
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
select * from reviews;

INSERT INTO Users (name, email, password_hash, phone, address) VALUES
('Alice Smith', 'alice1@example.com', '8f2a7c4', '555-1234560', '123 Maple Street, Springfield'),('Bob Johnson', 'bob2@example.com', '9e3d6a', '555-1234561', '456 Oak Street, Riverdale'),
('Carol Davis', 'carol3@example.com', '7f2b8d', '555-1234562', '789 Pine Avenue, Centerville'),('David Wilson', 'david4@example.com', '1a2f5e', '555-1234563', '321 Birch Road, Greenville'),
('Eve Moore', 'eve5@example.com', '9f2d7', '555-1234564', '654 Elm Street, Lakeside'),('Frank Taylor', 'frank6@example.com', '5d6f', '555-1234565', '987 Cedar Blvd, Hilltown'),
('Grace Anderson', 'grace7@example.com', '3f8ardc', '555-1234566', '159 Willow St, Ridgeview'),('Henry Thomas', 'henry8@example.com', '2c4d6a3', '555-1234567', '753 Poplar Ave, Bayport'),
('Isabella Jackson', 'isabella9@example.com', '7a3f1c2', '555-1234568', '258 Fir Court, Brookfield'),('Jack White', 'jack10@example.com', '4e5a9d', '555-1234569', '357 Sycamore Ln, Westwood'),('Finn Martin', 'finn31@example.com', 'asd678f', '555-1234590', '330 Oakwood Ave, Westfield'),
('Gina Porter', 'gina32@example.com', 'lkj765po', '555-1234591', '903 Arbor St, Cedarville'),('Harry Gray', 'harry33@example.com', 'uhb98721', '555-1234592', '75 Pinebrook Dr, Bayview'),
('Ivy Russell', 'ivy34@example.com', 'bgt234n', '555-1234593', '17 Forest Edge Rd, Fairview'),('Jason Price', 'jason35@example.com', 'cde543vf', '555-1234594', '218 Willow Path, Clearfield'),
('Kara Lane', 'kara36@example.com', 'qaz789wsx', '555-1234595', '79 Mulberry Ln, Roseville'),('Leo Carter', 'leo37@example.com', 'xsw345rf', '555-1234596', '47 Alder Row, Redwood'),
('Maya Powell', 'maya38@example.com', 'nhy456uj', '555-1234597', '266 Aspen Circle, Foxdale'),('Nick Brooks', 'nick39@example.com', 'vfr567t', '555-1234598', '181 Sequoia Blvd, Willowbank'),
('Olga Simmons', 'olga40@example.com', 'cvb2340', '555-1234599', '42 Poplar Place, Glenwood');

select * from users;

INSERT INTO Users (name, email, password_hash, phone, address) VALUES('Victor Wright', 'victor21@example.com', 'ghj321edc876qwe543', '555-1234580', '744 Alder Rd, Kingsport'),
('Wendy Lopez', 'wendy22@example.com', 'bnm234vfr567tyu123', '555-1234581', '55 Spruce Blvd, Crestwood'),('Xander Hill', 'xander23@example.com', 'poi659@nb321', '555-1234582', '332 Ironwood St, Willowdale'),
('Yara Adams', 'yara24@example.com', 'okm@hb876', '555-1234583', '144 Aspen Ridge Rd, Mapleton'),('Zack Baker', 'zack25@example.com', 'uij8@b234', '555-1234584', '907 Sandalwood Way, Oakridge'),
('Amy Foster', 'amy26@example.com', 'mnb12@34', '555-1234585', '61 Hawthorn Ave, Laketown'),('Brian Knight', 'brian27@example.com', 'tgb65#7', '555-1234586', '817 Ivy Ln, Ashwood'),
('Cathy Reed', 'cathy28@example.com', 'qwe987@', '555-1234587', '294 Olive Ct, Springdale'),('Derek Black', 'derek29@example.com', 'zer$789', '555-1234588', '610 Chestnut Way, Brookhaven'),
('Ella Barnes', 'ella30@example.com', 'ghj2@123', '555-1234589', '723 Peach Ln, Southridge');
INSERT INTO Users (name, email, password_hash, phone, address) VALUE('Harry Gray', 'harry@example.com', 'uhb987ijn654okm321', '555-1234592', '75 Pinebrook Dr, Bayview');
INSERT INTO Users (name, email, password_hash, phone, address) VALUES('Ivy Russell', 'ivy@example.com', 'bgt234nhy567mju890', '555-1234593', '17 Forest Edge Rd, Fairview');
INSERT INTO Users (name, email, password_hash, phone, address) VALUES('Jason Price', 'jason@example.com', 'cde543vfr678bgt098', '555-1234594', '218 Willow Path, Clearfield');
INSERT INTO Users (name, email, password_hash, phone, address) VALUES('Kara Lane', 'kara@example.com', 'qaz789wsx456edc321', '555-1234595', '79 Mulberry Ln, Roseville'),('Leo Carter', 'leo@example.com', 'xsw345rfv789tgb123', '555-1234596', '47 Alder Row, Redwood');
INSERT INTO Users (name, email, password_hash, phone, address) VALUES('Maya Powell', 'maya@example.com', 'nhy456ujm789ikl234', '555-1234597', '266 Aspen Circle, Foxdale'),('Nick Brooks', 'nick@example.com', 'vfr567tgb890yhn543', '555-1234598', '181 Sequoia Blvd, Willowbank');
INSERT INTO Users (name, email, password_hash, phone, address) VALUES('Pam Cross', 'pam@example.com', 'hash41', '555-1234600', '101 Elm Cir, Springfield'),('Quincy Lowe', 'quincy@example.com', 'hash42', '555-1234601', '102 Maple Ave, Hilltop'),('Rachel Myers', 'rachel43@example.com', 'hash43', '555-1234602', '103 Cedar Ln, Riverdale'),
('Sam Perry', 'sam@example.com', 'hash44', '555-1234603', '104 Pine Dr, Greentown'),('Tori Grant', 'tori@example.com', 'hash45', '555-1234604', '105 Birch Blvd, Clearwater'),
('Zoe West', 'zoe@example.com', 'hash100', '555-1234699', '200 Willow Way, Newtown');
INSERT INTO Users (name, email, password_hash, phone, address) VALUES
('Aaron Bell', 'aaron101@example.com', 'pwdhash101', '555-2000101', '12 Maple St, Ashville'),
('Becca Norris', 'becca102@example.com', 'pwdhash102', '555-2000102', '98 Oak Dr, Riverpoint'),('Caleb Stone', 'caleb103@example.com', 'pwdhash103', '555-2000103', '45 Pine Blvd, Meadowdale'),
('Dana Holt', 'dana104@example.com', 'pwdhash104', '555-2000104', '76 Elm Ct, Cresthill'),('Ethan Ward', 'ethan105@example.com', 'pwdhash105', '555-2000105', '23 Cedar St, Northbay'),
('Fiona Boyd', 'fiona106@example.com', 'pwdhash106', '555-2000106', '88 Birch Rd, Southridge'),('Gavin Fox', 'gavin107@example.com', 'pwdhash107', '555-2000107', '14 Poplar Ln, Lakeside'),
('Hailey Ray', 'hailey108@example.com', 'pwdhash108', '555-2000108', '61 Willow Ave, Hillbrook'),('Ian Burke', 'ian109@example.com', 'pwdhash109', '555-2000109', '37 Redwood Ct, Greenbank'),
('Jade Lamb', 'jade110@example.com', 'pwdhash110', '555-2000110', '92 Magnolia Blvd, Springpark'),('Kevin Dean', 'kevin111@example.com', 'pwdhash111', '555-2000111', '27 Aspen Ln, Woodgrove'),
('Lana Craig', 'lana112@example.com', 'pwdhash112', '555-2000112', '83 Dogwood Dr, Rivervale'),('Mason Reid', 'mason113@example.com', 'pwdhash113', '555-2000113', '48 Sequoia St, Fairridge'),
('Nora Todd', 'nora114@example.com', 'pwdhash114', '555-2000114', '59 Hickory Ct, Westford'),('Omar Nash', 'omar115@example.com', 'pwdhash115', '555-2000115', '11 Ivy Ln, Rockfield'),
('Paige Holt', 'paige116@example.com', 'pwdhash116', '555-2000116', '33 Hawthorn Ave, Eastgate');
INSERT INTO Users (name, email, password_hash, phone, address) VALUES('Quinn Reid', 'quinn117@example.com', 'pwdhash117', '555-2000117', '90 Alder St, Newridge'),
('Riley Sharp', 'riley118@example.com', 'pwdhash118', '555-2000118', '77 Forest Dr, Timberhill'),('Sasha Cain', 'sasha119@example.com', 'pwdhash119', '555-2000119', '22 Spruce Ln, Brookfield'),
('Troy Neal', 'troy120@example.com', 'pwdhash120', '555-2000120', '66 Ironwood Blvd, Elmstead'),('Uma Doyle', 'uma121@example.com', 'pwdhash121', '555-2000121', '109 Cedar Walk, Sunnybrook'),
('Vince Frye', 'vince122@example.com', 'pwdhash122', '555-2000122', '207 Oak Path, Windale'),('Willa Frank', 'willa123@example.com', 'pwdhash123', '555-2000123', '305 Birchview Dr, Rainwood'),
('Xenia Banks', 'xenia124@example.com', 'pwdhash124', '555-2000124', '408 Pine Bend, Silverbrook'),('Yusuf Hahn', 'yusuf125@example.com', 'pwdhash125', '555-2000125', '512 Maple Row, Cloudhill'),
('Zoey Pratt', 'zoey126@example.com', 'pwdhash126', '555-2000126', '609 Willow Field, Oldridge'),('Adam Cain', 'adam127@example.com', 'pwdhash127', '555-2000127', '99 Beech Rd, Sunfield'),
('Bella Hale', 'bella128@example.com', 'pwdhash128', '555-2000128', '74 Redwood Ct, Shadyside'),('Cory Voss', 'cory129@example.com', 'pwdhash129', '555-2000129', '41 Fir Ln, Brookcrest'),
('Demi Wren', 'demi130@example.com', 'pwdhash130', '555-2000130', '85 Poplar Ridge, Crestwood'),('Zane Bell', 'zane200@example.com', 'pwdhash200', '555-2000200', '120 Ash Ln, Maplecrest');
INSERT INTO Users (name, email, password_hash, phone, address) VALUES
('Amber Clayton', 'amber201@example.com', 'pwdhash201', '555-2010201', '101 Elm St, Rivertown'),('Brian Avery', 'brian202@example.com', 'pwdhash202', '555-2010202', '202 Pine Blvd, Lakeview'),
('Caitlin Doyle', 'caitlin203@example.com', 'pwdhash203', '555-2010203', '303 Oak Dr, Midtown'),('Derek Vance', 'derek204@example.com', 'pwdhash204', '555-2010204', '404 Birch Ln, Forest Hill'),
('Elena Marsh', 'elena205@example.com', 'pwdhash205', '555-2010205', '505 Maple Ave, Brookside'),('Felix Knight', 'felix206@example.com', 'pwdhash206', '555-2010206', '606 Cedar Rd, Highland'),
('Grace Nolan', 'grace207@example.com', 'pwdhash207', '555-2010207', '707 Spruce St, Bayview'),('Hugo Wallace', 'hugo208@example.com', 'pwdhash208', '555-2010208', '808 Willow Ct, Greenfield'),
('Isla York', 'isla209@example.com', 'pwdhash209', '555-2010209', '909 Redwood Way, Hillcrest'),('Jackie Patel', 'jackie210@example.com', 'pwdhash210', '555-2010210', '210 Aspen Loop, Riverdale'),
('Kian Rhodes', 'kian211@example.com', 'pwdhash211', '555-2010211', '311 Dogwood Blvd, Fairview'),('Lily Simmons', 'lily212@example.com', 'pwdhash212', '555-2010212', '412 Poplar Ln, Parkside'),
('Miles Tate', 'miles213@example.com', 'pwdhash213', '555-2010213', '513 Fir St, Grandville'),('Nina Watts', 'nina214@example.com', 'pwdhash214', '555-2010214', '614 Sequoia Ave, Ashport'),
('Oscar Boyd', 'oscar215@example.com', 'pwdhash215', '555-2010215', '715 Chestnut Dr, Brightview'),('Paula Zhang', 'paula216@example.com', 'pwdhash216', '555-2010216', '816 Beech Ct, Lakehaven'),
('Quentin Ray', 'quentin217@example.com', 'pwdhash217', '555-2010217', '917 Alder Ln, Crestwood'),('Riley Blake', 'riley218@example.com', 'pwdhash218', '555-2010218', '218 Larch Blvd, Meadowview'),
('Sophie Lane', 'sophie219@example.com', 'pwdhash219', '555-2010219', '319 Hickory Dr, Riverpark'),('Trent Fox', 'trent220@example.com', 'pwdhash220', '555-2010220', '420 Cypress St, Stonebridge'),
('Uma Palmer', 'uma221@example.com', 'pwdhash221', '555-2010221', '521 Ironwood Way, Eastbay'),('Victor Han', 'victor222@example.com', 'pwdhash222', '555-2010222', '622 Magnolia Loop, Lakeside'),
('Wendy Ng', 'wendy223@example.com', 'pwdhash223', '555-2010223', '723 Sycamore Ave, Newport'),('Xander Cole', 'xander224@example.com', 'pwdhash224', '555-2010224', '824 Laurel Blvd, Maplewood'),
('Yara Singh', 'yara225@example.com', 'pwdhash225', '555-2010225', '925 Juniper Ct, Southwood'),('Zack Moore', 'zack226@example.com', 'pwdhash226', '555-2010226', '1026 Olive Dr, Fairhaven'),
('Alice Kim', 'alice227@example.com', 'pwdhash227', '555-2010227', '1127 Walnut Way, Northbrook'),('Ben Rivera', 'ben228@example.com', 'pwdhash228', '555-2010228', '1228 Hazel Rd, Greenwood'),
('Clara Soto', 'clara229@example.com', 'pwdhash229', '555-2010229', '1329 Palm St, Ridgewood'),('Dev Patel', 'dev230@example.com', 'pwdhash230', '555-2010230', '1430 Elm Cir, Lakeshore'),
('Ella Scott', 'ella231@example.com', 'pwdhash231', '555-2010231', '1531 Pineview Ln, Rivercrest'),('Finn Hayes', 'finn232@example.com', 'pwdhash232', '555-2010232', '1632 Maple Hollow, Ashgrove'),
('Gina Ross', 'gina233@example.com', 'pwdhash233', '555-2010233', '1733 Oakshade Dr, Meadowrun'),('Harvey Lang', 'harvey234@example.com', 'pwdhash234', '555-2010234', '1834 Birchgate St, Hilltown'),
('Ivy Choi', 'ivy235@example.com', 'pwdhash235', '555-2010235', '1935 Cedar Grove, Southend'),('Jake Wu', 'jake236@example.com', 'pwdhash236', '555-2010236', '2036 Sequoia Path, Northlake'),
('Kira Ellis', 'kira237@example.com', 'pwdhash237', '555-2010237', '2137 Redwood Trail, Sunnyside'),('Leo Lin', 'leo238@example.com', 'pwdhash238', '555-2010238', '2238 Poplar Hill, Brambleton'),
('Maya Quinn', 'maya239@example.com', 'pwdhash239', '555-2010239', '2339 Fir Ridge, Willowdale'),('Noah West', 'noah240@example.com', 'pwdhash240', '555-2010240', '2440 Ashbrook Dr, Elmfield'),
('Olive Grey', 'olive241@example.com', 'pwdhash241', '555-2010241', '2541 Pine Hollow, Glenridge'),('Peter Holt', 'peter242@example.com', 'pwdhash242', '555-2010242', '2642 Cedarview Ln, Brookline'),
('Queenie Dale', 'queenie243@example.com', 'pwdhash243', '555-2010243', '2743 Oakdale Ct, Maplehill'),('Ronin Bright', 'ronin244@example.com', 'pwdhash244', '555-2010244', '2844 Birch Crest, Wooddale'),
('Siena Cross', 'siena245@example.com', 'pwdhash245', '555-2010245', '2945 Willow Way, Rockvale'),('Ty Wu', 'ty246@example.com', 'pwdhash246', '555-2010246', '3046 Laurel St, Brightwood'),
('Ursula Kent', 'ursula247@example.com', 'pwdhash247', '555-2010247', '3147 Elmview Rd, Greenridge'),('Vera James', 'vera248@example.com', 'pwdhash248', '555-2010248', '3248 Maple Grove, Springhill'),
('Wes Dunn', 'wes249@example.com', 'pwdhash249', '555-2010249', '3349 Oak Valley, Lakegrove'),('Ximena Flores', 'ximena250@example.com', 'pwdhash250', '555-2010250', '3450 Pine Ridge, Meadowcrest'),
('Yasmin Cruz', 'yasmin251@example.com', 'pwdhash251', '555-2010251', '3551 Birch Meadow, Cresthaven'),('Zane Hooper', 'zane252@example.com', 'pwdhash252', '555-2010252', '3652 Poplar Glen, Timberlake'),
('Ali Mendez', 'ali253@example.com', 'pwdhash253', '555-2010253', '3753 Ash Hollow, Northridge'),('Bea Roy', 'bea254@example.com', 'pwdhash254', '555-2010254', '3854 Cedar Bend, Hillgrove'),
('Carl Liu', 'carl255@example.com', 'pwdhash255', '555-2010255', '3955 Oakwood Ln, Bayfield'),('Dina Ray', 'dina256@example.com', 'pwdhash256', '555-2010256', '4056 Spruceview Dr, Lakeshore'),
('Eli Chan', 'eli257@example.com', 'pwdhash257', '555-2010257', '4157 Beech Grove, Silverlake'),('Fay Hines', 'fay258@example.com', 'pwdhash258', '555-2010258', '4258 Hickory Ct, Sunridge'),
('Gabe Shore', 'gabe259@example.com', 'pwdhash259', '555-2010259', '4359 Juniper Ave, Greenwood'),('Hana Park', 'hana260@example.com', 'pwdhash260', '555-2010260', '4460 Sycamore Way, Mistyvale'),
('Ian Zade', 'ian261@example.com', 'pwdhash261', '555-2010261', '4561 Pinecone Ln, Shadowbrook'),('Jill Roman', 'jill262@example.com', 'pwdhash262', '555-2010262', '4662 Laurel Meadow, Oakdale'),
('Kylee Nash', 'kylee263@example.com', 'pwdhash263', '555-2010263', '4763 Chestnut Hill, Forestview'),('Louis Wynn', 'louis264@example.com', 'pwdhash264', '555-2010264', '4864 Ironwood Grove, Rainford'),
('Mila Rios', 'mila265@example.com', 'pwdhash265', '555-2010265', '4965 Alder Hollow, Glenwood'),('Nico Lane', 'nico266@example.com', 'pwdhash266', '555-2010266', '5066 Ash Glen, Brookview'),
('Ola Zhang', 'ola267@example.com', 'pwdhash267', '555-2010267', '5167 Willowbank, Greystone'),('Penny Drew', 'penny268@example.com', 'pwdhash268', '555-2010268', '5268 Cypress Field, Clearbrook'),
('Quinn Lee', 'quinn269@example.com', 'pwdhash269', '555-2010269', '5369 Dogwood Ridge, Pinecrest'),('Rey Torres', 'rey270@example.com', 'pwdhash270', '555-2010270', '5470 Redwood Summit, Oakridge'),
('Suki Zhao', 'suki271@example.com', 'pwdhash271', '555-2010271', '5571 Fir Crest, Riverbend'),('Tina Moore', 'tina272@example.com', 'pwdhash272', '555-2010272', '5672 Beech Hollow, Springgrove'),
('Uri Vega', 'uri273@example.com', 'pwdhash273', '555-2010273', '5773 Maple Knoll, Brighthaven'),('Vicky Lin', 'vicky274@example.com', 'pwdhash274', '555-2010274', '5874 Oak Spring, Highland Park'),
('Walt Green', 'walt275@example.com', 'pwdhash275', '555-2010275', '5975 Sequoia Hill, Northshore'),('Xia Bell', 'xia276@example.com', 'pwdhash276', '555-2010276', '6076 Cedar Rise, Meadowhill'),
('Yuki Burns', 'yuki277@example.com', 'pwdhash277', '555-2010277', '6177 Spruce Lane, Windgate'),('Zia Rhodes', 'zia278@example.com', 'pwdhash278', '555-2010278', '6278 Hickory Path, Willowbrook'),
('Axel Kim', 'axel279@example.com', 'pwdhash279', '555-2010279', '6379 Maple Loop, Timberfield'),('Bella Hunt', 'bella280@example.com', 'pwdhash280', '555-2010280', '6480 Oak Trail, Sunnyhill');


INSERT INTO Categories (category_name) VALUES
('Electronics'),('Mobile Phones'),('Laptops & Computers'),('Home Appliances'),('Fashion - Men'),('Fashion - Women'),('Fashion - Kids'),('Footwear'),('Watches'),('Beauty & Personal Care'),
('Health & Wellness'),('Books'),('Stationery & Office Supplies'),('Furniture'),('Home Decor'),('Kitchenware'),('Groceries'),('Baby Products'),('Toys & Games'),('Pet Supplies'),
('Sports & Fitness'),('Automotive Accessories'),('Musical Instruments'),('Cameras & Photography'),('Garden & Outdoor'),('Bags & Luggage'),('Smart Home Devices'),('Gaming Consoles & Accessories'),
('Jewelry'),('Software & Subscriptions');

select * from categories;

INSERT INTO Products (product_name, description, price, stock, category_id) VALUES
('Samsung 55" 4K Smart TV', 'Ultra HD Smart LED TV with built-in apps and voice control.', 599.99, 50, 1),('iPhone 14 Pro', 'Apple iPhone 14 Pro with 128GB storage, A16 Bionic chip.', 999.00, 30, 2),
('Dell XPS 13 Laptop', '13.4" UHD touchscreen laptop with Intel i7, 16GB RAM, 512GB SSD.', 1249.99, 25, 3),('LG Front Load Washing Machine', '6.5 kg Inverter Fully-Automatic Front Load Washer.', 499.99, 20, 4),
('Men\'s Leather Jacket', 'Genuine leather jacket with zipper and side pockets.', 139.99, 100, 5),('Women\'s Maxi Dress', 'Floral printed chiffon maxi dress with waist belt.', 59.99, 120, 6),
('Kids Cotton Hoodie', 'Warm fleece-lined hoodie for kids ages 4-12.', 24.99, 80, 7),('Nike Running Shoes', 'Lightweight, breathable shoes with high-grip soles.', 89.99, 60, 8),
('Casio Digital Watch', 'Water-resistant digital sports watch with alarm.', 49.99, 70, 9),('L’Oreal Moisturizer', 'Hydrating cream for dry and sensitive skin.', 12.99, 150, 10),
('Vitamin D3 Tablets', 'Immune-support supplement with 1000 IU Vitamin D3.', 8.99, 200, 11),('The Great Gatsby', 'Classic novel by F. Scott Fitzgerald, paperback edition.', 6.49, 90, 12),
('Stapler with Pins', 'Heavy-duty stapler with 1000 staples included.', 9.99, 40, 13),('Ergonomic Office Chair', 'Adjustable mesh chair with lumbar support.', 189.99, 35, 14),
('Wooden Wall Clock', 'Vintage-style clock with Roman numerals.', 29.99, 45, 15),('Non-stick Frying Pan Set', '3-piece cookware with heat-resistant handles.', 39.99, 60, 16),
('Organic Basmati Rice 5kg', 'Premium long grain rice from India.', 14.49, 100, 17),('Huggies Diapers - Size M', 'Pack of 64 ultra-soft diapers for babies.', 22.99, 120, 18),
('Remote Control Car', 'Rechargeable RC sports car with LED lights.', 34.99, 85, 19),('Dog Food - Chicken Flavor 3kg', 'Nutritious dry food for adult dogs.', 18.99, 75, 20),
('Yoga Mat - 6mm Thick', 'Non-slip mat for yoga and exercise.', 21.99, 90, 21),('Car Mobile Holder', '360-degree rotating mount for dashboard.', 11.99, 100, 22),
('Acoustic Guitar', '6-string wooden guitar with bag and tuner.', 109.99, 20, 23),('Canon EOS M50 Camera', '24MP mirrorless camera with 15-45mm lens.', 579.00, 15, 24),
('Patio Chair Set', 'Set of 2 outdoor chairs with cushions.', 129.99, 25, 25),('Travel Backpack 40L', 'Water-resistant hiking and travel bag.', 44.99, 50, 26),
('Amazon Echo Dot (5th Gen)', 'Smart speaker with Alexa voice assistant.', 49.99, 60, 27),('PS5 Wireless Controller', 'DualSense controller for PlayStation 5.', 69.99, 45, 28),
('Gold Plated Pendant Necklace', 'Elegant necklace with cubic zirconia stone.', 29.99, 70, 29),('Microsoft Office 365 Personal', '1-year subscription with Word, Excel, and more.', 69.99, 200, 30);

select * from products;

INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES
(1, '2024-12-01 10:15:00', 'pending', 89.99),(2, '2024-12-02 13:45:00', 'shipped', 45.50),(3, '2024-12-03 08:25:00', 'delivered', 129.00),(4, '2024-12-04 17:20:00', 'cancelled', 22.75),
(5, '2024-12-05 09:10:00', 'pending', 199.99),(6, '2024-12-06 14:30:00', 'shipped', 75.00),(7, '2024-12-07 16:55:00', 'delivered', 59.95),(8, '2024-12-08 12:40:00', 'pending', 18.20),
(9, '2024-12-09 11:15:00', 'cancelled', 34.00),(10, '2024-12-10 10:10:00', 'delivered', 92.49),(11, '2024-12-11 13:05:00', 'shipped', 103.20),(12, '2024-12-12 08:45:00', 'pending', 88.99),(13, '2024-12-13 15:30:00', 'cancelled', 49.90),(14, '2024-12-14 11:25:00', 'delivered', 27.99),
(15, '2024-12-15 14:40:00', 'pending', 210.00),(16, '2024-12-16 17:35:00', 'shipped', 64.30),(17, '2024-12-17 16:50:00', 'pending', 71.15),(18, '2024-12-18 10:30:00', 'cancelled', 15.25),
(19, '2024-12-19 09:20:00', 'delivered', 122.10),(20, '2024-12-20 08:00:00', 'pending', 53.40),(21, '2024-12-21 13:10:00', 'shipped', 99.99),(22, '2024-12-22 15:45:00', 'cancelled', 24.75),
(23, '2024-12-23 12:30:00', 'pending', 85.65),(24, '2024-12-24 17:20:00', 'delivered', 149.99),(25, '2024-12-25 11:15:00', 'shipped', 77.80),(26, '2024-12-26 14:00:00', 'pending', 37.45),
(27, '2024-12-27 16:25:00', 'cancelled', 19.99),(28, '2024-12-28 10:50:00', 'delivered', 189.95),(29, '2024-12-29 09:30:00', 'pending', 60.00),(30, '2024-12-30 12:40:00', 'shipped', 115.25),
(31, '2025-01-01 14:10:00', 'delivered', 130.75),(32, '2025-01-02 16:55:00', 'pending', 98.45),(33, '2025-01-03 10:00:00', 'cancelled', 42.00),(34, '2025-01-04 13:35:00', 'shipped', 56.80),
(35, '2025-01-05 08:20:00', 'pending', 39.90),(36, '2025-01-06 11:10:00', 'delivered', 104.99),(37, '2025-01-07 15:00:00', 'pending', 82.50),(38, '2025-01-08 10:45:00', 'cancelled', 25.70),
(39, '2025-01-09 12:20:00', 'shipped', 199.00),(40, '2025-01-10 09:10:00', 'delivered', 78.60),(41, '2025-01-11 14:30:00', 'pending', 65.25),(42, '2025-01-12 16:15:00', 'shipped', 58.40),
(43, '2025-01-13 10:30:00', 'pending', 47.35),(44, '2025-01-14 13:00:00', 'delivered', 120.99),(45, '2025-01-15 11:45:00', 'cancelled', 33.00),(46, '2025-01-16 08:30:00', 'shipped', 140.00),
(47, '2025-01-17 14:20:00', 'pending', 66.75),(48, '2025-01-18 09:50:00', 'delivered', 88.10),(49, '2025-01-19 12:25:00', 'cancelled', 21.99),(50, '2025-01-20 16:35:00', 'shipped', 90.30),
(51, '2025-01-21 08:10:00', 'pending', 105.55),(52, '2025-01-22 14:50:00', 'delivered', 63.00),(53, '2025-01-23 11:30:00', 'pending', 70.45),(54, '2025-01-24 09:40:00', 'shipped', 155.25),
(55, '2025-01-25 13:15:00', 'delivered', 99.90),(56, '2025-01-26 10:20:00', 'pending', 45.75),(57, '2025-01-27 12:00:00', 'cancelled', 18.80),(58, '2025-01-28 14:25:00', 'shipped', 87.20),
(59, '2025-01-29 16:10:00', 'delivered', 110.00),(60, '2025-01-30 08:50:00', 'pending', 95.99),(61, '2025-01-31 09:30:00', 'shipped', 134.40),(62, '2025-02-01 11:15:00', 'delivered', 124.80),
(63, '2025-02-02 13:40:00', 'cancelled', 29.00),(64, '2025-02-03 10:45:00', 'pending', 65.25),(65, '2025-02-04 12:30:00', 'shipped', 48.99),(66, '2025-02-05 15:00:00', 'delivered', 113.00),
(67, '2025-02-06 09:20:00', 'cancelled', 22.50),(68, '2025-02-07 14:40:00', 'pending', 72.30),(69, '2025-02-08 11:00:00', 'shipped', 158.99),(70, '2025-02-09 10:30:00', 'delivered', 93.45),
(71, '2025-02-10 13:10:00', 'pending', 100.50),(72, '2025-02-11 15:35:00', 'shipped', 55.60),(73, '2025-02-12 09:10:00', 'cancelled', 38.45),(74, '2025-02-13 11:45:00', 'delivered', 145.25),
(75, '2025-02-14 13:20:00', 'pending', 63.20),(76, '2025-02-15 10:55:00', 'shipped', 89.99),(77, '2025-02-16 14:10:00', 'delivered', 138.70),(78, '2025-02-17 08:35:00', 'pending', 49.99),
(79, '2025-02-18 12:50:00', 'shipped', 60.00),(80, '2025-02-19 16:15:00', 'delivered', 75.00);
 
select * from orders;

INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (154, '2024-05-18 13:49:47', 'cancelled', 26.56);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (139, '2024-04-09 13:49:47', 'delivered', 934.56);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (119, '2024-05-09 13:49:47', 'pending', 39.34);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (42, '2024-05-25 13:49:47', 'pending', 838.47);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (151, '2024-10-09 13:49:47', 'pending', 66.18);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (107, '2025-02-25 13:49:47', 'shipped', 560.90);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (8, '2024-12-11 13:49:47', 'pending', 506.73);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (44, '2024-05-18 13:49:47', 'delivered', 171.11);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (64, '2025-02-08 13:49:47', 'delivered', 632.51);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (145, '2025-03-17 13:49:47', 'pending', 301.43);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (114, '2024-05-04 13:51:03', 'shipped', 839.57);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (138, '2024-05-17 13:51:03', 'shipped', 813.49);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (52, '2024-12-12 13:51:03', 'cancelled', 790.09);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (140, '2025-02-02 13:51:03', 'pending', 307.30);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (147, '2025-02-28 13:51:03', 'cancelled', 296.71);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (49, '2024-05-11 13:51:03', 'shipped', 231.42);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (129, '2024-05-27 13:51:03', 'cancelled', 483.67);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (85, '2024-07-24 13:51:03', 'cancelled', 432.65);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (95, '2024-09-13 13:51:03', 'shipped', 182.95);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (132, '2025-03-09 13:51:03', 'shipped', 171.33);

INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (100, '2024-07-18 12:49:47', 'cancelled', 116.56);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (109, '2024-06-109 09:49:47', 'delivered', 950.56);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (129, '2024-08-09 11:49:47', 'delivered', 549.34);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (42, '2024-05-25 13:49:47', 'pending', 838.47);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (151, '2024-10-09 13:49:47', 'pending', 66.18);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (107, '2025-02-25 13:49:47', 'shipped', 560.90);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (8, '2024-12-11 13:49:47', 'pending', 506.73);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (44, '2024-05-18 13:49:47', 'delivered', 171.11);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (64, '2025-02-08 13:49:47', 'delivered', 632.51);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (145, '2025-03-17 13:49:47', 'pending', 301.43);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (114, '2024-05-04 13:51:03', 'shipped', 839.57);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (138, '2024-05-17 13:51:03', 'shipped', 813.49);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (102, '2024-12-12 11:51:03', 'cancelled', 990.09);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (101,'2024-10-07 10:51:03', 'pending', 549.30);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (97, '2025-12-28 09:51:03', 'shipped', 998.71);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (99, '2024-05-17 13:51:03', 'cancelled', 483.67);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (85, '2024-07-24 13:51:03', 'pending', 432.65);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (95, '2024-09-03 16:51:03', 'shipped', 782.95);
INSERT INTO Orders (user_id, order_date, status, total_amount) VALUES (132, '2025-03-28 15:51:03', 'shipped', 671.33);


INSERT INTO OrderItems (order_id, product_id, quantity, price) VALUES
(1, 5, 2, 139.99),(1, 10, 1, 12.99),(2, 15, 3, 29.99),(3, 20, 1, 18.99),(4, 25, 2, 129.99),(5, 30, 1, 69.99),(6, 29, 2, 29.99),(7, 28, 4, 69.99),(8, 1, 1, 599.99),(9, 7, 2, 24.99);
INSERT INTO OrderItems (order_id, product_id, quantity, price) VALUES(10, 5, 1, 139.99),(11, 10, 100, 2.99),(12, 11, 20, 8.99),(13, 2, 1, 999.00),(14, 6, 2, 59.99),(15, 4, 3, 499.99),(16, 3, 1, 1249.99),(17, 8, 2, 89.99),(18, 9, 2, 49.99),
(19, 29, 1, 29.99),(20, 1, 1, 599.99),(21, 6, 2, 59.49),(22, 11, 2, 8.99),(23, 16, 3, 39.99),(24, 21, 4, 21.99),(25, 26, 1, 44.99),(26, 10, 1, 12.99),(27, 3, 3, 1249.99),
(28, 27, 1, 49.99),(29, 15, 2, 29.99),(30, 14, 1, 189.99),(31, 13, 10, 9.99),(32, 21, 2, 21.99),(33, 22, 3, 11.99),(34, 27, 5, 49.99),(35, 1, 2, 599.99),(36, 2, 1, 999.00),
(37, 7, 3, 14.99),(38, 12, 2, 34.99),(39, 17, 1, 39.99),(40, 22, 1, 18.99);
INSERT INTO OrderItems (order_id, product_id, quantity, price) VALUES(41, 27, 2, 29.99),(42, 22, 2, 11.99),(43, 27, 3, 49.99),(44, 28, 3, 69.99),(45, 29, 2, 29.99),
(46, 18, 3, 22.99),(47, 17, 2, 14.49),(48, 19, 2, 34.99),(49, 20, 3, 18.99),(50, 7, 2, 24.99),(51, 5, 3, 139.99),(52, 4, 1, 499.99),(53, 8, 5, 89.99),(54, 3, 1, 1249.99),(55, 8, 1, 89.99),
(56, 13, 2, 9.99),(57, 18, 1, 22.99),(58, 23, 3, 109.99),(59, 28, 1, 69.99),(60, 22, 1, 11.99),(61, 30, 2, 69.99),(62, 23, 1, 109.99),(63, 10, 2, 12.99),(64, 11, 3, 8.99),
(65, 8, 10, 89.99),(66, 16, 5, 39.99),(67, 19, 15, 34.99),(68, 11, 20, 8.99),(69, 18, 100, 22.99),(70, 17, 40, 14.99),(71, 8, 2, 89.99),(72, 3, 1, 1249.99),(73, 2, 3, 999.00),
(74, 4, 2, 499.99),(75, 9, 2, 49.99),(76, 14, 1, 189.99),(77, 19, 2, 34.99),(78, 24, 3, 579.00),(79, 29, 10, 29.99),(80, 14, 2, 189.99),(81, 19, 3, 34.99),(82, 18, 2,22.99),
(83, 9, 2, 49.99),(84, 4, 2, 499.99),(85, 12, 1, 6.49),(86, 27, 2, 49.99),(87, 28, 8, 69.99),(88, 29, 5, 29.99),(89, 30, 1, 69.99),(90, 11, 10, 8.99),(91, 12, 6, 6.49),
(92, 4, 2, 499.99),(93, 5, 3, 139.99),(94, 6, 10, 59.99),(95, 16, 15, 39.99),(96, 26, 2, 44.99),(97, 23, 2, 109.99),(98, 24, 1, 579.00),(99, 25, 5, 129.99);

select * from orderitems;

INSERT INTO Payments (order_id, payment_date, payment_method, amount) VALUES(1, '2024-12-01 11:00:00', 'credit_card', 89.99),(2, '2024-12-02 14:00:00', 'paypal', 45.50),
(3, '2024-12-03 09:00:00', 'net_banking', 129.00),(4, '2024-12-04 18:00:00', 'debit_card', 22.75),(5, '2024-12-05 10:30:00', 'credit_card', 199.99),
(6, '2024-12-06 15:30:00', 'debit_card', 75.00),(7, '2024-12-07 17:00:00', 'paypal', 59.95),(8, '2024-12-08 13:15:00', 'credit_card', 18.20),
(9, '2024-12-09 12:00:00', 'net_banking', 34.00),(10, '2024-12-10 11:30:00', 'paypal', 92.49),(11, '2024-12-11 14:00:00', 'credit_card', 103.20),
(12, '2024-12-12 09:45:00', 'net_banking', 88.99),(13, '2024-12-13 16:00:00', 'debit_card', 49.90),(14, '2024-12-14 12:00:00', 'paypal', 27.99),
(15, '2024-12-15 15:15:00', 'credit_card', 210.00),(16, '2024-12-16 18:00:00', 'paypal', 64.30),(17, '2024-12-17 17:30:00', 'net_banking', 71.15),
(18, '2024-12-18 11:00:00', 'debit_card', 15.25),(19, '2024-12-19 10:00:00', 'credit_card', 122.10),(20, '2024-12-20 09:00:00', 'net_banking', 53.40),
(21, '2024-12-21 14:15:00', 'paypal', 99.99),(22, '2024-12-22 16:00:00', 'paypal', 24.75),(23, '2024-12-23 13:00:00', 'credit_card', 85.65),
(24, '2024-12-24 18:00:00', 'debit_card', 149.99),(25, '2024-12-25 12:00:00', 'credit_card', 77.80),(26, '2024-12-26 14:30:00', 'paypal', 37.45),
(27, '2024-12-27 16:45:00', 'net_banking', 19.99),(28, '2024-12-28 11:00:00', 'paypal', 189.95),(29, '2024-12-29 10:30:00', 'debit_card', 60.00),
(30, '2024-12-30 13:00:00', 'credit_card', 115.25),(31, '2025-01-01 15:30:00', 'paypal', 130.75),(32, '2025-01-02 17:00:00', 'debit_card', 98.45),
(33, '2025-01-03 11:00:00', 'net_banking', 42.00),(34, '2025-01-04 14:45:00', 'paypal', 56.80),(35, '2025-01-05 09:30:00', 'credit_card', 39.90),
(36, '2025-01-06 12:15:00', 'net_banking', 104.99),(37, '2025-01-07 16:00:00', 'paypal', 82.50),(38, '2025-01-08 11:15:00', 'debit_card', 25.70),
(39, '2025-01-09 13:00:00', 'credit_card', 199.00),(40, '2025-01-10 10:00:00', 'paypal', 78.60),(41, '2025-01-11 15:00:00', 'paypal', 65.25),
(42, '2025-01-12 17:30:00', 'debit_card', 58.40),(43, '2025-01-13 11:00:00', 'credit_card', 47.35),(44, '2025-01-14 14:00:00', 'paypal', 120.99),
(45, '2025-01-15 12:30:00', 'credit_card', 33.00),(46, '2025-01-16 09:00:00', 'paypal', 140.00),(47, '2025-01-17 15:30:00', 'debit_card', 66.75),
(48, '2025-01-18 10:00:00', 'paypal', 88.10),(49, '2025-01-19 13:15:00', 'credit_card', 21.99),(50, '2025-01-20 17:00:00', 'paypal', 90.30),
(51, '2025-01-21 09:30:00', 'debit_card', 105.55),(52, '2025-01-22 15:00:00', 'credit_card', 63.00),(53, '2025-01-23 12:00:00', 'paypal', 70.45),
(54, '2025-01-24 10:30:00', 'credit_card', 155.25),(55, '2025-01-25 14:00:00', 'net_banking', 99.90),(56, '2025-01-26 11:30:00', 'paypal', 45.75),
(57, '2025-01-27 13:00:00', 'paypal', 18.80),(58, '2025-01-28 15:15:00', 'credit_card', 87.20),(59, '2025-01-29 17:00:00', 'paypal', 110.00),
(60, '2025-01-30 09:30:00', 'debit_card', 95.99),(61, '2025-01-31 10:00:00', 'paypal', 134.40),(62, '2025-02-01 12:30:00', 'credit_card', 124.80),
(63, '2025-02-02 14:00:00', 'debit_card', 29.00),(64, '2025-02-03 11:00:00', 'paypal', 65.25),(65, '2025-02-04 13:30:00', 'net_banking', 48.99),
(66, '2025-02-05 16:00:00', 'credit_card', 113.00),(67, '2025-02-06 10:15:00', 'paypal', 22.50),(68, '2025-02-07 15:45:00', 'paypal', 72.30),
(69, '2025-02-08 12:15:00', 'credit_card', 158.99),(70, '2025-02-09 11:30:00', 'paypal', 93.45),(71, '2025-02-10 14:30:00', 'debit_card', 100.50),
(72, '2025-02-11 17:30:00', 'paypal', 55.60),(73, '2025-02-12 10:00:00', 'credit_card', 38.45),(74, '2025-02-13 12:30:00', 'paypal', 145.25),
(75, '2025-02-14 14:00:00', 'debit_card', 63.20),(76, '2025-02-15 11:00:00', 'credit_card', 89.99),(77, '2025-02-16 15:15:00', 'paypal', 138.70),
(78, '2025-02-17 09:00:00', 'net_banking', 49.99),(79, '2025-02-18 13:45:00', 'paypal', 60.00),(80, '2025-02-19 16:00:00', 'credit_card', 75.00),
(81, '2025-02-20 11:45:00', 'paypal', 39.50),(82, '2025-02-21 10:00:00', 'paypal', 99.90),(83, '2025-02-22 13:30:00', 'net_banking', 27.00),
(84, '2025-02-23 15:00:00', 'credit_card', 110.00),(85, '2025-02-24 12:00:00', 'paypal', 94.00),(86, '2025-02-25 10:45:00', 'credit_card', 18.99),
(87, '2025-02-26 14:15:00', 'net_banking', 34.00),(88, '2025-02-27 16:30:00', 'debit_card', 76.25),(89, '2025-02-28 09:30:00', 'paypal', 121.00),
(90, '2025-03-01 13:15:00', 'paypal', 55.00),(91, '2025-03-02 11:00:00', 'credit_card', 40.00),(92, '2025-03-03 14:00:00', 'paypal', 67.99),
(93, '2025-03-04 15:30:00', 'net_banking', 115.00),(94, '2025-03-05 10:15:00', 'paypal', 125.00),(95, '2025-03-06 12:45:00', 'credit_card', 93.00),
(96, '2025-03-07 16:00:00', 'debit_card', 72.00),(97, '2025-03-08 11:30:00', 'paypal', 29.50),(98, '2025-03-09 13:00:00', 'net_banking', 44.00),
(99, '2025-03-10 09:45:00', 'credit_card', 84.00);

select * from payments;


select * from reviews;
INSERT INTO Reviews (user_id, product_id, rating, comment, review_date) VALUES
(1, 5, 5, 'Excellent product, highly recommend!', '2025-01-01 10:00:00'),(2, 15, 4, 'Very good, met my expectations.', '2025-01-02 11:15:00'),
(3, 20, 3, 'It’s okay, not great but not bad.', '2025-01-03 12:00:00'),(4, 25, 5, 'Loved it! Will buy again.', '2025-01-04 09:45:00'),
(5, 30, 1, 'Terrible quality, very disappointed.', '2025-01-05 14:30:00'),(6, 29, 4, 'Good value for money.', '2025-01-06 16:00:00'),
(7, 28, 2, 'Didn’t work as expected.', '2025-01-07 17:00:00'),(8, 1, 5, 'Top-notch product. Worth every penny.', '2025-01-08 10:20:00'),
(9, 7, 3, 'Average experience overall.', '2025-01-09 13:10:00'),(10, 5, 4, 'Works well, satisfied with the purchase.', '2025-01-10 15:00:00');
INSERT INTO Reviews (user_id, product_id, rating, comment, review_date) VALUES(11, 10, 2, 'Could be better.', '2025-01-11 09:00:00'),(12, 11, 5, 'Exactly what I needed!', '2025-01-12 11:40:00'),
(13, 2, 4, 'Good quality.', '2025-01-13 13:30:00'),(14, 6, 5, 'Fantastic item!', '2025-01-14 08:45:00'),
(15, 4, 3, 'Not bad.', '2025-01-15 12:00:00'),(16, 29, 4, 'Nice design and functionality.', '2025-01-16 16:20:00'),
(17, 11, 2, 'Had some issues.', '2025-01-17 09:30:00'),(18, 17, 1, 'Really poor quality.', '2025-01-18 14:00:00'),
(19, 29, 5, 'Superb! Would definitely recommend.', '2025-01-19 10:30:00'),(20, 1, 3, 'Just okay.', '2025-01-20 15:30:00');
INSERT INTO Reviews (user_id, product_id, rating, comment, review_date) VALUES(21, 6, 5, 'Incredible! Totally worth it.', '2025-01-21 13:10:00'),(22, 11, 4, 'Met all my expectations.', '2025-01-22 11:20:00'),
(23, 16, 3, 'So-so experience.', '2025-01-23 14:50:00'),(24, 21, 2, 'Did not last long.', '2025-01-24 10:40:00'),
(25, 26, 4, 'Pretty solid item.', '2025-01-25 17:15:00'),(26, 10, 5, 'Just what I was looking for!', '2025-01-26 12:45:00'),
(27, 3, 1, 'Regret buying this.', '2025-01-27 09:15:00'),(28, 27, 5, 'Perfect in every way.', '2025-01-28 10:00:00'),
(29, 15, 4, 'Quality matches the price.', '2025-01-29 14:30:00'),(30, 14, 3, 'Decent enough.', '2025-01-30 13:00:00'),
(31, 13, 2, 'Not great, not terrible.', '2025-01-31 16:10:00'),(32, 21, 5, 'Amazing product!', '2025-02-01 09:00:00'),
(33, 22, 4, 'Very useful.', '2025-02-02 12:30:00'),(34, 27, 3, 'Meh.', '2025-02-03 10:10:00'),
(35, 1, 1, 'Completely broke after first use.', '2025-02-04 14:20:00'),(36, 2, 5, 'Fantastic!', '2025-02-05 15:30:00'),
(37, 7, 2, 'Quality not as expected.', '2025-02-06 13:30:00'),(38, 12, 4, 'Solid product.', '2025-02-07 16:45:00'),
(39, 17, 5, 'Superb build.', '2025-02-08 11:00:00'),(40, 22, 3, 'Satisfactory.', '2025-02-09 10:10:00'),
(41, 27, 2, 'Disappointed.', '2025-02-10 12:15:00'),(42, 22, 4, 'Nice experience.', '2025-02-11 14:00:00'),
(43, 27, 5, 'Exactly as described.', '2025-02-12 17:30:00'),(44, 28, 3, 'Neutral.', '2025-02-13 10:30:00'),
(45, 29, 1, 'Worst product I ever bought.', '2025-02-14 13:40:00'),(46, 18, 5, 'Five stars!', '2025-02-15 09:00:00'),
(47, 17, 4, 'Pleased with the product.', '2025-02-16 12:30:00'),(48, 19, 2, 'Subpar.', '2025-02-17 15:45:00'),
(49, 20, 3, 'Fine overall.', '2025-02-18 11:20:00'),(50, 7, 5, 'Incredible quality!', '2025-02-19 16:10:00'),
(51, 5, 4, 'Quite handy and reliable.', '2025-02-20 10:10:00'),(52, 4, 5, 'Love this!', '2025-02-21 11:50:00'),
(53, 8, 3, 'Meets the basic requirements.', '2025-02-22 14:30:00'),(54, 3, 1, 'Terrible item.', '2025-02-23 09:00:00'),
(55, 8, 5, 'Highly recommended.', '2025-02-24 13:10:00'),(56, 13, 2, 'Not happy with it.', '2025-02-25 10:40:00'),
(57, 18, 4, 'It’s good!', '2025-02-26 14:00:00'),(58, 23, 3, 'Just average.', '2025-02-27 15:30:00'),
(59, 28, 5, 'Super quality!', '2025-02-28 11:15:00'),(60, 22, 4, 'Does the job well.', '2025-03-01 10:00:00'),
(61, 30, 2, 'Not durable.', '2025-03-02 13:25:00'),(62, 23, 3, 'Usable.', '2025-03-03 15:00:00'),
(63, 10, 4, 'Reliable product.', '2025-03-04 12:00:00'),(64, 11, 1, 'Waste of money.', '2025-03-05 09:30:00'),
(65, 8, 5, 'Exactly what I needed.', '2025-03-06 14:45:00'),(66, 4, 4, 'Really good experience.', '2025-03-07 13:10:00'),
(67, 19, 2, 'Unsatisfactory.', '2025-03-08 10:00:00'),(68, 11, 3, 'Basic performance.', '2025-03-09 11:30:00'),
(69, 18, 4, 'Nice purchase.', '2025-03-10 12:40:00'),(70, 17, 5, 'Perfectly crafted.', '2025-03-11 16:00:00'),
(71, 8, 3, 'Not too bad.', '2025-03-12 09:10:00'),(72, 3, 2, 'So many flaws.', '2025-03-13 14:00:00'),
(73, 2, 4, 'Pretty good.', '2025-03-14 10:45:00'),(74, 4, 5, 'Love it so much!', '2025-03-15 11:20:00'),
(75, 9, 3, 'Functional but plain.', '2025-03-16 12:10:00'),(76, 14, 1, 'Do not buy this.', '2025-03-17 15:15:00'),
(77, 19, 5, 'Top-tier!', '2025-03-18 10:00:00'),(78, 24, 4, 'Impressive product.', '2025-03-19 13:30:00'),
(79, 29, 3, 'Satisfactory.', '2025-03-20 11:40:00'),(80, 14, 2, 'Could be improved.', '2025-03-21 10:30:00'),
(81, 19, 5, 'Best purchase I’ve made this year.', '2025-03-22 14:15:00'),(82, 18, 4, 'Does what it says.', '2025-03-23 12:20:00'),
(83, 9, 3, 'Not great.', '2025-03-24 09:45:00'),(84, 4, 2, 'Quality is lacking.', '2025-03-25 13:10:00'),
(85, 12, 5, 'Super functional.', '2025-03-26 14:00:00'),(86, 27, 4, 'A dependable product.', '2025-03-27 11:00:00'),
(87,28 , 3, 'Nothing special.', '2025-03-28 09:20:00'),(88, 29, 1, 'Very bad experience.', '2025-03-29 10:00:00'),
(89, 1, 5, 'Amazing overall.', '2025-03-30 15:30:00'),(90, 11, 4, 'Met expectations.', '2025-03-31 10:00:00'),
(91,12 , 2, 'So-so product.', '2025-04-01 11:45:00'),(92,4 , 3, 'Basic quality.', '2025-04-02 12:10:00'),
(93,5 , 5, 'Fantastic!', '2025-04-03 14:25:00'),(94, 6, 4, 'Well made.', '2025-04-04 13:00:00'),
(95, 16, 3, 'Just fine.', '2025-04-05 09:30:00'),(96, 26, 2, 'Could use improvements.', '2025-04-06 10:15:00'),
(97, 23, 5, 'Perfect buy.', '2025-04-07 11:00:00'),(98, 24, 1, 'Worst ever.', '2025-04-08 12:20:00'),
(99, 25, 4, 'Recommended.', '2025-04-09 13:10:00');


-- List all products with their category name.

SELECT p.product_id, p.product_name, c.category_name, p.price, p.stock
FROM Products p
JOIN Categories c ON p.category_id = c.category_id;


-- Get user details with total number of orders.

SELECT u.user_id, u.name, u.email, COUNT(o.order_id) AS total_orders
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.name, u.email;


-- Get details of a specific order

SELECT o.order_id, u.name AS customer_name, o.order_date, o.status, o.total_amount
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
WHERE o.order_id = 80;  

-- Get all items in an order

SELECT oi.order_item_id, p.product_name, oi.quantity, oi.price
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
WHERE oi.order_id = 50; 

-- Get all payments with order and user info

SELECT pay.payment_id, u.name AS customer_name, o.order_id, pay.payment_method, pay.amount, pay.payment_date
FROM Payments pay
JOIN Orders o ON pay.order_id = o.order_id
JOIN Users u ON o.user_id = u.user_id;

-- Total sales by category

SELECT c.category_name, SUM(oi.price * oi.quantity) AS total_sales
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_sales DESC;


--  Average rating of each product

SELECT p.product_name, ROUND(AVG(r.rating), 2) AS avg_rating, COUNT(r.review_id) AS total_reviews
FROM Reviews r
JOIN Products p ON r.product_id = p.product_id
GROUP BY p.product_name
ORDER BY avg_rating DESC;


-- Top 5 selling products

SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;

SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- Find users who haven't placed any orders

SELECT u.user_id, u.name, u.email
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.user_id
WHERE o.order_id IS NULL;


-- Daily sales summary

SELECT DATE(o.order_date) AS order_day, COUNT(o.order_id) AS total_orders, SUM(o.total_amount) AS total_sales
FROM Orders o
GROUP BY order_day
ORDER BY order_day DESC;

select * from products where product_id = 15;


SELECT product_name, COUNT(DISTINCT product_id) AS total_buyers
FROM products
GROUP BY product_name
HAVING COUNT(DISTINCT product_id) > 1;

SELECT product_name, user_id
FROM users
JOIN products pr ON product_id = user_id
ORDER BY product_name, user_id;
