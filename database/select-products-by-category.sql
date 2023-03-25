select 
	product.*
from
	product_category
join
	product on product.id = product_category.product_id
where
	product_category.category_id = 1;

    
    
