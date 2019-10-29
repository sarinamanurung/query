/*pickup assignment (pickup info daily*/
SELECT COUNT ("awb") FROM analysis_services.awb_summary WHERE "100_dt" between'2019-09-01' AND '2019-09-30';

/*pickup task (pickup info daily*/
SELECT COUNT ("54_dt") FROM analysis_services.awb_summary WHERE "54_dt" between'2019-09-01' AND '2019-09-30' AND "54_dt" IS NOT NULL;

/*grafik pickup info monthly*/
SELECT opi.province
,COUNT (a."54_dt")
,COUNT (ass.awb)
FROM PUBLIC.tt_order_person_info opi
LEFT JOIN PUBLIC.tt_order_info oi ON opi.order_no = oi.order_no AND opi.person_type = 0
LEFT JOIN analysis_services.awb_summary ass ON ass.awb = oi.waybill_no 
LEFT JOIN ( SELECT awb, "54_dt"  FROM analysis_services.awb_summary WHERE "54_dt" between'2019-09-01' AND '2019-09-30' AND "54_dt" IS NOT NULL) a ON ass.awb=a.awb 
WHERE ass."100_dt" between'2019-09-01' AND '2019-09-30'
GROUP BY opi.province;