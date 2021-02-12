/*
	FILE: triggers_SARS_CoV-2.sql
    DATE: 2020-12-12
    AUTHOR: Derrick Nagy
    DESCRIPTION:
		Triggers for the sars_cov-2 database.
        
        NOTE:
        Looking at HIPPA requirements, it seems like deleting information seems to 
        be the correct route to take instead of an audit table. When the permission
        is taken away, everything needs to be deleted.
	
*/

/**********************************************************************
	Create a trigger for check_in updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_check_in_log_update$$
CREATE TRIGGER tr_check_in_log_update
	AFTER UPDATE ON check_in
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_sars_cov_2.sql
	DESCRIPTION:
		Create a trigger to log any updates that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-12			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'check_in'
        , 'U'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'need_re_sample ', ', ' , OLD.need_re_sample, ']'
            , '[' , 'subject_contacted ', ', ', OLD.subject_contacted , ']'
				) -- end concat
	);

END $$
DELIMITER ;


/*
--test
CALL sp_update_check_in_re_sample('CV2000007', 'N');


SELECT *
FROM change_log
;
*/

/**********************************************************************
	Create a trigger for qc updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_qc_log_update$$
CREATE TRIGGER tr_qc_log_update
	AFTER UPDATE ON qc
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any updates that were made on qc.
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-12			Derrick Nagy		Initial Creation

*/

/*
change_log (
	log_date DATETIME NOT NULL COMMENT 'The date of the change'
    , log_user VARCHAR(10) NOT NULL COMMENT 'The user who made the change'
    , log_table VARCHAR(20) NOT NULL COMMENT 'The table that was changed'
    , log_change VARCHAR(100) NOT NULL COMMENT 'The change that was made'
*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type        
		, log_sample
		, log_change

	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'qc'
        , 'U'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'gel_image ', ', ' , OLD.gel_image , ']'
            
            ) -- end concat
	);

END $$
DELIMITER ;


/*
CALL sp_update_qc_gel_image (
	'CV2000003'
    , 'wooo'
);

CALL sp_update_qc_gel_image (
	'CV2000003'
    , 'wooo'
);

CALL sp_update_qc_gel_image (
	'CV2000003'
    , NULL
);
SELECT *
FROM change_log
;
*/

/**********************************************************************
	Create a trigger for storage_box updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_storage_box_log_update$$
CREATE TRIGGER tr_storage_box_log_update
	AFTER UPDATE ON storage_box
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any updates that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-12			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'storage_box'
        ,'U'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'sample_stored ', ', ' , OLD.sample_stored, ' ', ']' ,
            '[' , 'box_label ', ', ' , OLD.box_label , ' ' , ']' ,
            '[' , 'box_coordinates ', ', ' , OLD.box_coordinates , ']'
				) -- end concat
	);
    

END $$
DELIMITER ;



/*
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

SELECT *
FROM change_log
;

*/

/**********************************************************************
	Create a trigger for subject_demographics updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_subject_demographics_log_update$$
CREATE TRIGGER tr_subject_demographics_log_update
	AFTER UPDATE ON subject_demographics
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any updates that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-12			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change

	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'subject_demographics'
        , 'U'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'days_hosp ', ', ' , OLD.days_hosp, ' ', ']' 
            , '[' , 'treat1 ', ', ' , OLD.treat1 , ' ' , ']' 
				) -- end concat
	);
    


END $$
DELIMITER ;



/*
CALL sp_update_sub_demo_days_hosp (
	'CV2000004'-- sample number
    , 30 -- days in hospital
);

SELECT *
FROM change_log
;
*/



