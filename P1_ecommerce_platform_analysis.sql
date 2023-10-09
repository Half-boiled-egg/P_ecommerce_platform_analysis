# 1.Create new schema as ecommerce.
CREATE SCHEMA ecommerce;
USE ecommerce;
SELECT 
    *
FROM
    users_data;
# 2.Import .csv file users_data into MySQL.
SELECT 
    COUNT(*)
FROM
    users_data;
# 3.Run SQL command to see the structure of table
DESC users_data;
# 4.Run SQL command to select first 100 rows of the database.
SELECT 
    *
FROM
    users_data
LIMIT 100;
# 5.How many distinct values exist in table for field country and language.
SELECT 
    COUNT(DISTINCT country) num_of_country,
    COUNT(DISTINCT language) AS num_of_language
FROM
    users_data;
# 6.Check whether male users are having maximum followers or female users.
SELECT 
    SUM(socialNbFollowers) AS num_of_followers_for_f
FROM
    users_data
WHERE
    gender = 'F';
SELECT 
    SUM(socialNbFollowers) AS num_of_followers_for_m
FROM
    users_data
WHERE
    gender = 'M';
-- Female users having 262458 and male users having 77038 followers all total
SELECT 
    MAX(socialNbFollowers) AS max_followers_f
FROM
    users_data
WHERE
    gender = 'F';
SELECT 
    MAX(socialNbFollowers) AS max_followers_m
FROM
    users_data
WHERE
    gender = 'M';
-- Female & Male users who got maximum follower correspondingly 744 & 147
# 7.Calculate the total users those
	-- a.Uses Profile Picture in their Profile
SELECT 
    COUNT(type) AS num_user_have_dp
FROM
    users_data
WHERE
    type = 'user'
        AND hasProfilePicture = 'True';
	-- b.Uses Application for Ecommerce platform
SELECT 
    COUNT(type) AS num_user_have_app
FROM
    users_data
WHERE
    type = 'user' AND hasAnyApp = 'True';
	-- c.Uses Android app
SELECT 
    COUNT(type) AS num_user_have_app
FROM
    users_data
WHERE
    type = 'user' AND hasAndroidApp = 'True';
	-- d.Uses ios app
SELECT 
    COUNT(type) AS num_user_have_app
FROM
    users_data
WHERE
    type = 'user' AND hasIosApp = 'True';
# 8.Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers.
SELECT 
    country,
    COUNT(productsBought) AS totalnum_buyer_for_eachcountry
FROM
    users_data
WHERE
    productsBought > 0
GROUP BY country
ORDER BY totalnum_buyer_for_eachcountry DESC;
# 9.Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers.
SELECT 
    country,
    COUNT(productsSold) AS totalnum_seller_for_eachcountry
FROM
    users_data
WHERE
    productsSold > 0
GROUP BY country
ORDER BY totalnum_seller_for_eachcountry DESC;
# 10.Display name of top 10 countries having maximum products pass rate 
SELECT 
    country,
    CAST(AVG(productsPassRate) AS DECIMAL (3 , 2 )) AS productpassrate_for_country
FROM
    users_data
GROUP BY country
ORDER BY productpassrate_for_country DESC
LIMIT 10;
# 11.Calculate the number of users on an ecommerce platform for different language choices
SELECT 
    language, COUNT(type) AS numof_users_fordifflaguage
FROM
    users_data
GROUP BY language;
# 12.Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform
SELECT 
    'female users',
    'femalusers_who_productwised',
    COUNT(productsWished) AS result
FROM
    users_data
WHERE
    productsWished > 0 AND gender = 'F' 
UNION SELECT 
    'female users',
    'femalusers_who_productsliked',
    COUNT(socialProductsLiked) AS result
FROM
    users_data
WHERE
    socialProductsLiked > 0 AND gender = 'F';
# 13.Check the choice of male users about being seller or buyer.
SELECT 
    'male users', 'products_bought', COUNT(type) AS result
FROM
    users_data
WHERE
    productsBought > 0 AND gender = 'M' 
UNION SELECT 
    'male users', 'products_sold', COUNT(type) AS result
FROM
    users_data
WHERE
    productsSold > 0 AND gender = 'M';
 # 14.Which country is having maximum number of buyers.
 SELECT 
    country, SUM(productsBought) AS max_buyer
FROM
    users_data
GROUP BY country
ORDER BY max_buyer DESC
LIMIT 1;
 # 15.List the name of 10 countries having zero number of sellers.
 SELECT 
    country, SUM(productsSold) AS zero_seller
FROM
    users_data
GROUP BY country
ORDER BY zero_seller ASC
LIMIT 10;
 #16.Display record of top 110 users who have used ecommerce platform recently.
 SELECT 
    *
FROM
    users_data
ORDER BY daysSinceLastLogin ASC
LIMIT 110;
 #17.Calculate the number of female users those who have not logged in since last 100 days.
 SELECT 
    'Female User', COUNT(type) AS not_loggedin_last100days
FROM
    users_data
WHERE
    gender = 'F'
        AND daysSinceLastLogin >= 100;
 #18.Display the number of female users of each country at ecommerce platform.
 SELECT 
    country, COUNT(type) AS no_female_user
FROM
    users_data
WHERE
    gender = 'F'
GROUP BY country;
 #19.Display the number of male users of each country at ecommerce platform.
 SELECT 
    country, COUNT(type) AS no_male_user
FROM
    users_data
WHERE
    gender = 'M'
GROUP BY country;
 #20.Calculate the average number of products sold and bought on ecommerce platform by male users for each country.
SELECT 
    country,
    AVG(productsSold) AS avg_products_sold,
    AVG(productsBought) AS avg_products_bought
FROM
    users_data
WHERE
    gender = 'M'
GROUP BY country;
