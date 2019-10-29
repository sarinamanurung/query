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






/*mBspOrders(confirm) month september is not blank (booking daily)*/
SELECT date(bo1.create_tm)
,COUNT (bo1.booking_id) AS orders 
/*,COUNT (bo2.booking_id) AS pendingorders*/
FROM PUBLIC.jv_booking_orders bo1
/*LEFT JOIN PUBLIC.jv_booking_orders bo2 ON bo1.create_tm=bo2.create_tm*/
WHERE date(bo1.create_tm)  between'2019-09-01' AND '2019-09-30' AND bo1.pickup_tm IS NULL 
GROUP BY date(bo1.create_tm);