/**********************************************************************
	Create a trigger for check_in updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_check_in_log_delete$$
CREATE TRIGGER tr_check_in_log_delete
	AFTER DELETE ON check_in
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW() -- log date
		, SYSTEM_USER() -- log_user
		, 'check_in' -- log_table
        , 'D' -- log_change_type
        , OLD.sample_number -- sample_number
		, CONCAT( -- log_change
			'[' , 'sample_type ' , ', ' , OLD.sample_type , ' ' , ']' 
            , '[' , 'date_sample_received ', ', ' , OLD.date_sample_received , ' ' , ']' 
            , '[' , 'sample_condition_notes ', ', ' , OLD.sample_condition_notes , ']'
			, '[' , 'need_re_sample ', ', ' , OLD.need_re_sample , ']'
            , '[' , 'subject_contacted ', ', ' , OLD.subject_contacted , ' ' , ']'
			, '[' , 'date_check_in ', ', ' , OLD.date_check_in , ' ' , ']'           
			, '[' , 'user_check_in ', ', ' , OLD.user_check_in , ' ' , ']'            
				) -- end concat
        
	);

END $$
DELIMITER ;



/*
-- test
CALL sp_delete_check_in(
	'CV2000007'
);

SELECT *
FROM change_log
;

SELECT *
FROM check_in
;
*/


/**********************************************************************
	Create a trigger for extraction updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_extraction_log_delete$$
CREATE TRIGGER tr_extraction_log_delete
	AFTER DELETE ON extraction
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'extraction'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'date_of_extraction ', ', ' , OLD.date_of_extraction, ' ', ']'
			, '[' , 'extracted_by ', ', ' , OLD.extracted_by , ' ' , ']'
				) -- end concat
	);
    

END $$
DELIMITER ;


/*
--test
CALL sp_insert_extraction(
	'CV2000003' -- sample_number
    , '2020-08-30'-- date_of_extraction
    , 'ESP' -- extracted_by
)
;

CALL sp_delete_extraction(
	'CV2000003' -- p_sample_number
)
;
SELECT *
FROM change_log
;

*/



/**********************************************************************
	Create a trigger for qc updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_qc_log_delete$$
CREATE TRIGGER tr_qc_log_delete
	AFTER DELETE ON qc
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'qc'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'concentration ', ', ' , OLD.concentration, ' ', ']'
			, '[' , 'vol_of_hydration_buffer ', ', ' , OLD.vol_of_hydration_buffer , ' ' , ']'
			, '[' , 'amt_of_dna ', ', ' , OLD.amt_of_dna , ']'
			, '[' , 'frag_gel ', ', ' , OLD.frag_gel , ']'
			, '[' , 'date_of_gel ', ', ' , OLD.date_of_gel , ']'     
			, '[' , 'lane_number ', ', ' , OLD.lane_number , ']'     
			, '[' , 'gel_image ', ', ' , OLD.gel_image , ']'     
            
				) -- end concat
	);
    

END $$
DELIMITER ;



/*
-- test
CALL sp_delete_qc(
	'CV2000003' -- p_sample_number
);

CALL sp_insert_qc(
	'CV2000003'-- sample_number
	, 22 -- concentration
	, 800 -- vol_of_hydration_buffer
	, 17.6 -- amt_of_dna
	, 'N' -- frag_gel
	, '2020-08-15' -- date_of_gel
	, '1' -- lane_number
	, 'N/A'-- gel_imag
);
SELECT *
FROM change_log
;

*/



/**********************************************************************
	Create a trigger for storage_box updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_storage_box_log_delete$$
CREATE TRIGGER tr_storage_box_log_delete
	AFTER DELETE ON storage_box
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'storage_box'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'sample_stored ', ', ' , OLD.sample_stored, ' ', ']'
			, '[' , 'box_label ', ', ' , OLD.box_label , ' ' , ']'
			, '[' , 'box_coordinates ', ', ' , OLD.box_coordinates , ']'
				) -- end concat
	);
    

END $$
DELIMITER ;
/*
SELECT *
FROM change_log
;


-- test
CALL sp_delete_storage_box(
	'CV2000003' -- p_sample_number
);

CALL sp_storage_box(
	'CV2000003' -- sample_number
    , 'fridge 1'-- sample_stored
    , 'C' -- box_label
	, '3' -- box_coordinates
)
;

*/





