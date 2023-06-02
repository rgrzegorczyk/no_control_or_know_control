CREATE OR REPLACE FORCE EDITIONABLE VIEW "RAFAL"."EMP_DETAILS_VIEW" 
 ( "COUNTRY_NAME", "REGION_NAME"
  )  AS 
  select c.country_name,
          r.region_name
     from countries c
     join regions r
       on c.region_id = r.region_id