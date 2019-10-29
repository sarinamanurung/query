/*show all table from tem_jb_booking_orders*/
SELECT * FROM jv_booking_orders;

/* mtotalbooking month september*/
SELECT COUNT(booking_id) FROM PUBLIC.jv_booking_orders WHERE create_tm between'2019-09-01 00:00:00' AND '2019-09-30 23:59:59';

/*mBspOrders(confirm) month september is not blank (booking daily)*/
SELECT COUNT (booking_id) FROM PUBLIC.jv_booking_orders  
WHERE create_tm  between'2019-09-01 00:00:00' AND '2019-09-30 23:59:59' AND pickup_tm IS NOT NULL;

/*mBspOrders(pending) month september is not blank (booking daily)*/
SELECT COUNT (booking_id) FROM PUBLIC.jv_booking_orders  
WHERE create_tm  between'2019-09-01 00:00:00' AND '2019-09-30 23:59:59' AND pickup_tm IS NULL;


/*mBspOrders(cancel) month september is not blank (booking daily)*/
SELECT COUNT (booking_id) FROM PUBLIC.jv_booking_orders  
WHERE create_tm  between'2019-09-01 00:00:00' AND '2019-09-30 23:59:59' AND cancel_tm IS  NOT NULL;

/*grafik booking daily*/
SELECT date(bo1.create_tm)
,COUNT (bo1.booking_id) AS orders 
,COUNT (bo2.booking_id) AS pendingorders
FROM PUBLIC.jv_booking_orders bo1
Left JOIN ( select create_tm, tracking_ref_no, booking_id, pickup_tm FROM PUBLIC.jv_booking_orders WHERE pickup_tm IS null) bo2 ON bo1.tracking_ref_no=bo2.tracking_ref_no
WHERE date(bo1.create_tm)  between'2019-09-01' AND '2019-09-30' 
GROUP BY date(bo1.create_tm);



/*pickup assignment (pickup info daily*/
SELECT COUNT ("awb") FROM analysis_services.awb_summary WHERE "100_dt" between'2019-09-01' AND '2019-09-30';


/*pickup task (pickup info daily*/
SELECT COUNT ("54_dt") FROM analysis_services.awb_summary WHERE "100_dt" between'2019-09-01' AND '2019-09-30';


/*mBspOrders(confirm) month september is not blank (booking daily)*/
SELECT date(bo1.create_tm)
,COUNT (bo1.booking_id) AS orders 
/*,COUNT (bo2.booking_id) AS pendingorders*/
FROM PUBLIC.jv_booking_orders bo1
/*LEFT JOIN PUBLIC.jv_booking_orders bo2 ON bo1.create_tm=bo2.create_tm*/
WHERE date(bo1.create_tm)  between'2019-09-01' AND '2019-09-30' AND bo1.pickup_tm IS NULL 
GROUP BY date(bo1.create_tm);


SELECT date(bo1.create_tm)
,COUNT (bo1.booking_id) AS orders 
,COUNT (bo2.booking_id) AS pendingorders
FROM PUBLIC.jv_booking_orders bo1
Left JOIN ( select create_tm, tracking_ref_no, booking_id, pickup_tm FROM PUBLIC.jv_booking_orders WHERE pickup_tm IS null) bo2 ON bo1.tracking_ref_no=bo2.tracking_ref_no
WHERE date(bo1.create_tm)  between'2019-09-01' AND '2019-09-30' 
GROUP BY date(bo1.create_tm);


SELECT bo1.create_tm,
COUNT (bo1.booking_id) AS orders,  
COUNT (bo2.booking_id) AS pendingorders
FROM PUBLIC.jv_booking_orders bo1
LEFT JOIN PUBLIC.jv_booking_orders bo2 ON bo1.tracking_ref_no=bo2.tracking_ref_no
WHERE bo1.create_tm  between'2019-09-01 00:00:00' AND '2019-09-30 23:59:59' AND bo1.pickup_tm IS NULL
GROUP BY bo1.create_tm;

SELECT COUNT (booking_id) FROM PUBLIC.jv_booking_orders  
WHERE create_tm  between'2019-09-01 00:00:00' AND '2019-09-30 23:59:59' AND pickup_tm IS NULL;






SELECT COUNT ("awb") FROM analysis_services.awb_summary WHERE "100_dt" between'2019-09-01' AND '2019-09-30';

SELECT COUNT(awb) FROM analysis_services.awb_summary WHERE  between'2019-09-01 00:00:00' AND '2019-09-30 23:59:59'; 

SELECT COUNT ("54_dt") FROM analysis_services.awb_summary WHERE "100_dt" between'2019-09-01' AND '2019-09-30';
/*count all booking_id from temp_jv_booking_orders*/
SELECT COUNT (booking_id) FROM temp_jv_booking_orders AS totalbooking;


SELECT * FROM awb_summary WHERE pickup_unitzone = 'SBY-DSJ00' AND DATE_PART('month', order_time_dt) = 8;

SELECT COUNT(booking_id) FROM PUBLIC.jv_booking_orders WHERE create_tm::DATE =NOW()::DATE ;

SELECT COUNT(booking_id) FROM PUBLIC.jv_booking_orders WHERE create_tm between'2019-09-01 00:00:00' AND '2019-09-30 23:59:59';

SELECT COUNT (booking_id) FROM PUBLIC.jv_booking_orders  
WHERE create_tm  between'2019-09-01 00:00:00' AND '2019-09-30 23:59:59' AND pickup_tm IS NOT NULL;


SELECT COUNT(booking_id) FROM jv_booking_orders LIMIT 5;

SELECT 
a.tracking_ref_no,
a. create_tm,
b. pickup_type,
c. person_type,
c. team_code,
d. joint_point_code,
e. loginid,
e. name
FROM temp_jv_booking_orders a
left join tt_order_info b ON b. waybill_no = a. tracking_ref_no
left join tt_order_person_info c ON c. order_no = b. order_no
left join tr_joint_point_unitarea d ON d. receive_unitarea = c. team_code
left join tb_res_user e ON e. joint_point_code = d. joint_point_code
where a. create_tm between'2019-10-20 00:00:00' AND '2019-10-20 23:59:59'
and e. name = 'Sepmin Sarina'
and d. joint_point_code = 'BJRW0'
and c. person_type = '0'

SELECT * FROM temp_jv_booking_orders
    