/**********************************************************************
	Create a trigger for sequencing updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_sequencing_log_delete$$
CREATE TRIGGER tr_sequencing_log_delete
	AFTER DELETE ON sequencing
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'sequencing'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'sequencing_company ', ', ' , OLD.sequencing_company, ' ', ']'
			, '[' , 'sequence_batch ', ', ' , OLD.sequence_batch , ' ' , ']'
			, '[' , 'amt_of_dna_sent ', ', ' , OLD.amt_of_dna_sent , ']'
			, '[' , 'date_mailed ', ', ' , OLD.date_mailed , ']'
            , '[' , 'date_returned ', ', ' , OLD.date_returned , ']'
            , '[' , 'fastq_file_name ', ', ' , OLD.fastq_file_name , ']'
            , '[' , 'quality_date_filename ', ', ' , OLD.quality_date_filename , ']'
            , '[' , 'bam_file_name ', ', ' , OLD.bam_file_name , ']'
            , '[' , 'vcf_file_name ', ', ' , OLD.vcf_file_name , ']'
            , '[' , 'sequencing_stored ', ', ' , OLD.sequencing_stored , ']'
				) -- end concat
	);
    

END $$
DELIMITER ;


/*
SELECT *
FROM change_log
;

CALL sp_delete_sequencing(
	'CV2000003' -- p_sample_number
);

CALL sp_sequencing(
	'CV2000003'-- sample_number
	, 'Lab Corp' -- sequencing_company
	, 21 -- sequence_batch
	, 17.6 -- amt_of_dna_sent?? should this match the value in the extraction table? or like half or somthing
	, '2020-08-30' -- date_mailed
	, '2020-09-06' -- date_returned
	, 'abc4.fastq' -- fastq_file_name
	, 'abc4.qd' -- quality_date_filename
	, 'abc4.bam'-- bam_file_name
	, 'abc4.vcf'-- vcf_file_name
	, 'area52' -- sequencing_stored
);
*/




/**********************************************************************
	Create a trigger for subject_demographics updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_subject_demographics_log_delete$$
CREATE TRIGGER tr_subject_demographics_log_delete
	AFTER DELETE ON subject_demographics
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'subject_demographics'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'gender ', ', ' , OLD.gender, ' ', ']'
			, '[' , 'age ', ', ' , OLD.age , ' ' , ']'
			, '[' , 'covid_test ', ', ' , OLD.covid_test , ']'
            , '[' , 'days_hosp ', ', ' , OLD.days_hosp , ']'
            , '[' , 'cbc ', ', ' , OLD.cbc , ']'
            , '[' , 'treat1 ', ', ' , OLD.treat1 , ']'
            , '[' , 'severity ', ', ' , OLD.severity , ']'
				) -- end concat
	);
    

END $$
DELIMITER ;

/*
SELECT *
FROM change_log
;


CALL sp_delete_subject_demographics(
	'CV2000003' -- p_sample_number
);

CALL sp_subject_demographics(
	'CV2000003'-- sample_number
	, 'F'-- gender
	, 8 -- age
	, 'antibody ' -- covid_test
	, 0 -- days_hosp
	, 4.3 -- cbc
	, 'nothing'-- treat1
    , 'asymptomatic'
);


*/


/**********************************************************************
	Create a trigger for symptoms_lookup updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_symptoms_lookup_log_delete$$
CREATE TRIGGER tr_symptoms_lookup_log_delete
	AFTER DELETE ON symptoms_lookup
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'symptoms_lookup'
        , 'D'
		, CONCAT( 
			'[' , 'symp_code ', ', ' , OLD.symp_code, ' ', ']'
			, '[' , 'symp_descrip ', ', ' , OLD.symp_descrip , ' ' , ']'

				) -- end concat
	);
    

END $$
DELIMITER ;

/*
SELECT *
FROM change_log
;



-- test
CALL sp_delete_symptoms_lookup (
	'sym11' -- p_sample_number
);

-- I guess I have a procedure that does this...
INSERT INTO symptoms_lookup (
	symp_code
    , symp_descrip

)VALUES (
	'sym11' -- code
    , 'Enanthem' -- symp_descriptip
)
;
*/




