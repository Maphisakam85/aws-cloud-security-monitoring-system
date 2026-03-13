/*Failed login attemms*/
select user_id, count(*) as Failed_attempts
from cloud_security_monitoring
where status = 'Failed'
group by user_id
order by Failed_attempts desc

/*suspicious users*/
select user_id, count(*) as total_activity
from cloud_security_monitoring
group by user_id
order by total_activity desc
limit 10

/*most active IP Addresses*/
select ip_address, count(*) as access_count
from cloud_security_monitoring
group by ip_address
order by access_count desc
limit 10

/*activity by country*/
select country, count(*) total_requests
from cloud_security_monitoring
group by country
order by total_requests desc

/*unusual activity spikes */
select date(timestamp) as activity_date,
        count(*) as total_requests
from cloud_security_monitoring
group by date(timestamp)
order by total_requests desc

/*failed vs successful request*/
select status, count(*) as request_count
from cloud_security_monitoring
group by status;