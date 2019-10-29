/* mtotalbooking month september*/
SELECT COUNT(booking_id) FROM PUBLIC.jv_booking_orders WHERE create_tm between'2019-09-01 00:00:00' AND '2019-09-30 23:59:59';

/*mBspOrders(confirm) month september is not blank (booking daily)*/
SELECT COUNT (booking_id) FROM PUBLIC.jv_booking_orders  
WHERE create_tm  between'2019-09-01 00:00:00' AND '2019-09-30 23:59:59' AND pickup_tm IS NOT NULL;

/*mBspOrders(pending) month september is not blank (booking daily)*/
SELECT COUNT (booking_id) FROM PUBLIC.jv_booking_orders  
WHERE create_tm  between'2019-09-01 00:00:00' AND '2019-09-30 23:59:59' AND pickup_tm IS NULL;

SELECT * FROM awb_summary WHERE pickup_unitzone = 'SBY-DSJ00' AND DATE_PART('month', order_time_dt) = 8;


/*mBspOrders(cancel) month september is not blank (booking daily)*/
SELECT COUNT (booking_id) FROM PUBLIC.jv_booking_orders  
WHERE DATE_PART('month', cancel_tm)=9;

/*mBspOrders(cancel) month september is not blank (booking daily)*/
SELECT COUNT (booking_id) FROM PUBLIC.jv_booking_orders  
WHERE create_tm  between'2019-09-01 00:00:00' AND '2019-09-30 23:59:59' AND cancel_tm IS  NOT NULL;

Closing_Month = DATEPART(MONTH, Closing_Date),

/*grafik booking daily monthly*/
SELECT date_part('month', bo1.create_tm) as bulan
,COUNT (bo1.booking_id) AS orders 
,COUNT (bo2.booking_id) AS pendingorders
FROM PUBLIC.jv_booking_orders bo1
Left JOIN ( select create_tm, tracking_ref_no, booking_id, pickup_tm FROM PUBLIC.jv_booking_orders WHERE pickup_tm IS null) bo2 ON bo1.tracking_ref_no=bo2.tracking_ref_no
GROUP BY date_part('month', bo1.create_tm);tt_pickup_task