/**********************************************************************
	Create a trigger for conditions_lookup updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_conditions_lookup_log_delete$$
CREATE TRIGGER tr_conditions_lookup_log_delete
	AFTER DELETE ON conditions_lookup
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'conditions_lookup'
        , 'D'
		, CONCAT( 
			'[' , 'cond_code ', ', ' , OLD.cond_code, ' ', ']'
			, '[' , 'cond_descrip ', ', ' , OLD.cond_descrip , ' ' , ']'

				) -- end concat
	);
    

END $$
DELIMITER ;

/*
SELECT *
FROM change_log
;

-- test
CALL sp_delete_conditions_lookup (
	'cond07' -- p_sample_number
);

CALL  sp_conditions_lookup(
	'cond07' -- code
    , 'Hypertension' -- cond_descrip
);


*/



/**********************************************************************
	Create a trigger for conditions updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_conditions_log_delete$$
CREATE TRIGGER tr_conditions_log_delete
	AFTER DELETE ON conditions
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'conditions'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'cond_code ', ', ' , OLD.cond_code, ' ', ']'
				) -- end concat
	);
    

END $$
DELIMITER ;

/*
-- test
CALL sp_delete_conditions(
	'CV2000003' -- p_sample_number
);

CALL sp_insert_samp_and_cond(
	'CV2000003' -- insert sample_number
	, 'cond05' -- insert cond_code
)
;
*/


/**********************************************************************
	Create a trigger for symptoms updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_symptoms_log_delete$$
CREATE TRIGGER tr_symptoms_log_delete
	AFTER DELETE ON symptoms
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'symptoms'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'symp_code ', ', ' , OLD.symp_code, ' ', ']'
				) -- end concat
	);
    

END $$
DELIMITER ;


/*
CALL sp_delete_symptoms(
	'CV2000003' -- p_sample_number
);

CALL sp_insert_samp_and_symp(
	'CV2000003' -- insert sample_number
	, 'sym20' -- insert sym_code
)
;


USE sars_cov_2;
SELECT * FROM change_log;
SELECT * FROM symptoms;
*/

/**********************************************************************
	Create a trigger for gene_lookup updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_gene_lookup_log_delete$$
CREATE TRIGGER tr_gene_lookup_log_delete
	AFTER DELETE ON gene_lookup
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'gene_lookup'
        , 'D'
		, CONCAT( 
			'[' , 'gene_name ', ', ' , OLD.gene_name, ' ', ']'
			, '[' , 'coding_variant ', ', ' , OLD.coding_variant , ' ' , ']'
			, '[' , 'protein_change ', ', ' , OLD.protein_change , ']'
            , '[' , 'gene_description ', ', ' , OLD.gene_description , ']'
            , '[' , 'location_chromo ', ', ' , OLD.location_chromo , ']'
            , '[' , 'grch38_location ', ', ' , OLD.grch38_location , ']'

				) -- end concat
	);
    

END $$
DELIMITER ;

/**********************************************************************
	Create a trigger for gene_table updates
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP TRIGGER IF EXISTS tr_gene_table_log_delete$$
CREATE TRIGGER tr_gene_table_log_delete
	AFTER DELETE ON gene_table
    FOR EACH ROW
BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'gene_table'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'gene_name ', ', ' , OLD.gene_name, ' ', ']'
			, '[' , 'coding_variant ', ', ' , OLD.coding_variant , ' ' , ']'
				) -- end concat
	);
    

END $$
DELIMITER ;







