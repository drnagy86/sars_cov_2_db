/*

	FILE: test_error_handling_SARS_CoV-2.sql
    DATE: 2020-12-13
    AUTHOR: Derrick Nagy
    DESCRIPTION:
    
		Procedure calls for testing all the create, update, delete into the sars_cov-2 database. 
        
        All create a custom error as long as the sample number is not in the table that the procedure is operating on. 

*/

/*
	Test error handling for updates
*/

USE sars_cov_2;

CALL sp_update_check_in_re_sample (
	'CV2000010'-- the record to update
    , 'N' -- need_re_sample
);

CALL sp_update_check_in_subject_contacted(
	'CV2000011'-- the record to update
    , 'n' -- was the subject_contacted?
);

CALL sp_update_qc_gel_image(
	'CV2000011'-- the record to update
    , 'desktop/image/gel.img' -- new file path for gel_image
);

CALL sp_update_storage_box (
	'CV2000011' -- sample number
    , 'freezer 1' -- sample_stored
    , 'C' -- box_label
    , 99 -- box coordinates
);

CALL sp_update_sub_demo_days_hosp(
	'CV2000011' -- sample number
    , 30 -- days in the hospital
);


/*
	Test error handling for deletes
*/

CALL sp_delete_extraction(
	'CV2000011' -- p_sample_number
)
;

CALL sp_delete_qc(
	'CV2000011' -- p_sample_number
);

CALL sp_delete_storage_box(
	'CV2000011' -- p_sample_number
);

CALL sp_delete_sequencing(
	'CV2000011' -- p_sample_number
);

CALL sp_delete_subject_demographics(
	'CV2000011' -- p_sample_number
);

CALL sp_delete_symptoms_lookup (
	'sym66' -- p_sample_number
);

CALL sp_delete_conditions_lookup (
	'cond66' -- p_sample_number
);

CALL sp_delete_conditions(
	'CV2000066' -- p_sample_number
);

CALL sp_delete_symptoms(
	'CV2000066' -- p_sample_number
);

CALL sp_delete_gene_table_record(
	'CV2000066' -- p_sample_number
);

CALL sp_delete_gene_table_variant (
	'CV2000066' -- sample_number
	, 'c.266G>A.' -- coding variant
);

CALL sp_delete_gene_table_variant (
	'CV2000001' -- sample_number
	, '66666' -- coding variant
);

/*
	Test data validation on insert
*/

-- test regular expression
CALL sp_insert_check_in(
	'CV200008' -- sample_number
	, 'blood'-- sample_type 
	, '2020-12-08' -- date_sample_recieved
	, '' -- sample_condition_notes
	, 'N' -- need_re_sample
	, 'N' -- subject_contacted
);





