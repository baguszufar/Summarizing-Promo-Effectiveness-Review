CREATE TABLE promo_code (
	promo_id int primary key,
	promo_name varchar(200),
	price_deduction int,
	description varchar(200),
	duration int
);

CREATE TABLE Q3_Q4_Review (
	purchase_date date, 
	total_price int, 
	promo_code varchar (100),
	sales_after_promo int)

INSERT INTO Q3_Q4_Review (purchase_date, total_price, 
						  promo_code, sales_after_promo)
select purchase_date,(quantity * price) as total_price, pc promo_code,
((st.quantity * mt.price) - pc.price_deduction) AS sales_after_promo
from sales_table st
join marketplace_table mt on st.seller_id = mt.seller_id
join promo_code	pc on st.promo_id = pc.promo_id
where st.purchase_date between '2022-07-01' and '2022-12-31'


drop table promo_code

select * from promo_code
select * from sales_table
select * from marketplace_table
select * from Q3_Q4_Review