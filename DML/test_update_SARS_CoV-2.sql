/*

	FILE: test_update_SARS_CoV-2.sql
    DATE: 2020-12-10
    AUTHOR: Derrick Nagy
    DESCRIPTION:
		Procedure calls for updating records into the sars_cov-2 database.

*/

/*Update the check_in table*/

USE sars_cov_2;
/*
SELECT *
FROM check_in
;
*/
-- general test outside a procedure
/*
UPDATE check_in
SET sample_type = 'snot'
WHERE sample_number = 'CV2000000'
;
*/

/*
Original insert values for this record
sample_number, 	sample_type, 	date_sample_received, 	sample_condition_notes, 		need_re_sample, 	subject_contacted
'CV2000000', 	'saliva', 		'2020-07-28', 			'Sample Dark Brown in Color', 	'N', 				'Y' 
*/

CALL sp_update_check_in_re_sample (
	'CV2000000'-- the record to update
    , 'N' -- need_re_sample
);



/*
	test the subject_contacted field for the check_in table
*/
CALL sp_update_check_in_subject_contacted(
	'CV2000000'-- the record to update
    , 'n' -- was the subject_contacted?
);

/*No update procedures for extraction table*/

/*Update the qc table*/

CALL sp_update_qc_gel_image(
	'CV2000000'-- the record to update
    , 'desktop/image/gel.img' -- new file path for gel_image
);

CALL sp_update_qc_gel_image (
	'CV2000003'
    , 'wooo'
);

CALL sp_update_qc_gel_image (
	'CV2000003'
    , 'desktop/image/gelCV2000003.img'
);


/*Update the storage box table*/
/*
SELECT  
	sample_number
    , sample_stored
    , box_label
    , box_coordinates
FROM storage_box
WHERE sample_number = 'CV2000000'
;

UPDATE storage_box
SET sample_stored = 'fridge 2'
    , box_label = 'B'
    , box_coordinates = '1'
WHERE sample_number = 'CV2000000'
;

*/

CALL sp_update_storage_box (
	'CV2000000' -- sample number
    , 'freezer 1' -- sample_stored
    , 'C' -- box_label
    , 99 -- box coordinates
);

CALL sp_update_storage_box(
	'CV2000002'--  p_sample_number VARCHAR(9)
	, 'storage1'--  p_sample_stored VARCHAR(100)
	, 'label1' --  p_box_label VARCHAR(100)
	, '10.25'--  p_box_coordinates VARCHAR(100)
);

CALL sp_update_storage_box(
	'CV2000003'--  p_sample_number VARCHAR(9)
	, 'storage3'--  p_sample_stored VARCHAR(100)
	, 'label2' --  p_box_label VARCHAR(100)
	, '25.11'--  p_box_coordinates VARCHAR(100)
);

CALL sp_update_storage_box(
	'CV2000000'--  p_sample_number VARCHAR(9)
	, 'storage3'--  p_sample_stored VARCHAR(100)
	, 'label1' --  p_box_label VARCHAR(100)
	, '01.11'--  p_box_coordinates VARCHAR(100)
);


/*
	update days_hosp in subject_demographics table
*/
/*
SELECT
	sample_number
	, gender
	, age
	, covid_test
	, days_hosp
	, cbc
	, treat1
FROM subject_demographics
WHERE sample_number = 'CV2000000'
;

UPDATE subject_demographics 
SET days_hosp = 10
WHERE sample_number = 'CV2000000'
;
*/

CALL sp_update_sub_demo_days_hosp(
	'CV2000000' -- sample number
    , 30 -- days in the hospital
);

CALL sp_update_sub_demo_days_hosp (
	'CV2000004'-- sample number
    , 30 -- days in hospital
);


/*
	update treat1 in subject_demographics
*/

CALL sp_update_sub_demo_treat1(
	'CV2000000' -- sample number
    , 'bleach' -- days in the hospital
);

CALL sp_update_sub_demo_treat1 (
	'CV2000004' -- sample_number
    , 'ventilator' -- treat1
);



/*Error Code: 1062. Duplicate entry 'C-2' for key 'storage_box.PRIMARY'
*/