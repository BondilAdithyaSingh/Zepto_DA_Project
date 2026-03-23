create table zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,	
quantity INTEGER
)


Select count(*) from zepto;


select * from zepto limit 10

---Checking the null values----
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;



--group by category---
select count(sku_id),category from zepto 
group by category 

--DISTINCT__
Select DISTINCT category from zepto order by category ;



SELECT * FROM zepto


--product in stock----
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;



select name,count(sku_id) as "Number of times"
from zepto 
group by name
having count(sku_id)>1
order by count(sku_id) Desc


Select sku_id,name ,mrp,discountedSellingPrice from zepto 
where mrp=0 and discountedSellingPrice =0


DELETE from ZEPTO WHERE sku_id=3830


UPDATE ZEPTO 
SET mrp=mrp/100.00,
discountedSellingPrice=discountedSellingPrice/100.00

select * from zepto

---the top 10 best-value products based on the discount percentage.
SELECT name,category,discountpercent from zepto 
order by discountpercent Desc limit 10

---What are the Products with High MRP but Out of Stock
Select name,mrp,outofstock from zepto where outofstock ='true' order by mrp desc limit 10

--Q3.Calculate Estimated Revenue for each category

Select Distinct category ,sum(discountedsellingprice*availableQuantity) as Total_Revenue from zepto group by category order by  Total_Revenue

 Find all products where MRP is greater than ₹500 and discount is less than 10%.

 select name from zepto where mrp >500 and discountpercent<10 order by mrp Desc,discountpercent desc

 
-- Q5. Identify the top 5 categories offering the highest average discount percentage.

select category,Round(avg(discountpercent),2)  from zepto group by category order by Round(avg(discountpercent),2) Desc limit 5

-- Q6. Find the price per gram for products above 100g and sort by best value.

SELECT DISTINCT name, weightInGms, discountedSellingPrice, ROUND(discountedSellingPrice/weightInGms,2) as price from zepto where weightInGms>=100 Order by price

--Q7.Group the products into categories like Low, Medium, Bulk.

SELECT name,weightInGms, 
CASE WHEN weightInGms<1000 THEN 'LOW'
 WHEN weightInGms <5000 THEN 'MEDIUM'
ELSE 'BULK'
END AS Category_weight
from zepto
--Q8.What is the Total Inventory Weight Per Category 

select category ,sum(weightInGms*availableQuantity) as weigth_sum from zepto group by category  order by weigth_sum 

