create table shipping_summary(
	shipping_date DATE,
    seller_name VARCHAR(255),
    buyer_name VARCHAR(255),
    buyer_address VARCHAR(255),
    buyer_city VARCHAR(255),
    buyer_zipcode VARCHAR(10),
    kode_resi VARCHAR(200));
	
INSERT INTO shipping_summary (shipping_date, seller_name, buyer_name, buyer_address, buyer_city, buyer_zipcode, kode_resi)

SELECT
  sh.shipping_date,
  sl.seller_name,
  byr.buyer_name,
  byr.address,
  byr.city,
  byr.zipcode,
  CONCAT(
    TO_CHAR(sh.shipping_date, 'YYYYMMDD'),
    '-',
    TO_CHAR(sh.purchase_date, 'YYYYMMDD'),
    '-',
    TO_CHAR(sh.shipping_date, 'YYYYMMDD'),
    '-',
    sh.buyer_id,
    '-',
    sh.seller_id
  ) AS kode_resi
FROM
  shipping_table sh
  JOIN seller_table sl ON sh.seller_id = sl.seller_id
  JOIN buyer_table byr ON sh.buyer_id = byr.buyer_id;

select * 
from buyer_table
select * from shipping_summary
