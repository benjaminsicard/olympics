select  
  date_trunc('day', created_date) as created_date,
  count(*) as requests 
from sample_data.nyc.service_requests 
group by all
order by created_date desc