use learn ;
create table questionsql(dates date, customerid varchar(10), product_quantity int, price_per_item int, sales int, region char, transaction_id int) ;
insert into questionsql values('2021-10-09','CC1',3,33,99,'E',1);
select * from questionsql ;
insert into questionsql values('2021-10-09','CC1',4,22,88,'A',2), ('2020-12-26','CC1',2,111,222,'F',3), ('2020-12-27','CC2',1,22,22,'G',4), ('2020-12-28','CC2',4,11000,44000,'G',5), ('2020-12-29','CC3',2,33,66,'S',6), ('2020-12-30','CC3',1,22,22,'S',7), ('2021-10-09','CC4',3,11000,33000,'E',8), ('2021-10-10','CC4',4,33,132,'R',9) ;
select * from questionsql ;

#Questions and Answers
# 1) Which customer id bought maximum products?
SELECT customerid, SUM(product_quantity) as Total_product FROM questions GROUP BY customerid ORDER BY Total_product DESC ;

# 2) Get sales during Christmas period (21 dec 2020 - 27 dec 2020) by region
select sales,region from questionsql where dates between '2020-12-21' and '2020-12-27' group by region ;

# 3) Get count of transactions by region where customers had greater than 10000 sales and less than 10000 sales
select region,count(transaction_id) over (partition by region) from questionsql where sales>10000 ;
select region,count(transaction_id) over (partition by region) from questionsql where sales<10000 ;
select count(transaction_id) from questionsql where sales<10000;