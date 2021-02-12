/*
	FILE: create_database_SARS_CoV-2.sql
    AUTHOR: Derrick Nagy
    DATE: 2020-12-08
    
    COMMENTS:
    The create database and tables statements

*/


DROP DATABASE IF EXISTS sars_cov_2;
CREATE DATABASE sars_cov_2;

USE sars_cov_2;

DROP TABLE IF EXISTS check_in;
CREATE TABLE check_in(
	sample_number CHAR(9) NOT NULL UNIQUE COMMENT 'sample number, CVXXXXXXX, X being a number'
	, sample_type ENUM('blood', 'saliva', 'swab') NOT NULL DEFAULT 'saliva' COMMENT 'sample type. Example, saliva'
	, date_sample_received DATE NOT NULL COMMENT 'date the sample was received'
	, sample_condition_notes VARCHAR(100) NOT NULL COMMENT 'notes about the condition of the sample. Example, sample dark brown in color. Cannot accept null for logging purposes.'
	, need_re_sample ENUM ('Y','N') NOT NULL COMMENT 'does the sample need to be done again'
	, subject_contacted ENUM ('Y','N','not contacted','contacted-pending response', 'contacted-resample pending', 'contacted-unwilling to resample') NULL COMMENT 'was the sample no good and the subject contacted for a resample'
    , date_check_in DATE NULL COMMENT 'The date the record was inserted'
    , user_check_in VARCHAR(50) NULL COMMENT 'The user who created the record.'
	, PRIMARY KEY (sample_number)
)COMMENT 'Table that starts the process of putting in a sample'
;

/*
-- columns in the check_in table that were not part of the orignal table code
ALTER TABLE check_in
ADD 
    date_check_in DATE NULL COMMENT 'The date the record was inserted'
;
ALTER TABLE check_in
ADD 
    user_check_in VARCHAR(10) NULL COMMENT 'The user who created the record.'
;
ALTER TABLE check_in
MODIFY 
    user_check_in VARCHAR(50) NULL COMMENT 'The user who created the record.'
;

ALTER TABLE check_in
MODIFY
	sample_type ENUM('blood', 'saliva', 'swab') NOT NULL DEFAULT 'saliva' COMMENT 'sample type. Example, saliva'
;

ALTER TABLE check_in
MODIFY
	subject_contacted ENUM ('Y','N','not contacted','contacted-pending response', 'contacted-resample pending', 'contacted-unwilling to resample') NULL COMMENT 'was the sample no good and the subject contacted for a resample'
;

*/




DROP TABLE IF EXISTS change_log;
CREATE TABLE change_log (
	log_date DATETIME NOT NULL COMMENT 'The date of the change'
    , log_user VARCHAR(50) NOT NULL COMMENT 'The user who made the change'
    , log_table VARCHAR(20) NOT NULL COMMENT 'The table that was changed'
    , log_change_type ENUM('U','D') NOT NULL COMMENT 'Update or delete'
    , log_sample VARCHAR(9) NULL COMMENT 'sample number associated with the record'
    , log_change VARCHAR(500) NULL COMMENT 'The information as it was before the change was made.'

) COMMENT 'Table containing a log of the changes to the database'
;

/*
-- change the log change to null
ALTER TABLE change_log
MODIFY 
    log_change VARCHAR(500) NULL COMMENT 'The information as it was before the change was made.'
;
*/

DROP TABLE IF EXISTS extraction;
CREATE TABLE extraction(
	sample_number CHAR(9) NOT NULL UNIQUE COMMENT 'sample number, CVXXXXXXX, X being a number'
	, date_of_extraction DATE NOT NULL COMMENT 'when the sample was extracted'
	, extracted_by VARCHAR(3) NOT NULL DEFAULT 'ESP' COMMENT 'who extracted the sample. Example, ESP or MM'
	, date_check_in DATE NULL COMMENT 'The date the record was inserted'
    , user_check_in VARCHAR(50) NULL COMMENT 'The user who created the record.'
	, PRIMARY KEY (sample_number)
	, CONSTRAINT fk_check_in_sample_number
		FOREIGN KEY (sample_number)
		REFERENCES check_in(sample_number)
)COMMENT 'table that specifies when the sample was extracted'
;

DROP TABLE IF EXISTS qc;
CREATE TABLE qc(
	sample_number CHAR(9) NOT NULL UNIQUE COMMENT 'sample number, CVXXXXXXX, x being a number'
	, concentration DECIMAL(6,2) NOT NULL COMMENT 'concentration in (ng/µL)'
	, vol_of_hydration_buffer DECIMAL(6,2)  NOT NULL COMMENT 'volume of the heydration buffer in µL'
	, amt_of_dna DECIMAL(6,2) NOT NULL COMMENT 'amout of DNA in µg'
	, frag_gel ENUM ('Y','N') NOT NULL COMMENT 'Fragmentation gel?'
	, date_of_gel DATE NULL COMMENT 'Date of Gel'
	, lane_number INT UNSIGNED NULL COMMENT 'Lane Number'
	, gel_image VARCHAR(100) NULL COMMENT 'Gel Image (File path)'
	, date_check_in DATE NULL COMMENT 'The date the record was inserted'
    , user_check_in VARCHAR(50) NULL COMMENT 'The user who created the record.'
	, PRIMARY KEY (sample_number)
	, CONSTRAINT 
		FOREIGN KEY (sample_number)
		REFERENCES check_in(sample_number)
    
)COMMENT 'quality control table'
;

DROP TABLE IF EXISTS storage_box;
CREATE TABLE storage_box(
	sample_number CHAR(9) NOT NULL UNIQUE COMMENT 'sample number, CVXXXXXXX, x being a number'
	, sample_stored VARCHAR(100) NOT NULL COMMENT 'where the sample is stored'
	, box_label VARCHAR(100) NOT NULL COMMENT 'where the sample is stored in a box'
	, box_coordinates VARCHAR(100) NOT NULL COMMENT 'cordinates of the sample in a box'
	, date_check_in DATE NULL COMMENT 'The date the record was inserted'
    , user_check_in VARCHAR(50) NULL COMMENT 'The user who created the record.'
    , CONSTRAINT pk_storage_box
		PRIMARY KEY (box_label, box_coordinates)
		, FOREIGN KEY (sample_number)
		REFERENCES check_in(sample_number)
    
)COMMENT 'table that assoicates the sample number with where it is stored'
;	

CREATE TABLE sequencing(
	sample_number CHAR(9) NOT NULL UNIQUE COMMENT 'sample number, CVXXXXXXX, x being a number'
	, sequencing_company VARCHAR(100) NOT NULL COMMENT 'the company that the sequencing was sent to. '
	, sequence_batch INT UNSIGNED NOT NULL COMMENT 'sequence batch( the number of the batch that the sample was also in)'
	, amt_of_dna_sent DECIMAL(6,2) NOT NULL COMMENT 'amout of DNA in µg'
	, date_mailed DATE NOT NULL COMMENT 'Date Mailed to Sequencer'
	, date_returned DATE NULL COMMENT 'date the sample was received from sequencer'
	, fastq_file_name VARCHAR(100) NOT NULL UNIQUE COMMENT 'name of the fastq_file'
	, quality_date_filename VARCHAR(100) NOT NULL UNIQUE COMMENT 'name of the file'
	, bam_file_name VARCHAR(100) NOT NULL UNIQUE COMMENT 'name of the bam_file'
	, vcf_file_name VARCHAR(100) NOT NULL UNIQUE COMMENT 'name of the vc_file'
	, sequencing_stored VARCHAR(100) NOT NULL COMMENT 'location of the files'
	, date_check_in DATE NULL COMMENT 'The date the record was inserted'
    , user_check_in VARCHAR(50) NULL COMMENT 'The user who created the record.'
	, PRIMARY KEY (sample_number)
	, CONSTRAINT 
		FOREIGN KEY (sample_number)
		REFERENCES check_in(sample_number)
)COMMENT 'table that has the information about what was sent to the sequencing company'
;


DROP TABLE IF EXISTS subject_demographics;
CREATE TABLE subject_demographics(
	sample_number CHAR(9) NOT NULL UNIQUE COMMENT 'sample number, CVXXXXXXX, x being a number'
	, gender ENUM('M','F','N') NOT NULL COMMENT 'Biological gender of the sample. Male, female, non-binary(N)'
	, age TINYINT UNSIGNED NOT NULL COMMENT 'Age of the patient who gave the sample'
	, covid_test ENUM('S','P','A') NOT NULL COMMENT 'The type of test that was taken. S= subject reports positve, P= PCR, M= antibodies present'
	, days_hosp SMALLINT UNSIGNED NULL COMMENT 'days spent in the hospital'
	, cbc DECIMAL(10,2) NULL COMMENT 'complete blood cell count in million cells per microliter'
	, treat1 VARCHAR(100) NULL COMMENT 'the treatment that the patient had'
    , severity ENUM('asymptomatic','symptomatic','severe')  NULL COMMENT 'How severe the case was.'
	, date_check_in DATE NULL COMMENT 'The date the record was inserted'
    , user_check_in VARCHAR(50) NULL COMMENT 'The user who created the record.'
	, PRIMARY KEY (sample_number)
	, CONSTRAINT 
		FOREIGN KEY (sample_number)
		REFERENCES check_in(sample_number)
)COMMENT 'table containing the demographics of the subject'
;

/*
ALTER TABLE subject_demographics
ADD 
   severity VARCHAR(20) NULL COMMENT 'How severe the case was.'
;

ALTER TABLE subject_demographics
MODIFY
	severity ENUM('asymptomatic','symptomatic','severe')  NULL COMMENT 'How severe the case was.'
;

ALTER TABLE subject_demographics
MODIFY
	gender ENUM('M','F','N') NOT NULL COMMENT 'Biological gender of the sample. Male, female, non-binary(n)'
;

*/



	
DROP TABLE IF EXISTS symptoms_lookup;
CREATE TABLE symptoms_lookup (
	symp_code CHAR(5) NOT NULL UNIQUE COMMENT 'code for the symptom'
    , symp_descrip VARCHAR(100) NOT NULL UNIQUE COMMENT 'description of the symptoms'
    , PRIMARY KEY (symp_code)
) COMMENT 'lookup table for symptoms'
;

DROP TABLE IF EXISTS conditions_lookup;
CREATE TABLE conditions_lookup (
	cond_code CHAR(6) NOT NULL UNIQUE COMMENT 'code for the conditions'
    , cond_descrip VARCHAR(100) NOT NULL UNIQUE COMMENT 'description of the condition'
    , PRIMARY KEY (cond_code)
) COMMENT 'lookup table for conditions'
;



USE sars_cov_2;

DROP TABLE IF EXISTS gene_lookup;
CREATE TABLE gene_lookup (
	gene_name VARCHAR(20) NOT NULL COMMENT 'name for the gene'
    , coding_variant VARCHAR(20) NOT NULL UNIQUE COMMENT 'c.522A>T. Not sure how the variants will be recorded'
    , protein_change VARCHAR(20) NOT NULL COMMENT 'P.Arg54>Arg. Not sure how the variants will be recorded. In clinical, most functional information.'
    , gene_description VARCHAR(100) NOT NULL COMMENT 'description of the gene'
    , location_chromo VARCHAR(2) NOT NULL COMMENT 'chromosome the gene is found in, '
    , grch38_location VARCHAR(100) NOT NULL COMMENT 'Build, GRCh38 (7668421..7687490, complement. )'
    , PRIMARY KEY (gene_name, coding_variant)
) COMMENT 'Lookup table for genes, source: National Center for Biotechnology Information https://www.ncbi.nlm.nih.gov/genome/guide/human/'
;

/*
DROP TABLE IF EXISTS severity_lookup;
CREATE TABLE severity_lookup(
	sev_code CHAR(5) NOT NULL UNIQUE COMMENT 'Code for how severe the case was.'
    , sev_description  VARCHAR(100) NOT NULL COMMENT 'Description for how severe the case was.'
	, PRIMARY KEY (sev_code)
) COMMENT 'Lookup table for the severity of the illness.'
;
*/	


DROP TABLE IF EXISTS conditions;
CREATE TABLE conditions(
	sample_number CHAR(9) NOT NULL COMMENT 'sample number, CVXXXXXXX, x being a number'
	, cond_code CHAR(6) NOT NULL COMMENT 'Description of the conditions'
	, date_check_in DATE NULL COMMENT 'The date the record was inserted'
    , user_check_in VARCHAR(50) NULL COMMENT 'The user who created the record.'
    , PRIMARY KEY (sample_number, cond_code)
	, CONSTRAINT
		FOREIGN KEY (sample_number)
		REFERENCES check_in(sample_number)
	, CONSTRAINT fk_cond_code
		FOREIGN KEY (cond_code)
		REFERENCES conditions_lookup(cond_code)
)
COMMENT 'A table to add the conditions that the patient has to their sample number'
;

USE sars_cov_2;
/*
DROP TABLE IF EXISTS symptoms;
CREATE TABLE symptoms(
	sample_number CHAR(9) NOT NULL COMMENT 'sample number, CVXXXXXXX, X being a number'
	, sym01 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Abnormal chest x-ray'
	, sym02 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Abnormal CT'
	, sym03 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Acute kidney injury'
	, sym04 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'ARDS'
	, sym05 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Cardiac involvement'
	, sym06 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Chills'
	, sym07 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Clotting'
	, sym08 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Conjunctival congestion'
	, sym09 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Diarrhea'
	, sym10 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Dry cough'
	, sym11 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Enanthem'
	, sym12 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Fatigue'
	, sym13 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Fever'
	, sym14 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Headache'
	, sym15 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Hemoptysis'
	, sym16 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Loss of taste/smell'
	, sym17 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Multiple organ failure'
	, sym18 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Myalgia/arthralgia'
	, sym19 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Nasal congestion'
	, sym20 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Nausea/vomiting'
	, sym21 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Pneumonia'
	, sym22 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Productive cough'
	, sym23 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'pulmonary edema'
	, sym24 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Rash'
	, sym25 ENUM ('P', 'A', 'ND') NULL 	COMMENT 'Shortness of breath'
	, sym26 ENUM ('P', 'A', 'ND') NULL	COMMENT 'Sore throat' 
	, date_check_in DATE NULL COMMENT 'The date the record was inserted'
    , user_check_in VARCHAR(50) NULL COMMENT 'The user who created the record.'
    , PRIMARY KEY (sample_number)
	, CONSTRAINT
		FOREIGN KEY (sample_number)
		REFERENCES check_in(sample_number)
)
COMMENT 'A table to add the symptoms that the patient has to their sample number'
;

*/

-- alternate code for the symptoms table where each symptom is refereed to in the lookup table.

DROP TABLE IF EXISTS symptoms;
CREATE TABLE symptoms(
	sample_number CHAR(9) NOT NULL COMMENT 'sample number, CVXXXXXXX, X being a number'
	, symp_code char(5) NOT NULL COMMENT 'Any known symptoms'
    , symp_pres ENUM ('P', 'A', 'N') NULL COMMENT 'If the symptom is present, absent, or there is no data'
	, date_check_in DATE NULL COMMENT 'The date the record was inserted'
    , user_check_in VARCHAR(50) NULL COMMENT 'The user who created the record.'
    , PRIMARY KEY (sample_number, symp_code)
	, CONSTRAINT
		FOREIGN KEY (sample_number)
		REFERENCES check_in(sample_number)
	, CONSTRAINT fk_symp_code
		FOREIGN KEY (symp_code)
		REFERENCES symptoms_lookup(symp_code)
)
COMMENT 'A table to add the symptoms that the patient has to their sample number'
;



/*
 -- add another column for  weither or not the symptom is present or not
ALTER TABLE symptoms
ADD
	symp_pres ENUM ('present', 'absent', 'No Data') NULL COMMENT 'If the symptom is present, absent, or there is no data'
;
*/

DROP TABLE IF EXISTS gene_table;
CREATE TABLE gene_table(
	sample_number CHAR(9) NOT NULL COMMENT 'sample number, CVXXXXXXX, X being a number'
	, gene_name VARCHAR(20) NOT NULL COMMENT 'Name of the gene'
	, coding_variant VARCHAR(20) NOT NULL COMMENT 'c.522A>T. Not sure how the variants will be recorded'
	, date_check_in DATE NULL COMMENT 'The date the record was inserted'
    , user_check_in VARCHAR(50) NULL COMMENT 'The user who created the record.'
	, PRIMARY KEY (sample_number, coding_variant)
	, CONSTRAINT
		FOREIGN KEY (sample_number)
		REFERENCES check_in(sample_number)
	, CONSTRAINT fk_coding_variant
		FOREIGN KEY (coding_variant)
		REFERENCES gene_lookup(coding_variant)
)
COMMENT 'The table that keeps the genes that are of interest for the sample'
;


/*
ALTER TABLE gene_table
DROP FOREIGN KEY fk_gene_name
;


	, CONSTRAINT fk_gene_name
		FOREIGN KEY (gene_name)
		REFERENCES gene_lookup(gene_name)
*/







/*
	FILE: procedures_misc_SARS_CoV-2.sql
    DATE: 2020-12-13
    AUTHOR: Derrick Nagy
    DESCRIPTION:
		Write procedures for the final project
*/


USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_sample_num_regexp $$
CREATE PROCEDURE sp_sample_num_regexp (
	IN p_sample_number CHAR(9)
)
COMMENT 'Sample number validation procedure'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	 procedures_misc_SARS_CoV-2.sql
		DESCRIPTION:
			Test the sample number to see if it fits the pattern. 
            
		
        Psuedo code for REGEX:
            
			regex_tf = REGEX_LIKE( p_sample_number, /CV2000[0-9][0-9][0-9]/);
    
			IF regex_tf = 0 THEN
				-- message about the sample number being wrong
			ELSE
				-- move on...
			END IF

	);
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-13			Derrick Nagy		Initial Creation
	*/

    DECLARE regex_tf TINYINT DEFAULT 0;
    
	SELECT p_sample_number regexp 'CV2000[0-9][0-9][0-9]'
    INTO regex_tf;

	IF regex_tf = 0 THEN
		SIGNAL SQLSTATE '45000' -- NOT FOUND
		SET MESSAGE_TEXT = 'Sample number does not follow pattern.';
	END IF;
    


END$$

DELIMITER ;   
    
    
    /*
SELECT REGEXP_LIKE('CV200022', 'CV2000[0-9][0-9][0-9]');
*/

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







/*
	FILE: procedures_insert_SARS_CoV-2.sql
    DATE: 2020-12-08
    AUTHOR: Derrick Nagy
    DESCRIPTION:
		Write procedures for the final project
*/


-- ******************************************************************
-- Insert into check_in table

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_insert_check_in$$
CREATE PROCEDURE sp_insert_check_in(
	IN p_sample_number CHAR(9)
 	, IN p_sample_type ENUM('blood', 'saliva', 'swab')
    , IN p_date_sample_received DATE
    , IN p_sample_condition_notes VARCHAR(100)
    , IN p_need_re_sample ENUM ('Y','N','not contacted','contacted-pending response', 'contacted-resample pending', 'contacted-unwilling to resample')
    , IN p_subject_contacted ENUM('Y','N')
)
COMMENT 'Insert into the check in table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the check_in table.
            To test, procedure call is in file "test_insert_SARS_Cov.sql"
            

	);
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-08			Derrick Nagy		Initial Creation
	*/
    -- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
    
    
	 INSERT INTO check_in (
		sample_number
		, sample_type 
		, date_sample_received
		, sample_condition_notes
		, need_re_sample
		, subject_contacted
		, date_check_in
		, user_check_in
	) VALUES (
		p_sample_number
		, p_sample_type 
		, p_date_sample_received
		, p_sample_condition_notes
		, p_need_re_sample
		, p_subject_contacted
		, NOW()
		, SYSTEM_USER()
	)
	;

	 SELECT 
		sample_number
		, sample_type 
		, date_sample_received
		, sample_condition_notes
		, need_re_sample
		, subject_contacted
		, date_check_in
		, user_check_in
	 FROM check_in
	 WHERE sample_number = p_sample_number
	 ;
 
	
END$$
DELIMITER ;

/*
SELECT REGEXP_LIKE('CV200022', 'CV2000[0-9][0-9][0-9]');
*/

-- ******************************************************************
-- Insert into extraction table

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_insert_extraction$$
CREATE PROCEDURE  sp_insert_extraction(
	IN p_sample_number	CHAR(9)
    , IN p_date_of_extraction DATE
    , IN p_extracted_by VARCHAR(3)
)
COMMENT 'Insert into the extraction table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the extraction table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-08			Derrick Nagy		Initial Creation
	*/
    -- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
		
	 INSERT INTO extraction (
		sample_number
		, date_of_extraction
		, extracted_by
		, date_check_in
		, user_check_in
	) VALUES (
		p_sample_number
		, p_date_of_extraction
		, p_extracted_by
		, NOW()
		, SYSTEM_USER()   
	)
	;

	 SELECT 
		sample_number
		, date_of_extraction
		, extracted_by
	 FROM extraction
	 WHERE sample_number = p_sample_number
	 ;
 	
END$$
DELIMITER ;

-- ******************************************************************
-- Insert into qc table

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_insert_qc$$
CREATE PROCEDURE  sp_insert_qc(
	IN p_sample_number CHAR(9)
	, IN p_concentration DECIMAL(6,2)
	, IN p_vol_of_hydration_buffer DECIMAL(6,2)
	, IN p_amt_of_dna DECIMAL(6,2)
	, IN p_frag_gel ENUM ('Y','N')
	, IN p_date_of_gel DATE
	, IN p_lane_number INT UNSIGNED
	, IN p_gel_image VARCHAR(100)

)
COMMENT 'Insert into the quality control table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the quality control table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-08			Derrick Nagy		Initial Creation
	*/
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
	
	 INSERT INTO qc (
		sample_number
		, concentration
		, vol_of_hydration_buffer
		, amt_of_dna
		, frag_gel
		, date_of_gel
		, lane_number
		, gel_image
		, date_check_in
		, user_check_in
		
	) VALUES (
		p_sample_number
		, p_concentration
		, p_vol_of_hydration_buffer
		, p_amt_of_dna
		, p_frag_gel
		, p_date_of_gel
		, p_lane_number
		, p_gel_image
		, NOW()
		, SYSTEM_USER()    
	)
	;

	SELECT 
		sample_number
		, concentration
		, vol_of_hydration_buffer
		, amt_of_dna
		, frag_gel
		, date_of_gel
		, lane_number
		, gel_image
	FROM
		qc
	WHERE
		sample_number = p_sample_number
	;
 	
END$$
DELIMITER ;

-- ******************************************************************

-- ******************************************************************
-- Insert into storage_box table

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_storage_box$$
CREATE PROCEDURE  sp_storage_box(
	IN p_sample_number CHAR(9)
	, IN p_sample_stored VARCHAR(100)
	, IN p_box_label VARCHAR(100)
    , IN p_box_coordinates VARCHAR(100)
)
COMMENT 'Insert into the storage_box table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the storage box table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-08			Derrick Nagy		Initial Creation
	*/
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
	
	 INSERT INTO storage_box (
		sample_number
		, sample_stored
		, box_label
		, box_coordinates
		, date_check_in
		, user_check_in
		
	) VALUES (
		p_sample_number
		, p_sample_stored
		, p_box_label
		, p_box_coordinates
		, NOW()
		, SYSTEM_USER()    
	)
	;

	SELECT 
		sample_number
		, sample_stored
		, box_label
		, box_coordinates

	FROM
		storage_box
	WHERE
		sample_number = p_sample_number
	;
 	
END$$
DELIMITER ;

-- ******************************************************************

-- ******************************************************************
-- Insert into storage_box table

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_sequencing$$
CREATE PROCEDURE  sp_sequencing(
	IN p_sample_number CHAR(9)
	, IN p_sequencing_company VARCHAR(100)
	, IN p_sequence_batch INT UNSIGNED
	, IN p_amt_of_dna_sent DECIMAL(6,2)
	, IN p_date_mailed DATE 
	, IN p_date_returned DATE
	, IN p_fastq_file_name VARCHAR(100)
	, IN p_quality_date_filename VARCHAR(100)
	, IN p_bam_file_name VARCHAR(100)
	, IN p_vcf_file_name VARCHAR(100)
	, IN p_sequencing_stored VARCHAR(100)

)
COMMENT 'Insert into the storage_box table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the sequencing table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-08			Derrick Nagy		Initial Creation
	*/
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
	
 INSERT INTO sequencing (
	sample_number
	, sequencing_company
	, sequence_batch
	, amt_of_dna_sent
	, date_mailed
	, date_returned
	, fastq_file_name
	, quality_date_filename
	, bam_file_name
	, vcf_file_name
	, sequencing_stored
	, date_check_in
	, user_check_in
    
) VALUES (
	p_sample_number
	, p_sequencing_company
	, p_sequence_batch
	, p_amt_of_dna_sent
	, p_date_mailed
	, p_date_returned
	, p_fastq_file_name
	, p_quality_date_filename
	, p_bam_file_name
	, p_vcf_file_name
	, p_sequencing_stored
	, NOW()
	, SYSTEM_USER()
)
;

SELECT 
	sample_number
	, sequencing_company
	, sequence_batch
	, amt_of_dna_sent
	, date_mailed
	, date_returned
	, fastq_file_name
	, quality_date_filename
	, bam_file_name
	, vcf_file_name
	, sequencing_stored


FROM
    sequencing
WHERE
    sample_number = p_sample_number
;
 	
END$$
DELIMITER ;

-- ******************************************************************

-- ******************************************************************
-- Insert into subject_demographics table

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_subject_demographics$$
CREATE PROCEDURE  sp_subject_demographics(
	IN p_sample_number CHAR(9)
	, IN p_gender ENUM('M','F', 'N')
	, IN p_age TINYINT UNSIGNED
	, IN p_covid_test VARCHAR(100)
	, IN p_days_hosp SMALLINT UNSIGNED
	, IN p_cbc DECIMAL(10,2)
	, IN p_treat1 VARCHAR(100)
    , IN p_severity VARCHAR(20)

)
COMMENT 'Insert into the subject_demographics table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the subject_demographics table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-08			Derrick Nagy		Initial Creation
	*/
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
	
	 INSERT INTO subject_demographics (
		sample_number
		,  gender
		,  age
		,  covid_test
		,  days_hosp
		,  cbc
		,  treat1
		,  severity
		, date_check_in
		, user_check_in

		
	) VALUES (
		 p_sample_number
		,  p_gender
		,  p_age
		,  p_covid_test
		,  p_days_hosp
		,  p_cbc
		,  p_treat1
		, p_severity
		, NOW()
		, SYSTEM_USER()
	)
	;

	SELECT 
		sample_number
		,  gender
		,  age
		,  covid_test
		,  days_hosp
		,  cbc
		,  treat1
		, severity


	FROM
		subject_demographics
	WHERE
		sample_number = p_sample_number
	;
 	
END$$
DELIMITER ;

-- ******************************************************************

-- ******************************************************************
-- Insert into symptoms_lookup table

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_symptoms_lookup$$
CREATE PROCEDURE  sp_symptoms_lookup(
	 IN p_symp_code CHAR(5)
	, IN p_symp_descrip VARCHAR(100)
)
COMMENT 'Insert into the symptoms_lookup table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the symptoms_lookup table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-08			Derrick Nagy		Initial Creation
	*/
	
 INSERT INTO symptoms_lookup (
	symp_code
	, symp_descrip
    
) VALUES (
	p_symp_code
	, p_symp_descrip
)
;

SELECT 
	symp_code
	, symp_descrip
FROM
    symptoms_lookup
;
 	
END$$
DELIMITER ;

-- ******************************************************************

-- ******************************************************************
-- Insert into conditions_lookup table

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_conditions_lookup$$
CREATE PROCEDURE  sp_conditions_lookup(
	 IN p_cond_code CHAR(6)
	, IN p_cond_descrip VARCHAR(100)
)
COMMENT 'Insert into the conditions_lookup table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the conditions_lookup table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-09			Derrick Nagy		Initial Creation
	*/
	
 INSERT INTO conditions_lookup (
	cond_code
	, cond_descrip
    
) VALUES (
	p_cond_code
	, p_cond_descrip
)
;

SELECT 
	cond_code
	, cond_descrip
FROM
    conditions_lookup
;
 	
END$$
DELIMITER ;

-- ******************************************************************

-- ******************************************************************
-- Insert sample and condition into the conditions table

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_insert_samp_and_cond$$
CREATE PROCEDURE  sp_insert_samp_and_cond(
	IN p_sample_number CHAR(9)
	, IN p_cond_code  CHAR(6)
)
COMMENT 'Insert sample and condition into the conditions table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert the sample number and the condition into the conditions table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-09			Derrick Nagy		Initial Creation
	*/
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
	
	 INSERT INTO conditions(
		sample_number
		, cond_code
		, date_check_in
		, user_check_in
		
	) VALUES (
		p_sample_number
		, p_cond_code
		, NOW()
		, SYSTEM_USER()    
	)
	;

	SELECT 
		sample_number
		, cond_code
	FROM
		conditions
	WHERE    
		sample_number = p_sample_number
	;
    
END$$
DELIMITER ;

-- ******************************************************************

-- ******************************************************************
-- Insert sample and condition into the symptoms table
/*
USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_insert_samp_and_symp$$
CREATE PROCEDURE  sp_insert_samp_and_symp(
	IN p_sample_number CHAR(9)
	, IN p_sym01 ENUM ('P', 'A', 'ND')  	--  'Abnormal chest x-ray'
	, IN p_sym02 ENUM ('P', 'A', 'ND')  	--  'Abnormal CT'
	, IN p_sym03 ENUM ('P', 'A', 'ND')  	--  'Acute kidney injury'
	, IN p_sym04 ENUM ('P', 'A', 'ND')  	--  'ARDS'
	, IN p_sym05 ENUM ('P', 'A', 'ND')  	--  'Cardiac involvement'
	, IN p_sym06 ENUM ('P', 'A', 'ND')  	--  'Chills'
	, IN p_sym07 ENUM ('P', 'A', 'ND')  	--  'Clotting'
	, IN p_sym08 ENUM ('P', 'A', 'ND')  	--  'Conjunctival congestion'
	, IN p_sym09 ENUM ('P', 'A', 'ND')  	--  'Diarrhea'
	, IN p_sym10 ENUM ('P', 'A', 'ND')  	--  'Dry cough'
	, IN p_sym11 ENUM ('P', 'A', 'ND')  	--  'Enanthem'
	, IN p_sym12 ENUM ('P', 'A', 'ND')  	--  'Fatigue'
	, IN p_sym13 ENUM ('P', 'A', 'ND')  	--  'Fever'
	, IN p_sym14 ENUM ('P', 'A', 'ND')  	--  'Headache'
	, IN p_sym15 ENUM ('P', 'A', 'ND')  	--  'Hemoptysis'
	, IN p_sym16 ENUM ('P', 'A', 'ND')  	--  'Loss of taste/smell'
	, IN p_sym17 ENUM ('P', 'A', 'ND')  	--  'Multiple organ failure'
	, IN p_sym18 ENUM ('P', 'A', 'ND')  	--  'Myalgia/arthralgia'
	, IN p_sym19 ENUM ('P', 'A', 'ND')  	--  'Nasal congestion'
	, IN p_sym20 ENUM ('P', 'A', 'ND')  	--  'Nausea/vomiting'
	, IN p_sym21 ENUM ('P', 'A', 'ND')  	--  'Pneumonia'
	, IN p_sym22 ENUM ('P', 'A', 'ND')  	--  'Productive cough'
	, IN p_sym23 ENUM ('P', 'A', 'ND')  	--  'pulmonary edema'
	, IN p_sym24 ENUM ('P', 'A', 'ND')  	--  'Rash'
	, IN p_sym25 ENUM ('P', 'A', 'ND')  	--  'Shortness of breath'
	, IN p_sym26 ENUM ('P', 'A', 'ND') 		--  'Sore throat'
)
COMMENT 'Insert sample and symptom into the symptoms table'
BEGIN

    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    INSERT INTO symptoms (
		sample_number
		, sym01   	--  'Abnormal chest x-ray'
		, sym02   	--  'Abnormal CT'
		, sym03   	--  'Acute kidney injury'
		, sym04   	--  'ARDS'
		, sym05   	--  'Cardiac involvement'
		, sym06   	--  'Chills'
		, sym07   	--  'Clotting'
		, sym08   	--  'Conjunctival congestion'
		, sym09   	--  'Diarrhea'
		, sym10   	--  'Dry cough'
		, sym11   	--  'Enanthem'
		, sym12   	--  'Fatigue'
		, sym13   	--  'Fever'
		, sym14   	--  'Headache'
		, sym15   	--  'Hemoptysis'
		, sym16   	--  'Loss of taste/smell'
		, sym17   	--  'Multiple organ failure'
		, sym18   	--  'Myalgia/arthralgia'
		, sym19   	--  'Nasal congestion'
		, sym20   	--  'Nausea/vomiting'
		, sym21   	--  'Pneumonia'
		, sym22   	--  'Productive cough'
		, sym23   	--  'pulmonary edema'
		, sym24   	--  'Rash'
		, sym25   	--  'Shortness of breath'
		, sym26  		--  'Sore throat'
		, date_check_in
		, user_check_in
    
    ) VALUES (
		p_sample_number
		, p_sym01   	--  'Abnormal chest x-ray'
		, p_sym02   	--  'Abnormal CT'
		, p_sym03   	--  'Acute kidney injury'
		, p_sym04   	--  'ARDS'
		, p_sym05   	--  'Cardiac involvement'
		, p_sym06   	--  'Chills'
		, p_sym07   	--  'Clotting'
		, p_sym08   	--  'Conjunctival congestion'
		, p_sym09   	--  'Diarrhea'
		, p_sym10   	--  'Dry cough'
		, p_sym11   	--  'Enanthem'
		, p_sym12   	--  'Fatigue'
		, p_sym13   	--  'Fever'
		, p_sym14   	--  'Headache'
		, p_sym15   	--  'Hemoptysis'
		, p_sym16   	--  'Loss of taste/smell'
		, p_sym17   	--  'Multiple organ failure'
		, p_sym18   	--  'Myalgia/arthralgia'
		, p_sym19   	--  'Nasal congestion'
		, p_sym20   	--  'Nausea/vomiting'
		, p_sym21   	--  'Pneumonia'
		, p_sym22   	--  'Productive cough'
		, p_sym23   	--  'pulmonary edema'
		, p_sym24   	--  'Rash'
		, p_sym25   	--  'Shortness of breath'
		, p_sym26  		--  'Sore throat'
		, NOW()
		, SYSTEM_USER() 
    );
    
	SELECT 
		sample_number
		, sym01   	--  'Abnormal chest x-ray'
		, sym02   	--  'Abnormal CT'
		, sym03   	--  'Acute kidney injury'
		, sym04   	--  'ARDS'
		, sym05   	--  'Cardiac involvement'
		, sym06   	--  'Chills'
		, sym07   	--  'Clotting'
		, sym08   	--  'Conjunctival congestion'
		, sym09   	--  'Diarrhea'
		, sym10   	--  'Dry cough'
		, sym11   	--  'Enanthem'
		, sym12   	--  'Fatigue'
		, sym13   	--  'Fever'
		, sym14   	--  'Headache'
		, sym15   	--  'Hemoptysis'
		, sym16   	--  'Loss of taste/smell'
		, sym17   	--  'Multiple organ failure'
		, sym18   	--  'Myalgia/arthralgia'
		, sym19   	--  'Nasal congestion'
		, sym20   	--  'Nausea/vomiting'
		, sym21   	--  'Pneumonia'
		, sym22   	--  'Productive cough'
		, sym23   	--  'pulmonary edema'
		, sym24   	--  'Rash'
		, sym25   	--  'Shortness of breath'
		, sym26  	--  'Sore throat'
	FROM
		symptoms
	WHERE    
		sample_number = p_sample_number
	;
    

END $$
DELIMITER ;

*/

-- alternate insert procedure of alternate verision of the table
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_insert_samp_and_symp$$
CREATE PROCEDURE  sp_insert_samp_and_symp(
	IN p_sample_number CHAR(9)
	, IN p_symp_code  CHAR(5)
    , IN p_symp_pres ENUM ('P', 'A', 'N')
)
COMMENT 'Insert sample and symptom into the symptoms table'
BEGIN

	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert the sample number and the condition into the conditions table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2021-01-03			Derrick Nagy		Initial Creation
	*/
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
	
	 INSERT INTO symptoms(
		sample_number
		, symp_code
        , symp_pres
		, date_check_in
		, user_check_in
		
	) VALUES (
		p_sample_number
		, p_symp_code
        , p_symp_pres
		, NOW()
		, SYSTEM_USER()
	)
	;

	SELECT 
		sample_number
		, symp_code
        , symp_pres

	FROM
		symptoms
	WHERE sample_number = p_sample_number    
	;
END$$
DELIMITER ;



-- ******************************************************************

-- ******************************************************************
-- Insert into gene_lookup table

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_gene_lookup$$
CREATE PROCEDURE  sp_gene_lookup(
	IN p_gene_name CHAR(9)
    , IN p_coding_variant VARCHAR(20)
    , IN p_protein_change VARCHAR(20)
    , IN p_gene_description VARCHAR(100)
    , IN p_location_chromo VARCHAR(2)
    , IN p_grch38_location VARCHAR(100)
)
COMMENT 'Insert into the gene_lookup table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the gene_lookup table.
        
		Modification History
		Date modified 		- Who did it 		- What was modified
		2020-12-09			Derrick Nagy		Initial Creation
	*/


	
	 INSERT INTO gene_lookup (
		gene_name
		, coding_variant
		, protein_change
		, gene_description
		, location_chromo
		, grch38_location

	) VALUES (
		p_gene_name
		, p_coding_variant
		, p_protein_change
		, p_gene_description
		, p_location_chromo
		, p_grch38_location
	)
	;

	SELECT 
		gene_name
		, coding_variant
		, protein_change
		, gene_description
		, location_chromo
		, grch38_location
	FROM
		gene_lookup
	WHERE p_gene_name = gene_name
	;
 	
END$$
DELIMITER ;

-- ******************************************************************

-- ******************************************************************
-- Insert sample and condition into the symptoms table

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS  sp_insert_samp_and_gene$$
CREATE PROCEDURE  sp_insert_samp_and_gene(
	IN p_sample_number CHAR(9)
	, IN p_coding_variant VARCHAR(20)
)
COMMENT 'Insert sample and gene_name into the gene_table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert the sample number and the symptom into the symptoms table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-09			Derrick Nagy		Initial Creation
	*/
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
	
	 INSERT INTO gene_table(
		sample_number
		, gene_name
		, coding_variant
		, date_check_in
		, user_check_in

	) VALUES (
		p_sample_number
		, (SELECT
			gene_name
			FROM gene_lookup
			WHERE coding_variant = p_coding_variant)
		, p_coding_variant
		, NOW()
		, SYSTEM_USER()
	)
	;

	SELECT 
		sample_number
		, gene_name
		, coding_variant

	FROM
		gene_table
		
	WHERE sample_number = p_sample_number
	;

END$$
DELIMITER ;

-- ******************************************************************

/*
--write the subquery
SELECT
	gene_name
FROM gene_lookup
WHERE coding_variant = 'c.532A>T.'
;
*/


/*
	FILE: procedures_update_SARS_CoV-2.sql
    DATE: 2020-12-09
    AUTHOR: Derrick Nagy
    DESCRIPTION:
		Write update procedures for the final project.
       
       Note:
        Not every field and every value has an update. 
        Choices were made based on how likely the data would change and 
        need to be updated, not based on a blanket "this data wasn't added 
        correctly and needs edited" basis. If the field could be left
        NULL, it will have an update procedure if it made sense for it.
        
*/

/**********************************************************************
	Make an update to the re_sample field in the check_in table.
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_update_check_in_re_sample$$
CREATE PROCEDURE sp_update_check_in_re_sample(
	IN p_check_in_sample VARCHAR(9)
    , IN p_check_in_set_value ENUM('Y','N')
)
COMMENT 'Make an update to the re_sample field in the check_in table.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_update_SARS_CoV-2.sql
		DESCRIPTION:
			Make an update to the need_re_sample column.
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
    
	DECLARE sample_count TINYINT DEFAULT 0;

	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_check_in_sample);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM check_in 
    WHERE sample_number = p_check_in_sample
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;
   
   

		UPDATE check_in
		SET need_re_sample = p_check_in_set_value
		WHERE sample_number = p_check_in_sample
		;

		SELECT
			sample_number
			, need_re_sample
		FROM check_in
		WHERE sample_number = p_check_in_sample
		;
        


END$$
DELIMITER ;

/**********************************************************************
	Make an update to the subject_contacted field in the check_in table.
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_update_check_in_subject_contacted$$
CREATE PROCEDURE sp_update_check_in_subject_contacted(
	IN p_check_in_sample VARCHAR(9)
    , IN p_check_in_set_value ENUM('Y','N')
)
COMMENT 'Make an update to the subject_contacted field in the check_in table.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_update_SARS_CoV-2.sql
		DESCRIPTION:
			Make an update to the need_re_sample column.
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
    
	DECLARE sample_count TINYINT DEFAULT 0;

	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_check_in_sample);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM check_in 
    WHERE sample_number = p_check_in_sample
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;

	UPDATE check_in
	SET subject_contacted = p_check_in_set_value
	WHERE sample_number = p_check_in_sample
	;

	SELECT
		sample_number
		, subject_contacted
	FROM check_in
	WHERE sample_number = p_check_in_sample
	;

END$$
DELIMITER ;

/**********************************************************************
	Make an update to the gel_image field in the qc table.
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_update_qc_gel_image$$
CREATE PROCEDURE sp_update_qc_gel_image(
	IN p_sample_number VARCHAR(9)
    , IN p_qc_set_value VARCHAR(100)
)
COMMENT 'Make an update to the gel_image field in the qc table.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_update_SARS_CoV-2.sql
		DESCRIPTION:
			Make an update to the gel_image column.
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
    
        
	DECLARE sample_count TINYINT DEFAULT 0;

	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM qc 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;

	UPDATE qc
	SET gel_image = p_qc_set_value
	WHERE sample_number = p_sample_number
	;

	SELECT
		sample_number
		, gel_image
	FROM qc
	WHERE sample_number = p_sample_number
	;

END$$
DELIMITER ;


/**********************************************************************
	Make an update to a record in the storage_box table
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_update_storage_box$$
CREATE PROCEDURE sp_update_storage_box(
	IN p_sample_number VARCHAR(9)
	, IN p_sample_stored VARCHAR(100)
	, IN p_box_label VARCHAR(100)
	, IN p_box_coordinates VARCHAR(100)
)
COMMENT 'Make an update to a record in the storage_box table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_update_SARS_CoV-2.sql
		DESCRIPTION:
			Make an update to a record in the storage_box table
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/

	    
	DECLARE sample_count TINYINT DEFAULT 0;
 
 	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM storage_box 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;
		
	UPDATE storage_box
	SET sample_stored = p_sample_stored
		, box_label = p_box_label
		, box_coordinates = p_box_coordinates
	WHERE sample_number = p_sample_number
	;

	SELECT  
		sample_number
		, sample_stored
		, box_label
		, box_coordinates
	FROM storage_box
	WHERE sample_number = p_sample_number
	;

END$$
DELIMITER ;


/**********************************************************************
	Make an update to the days_hosp field in the subject_demographics table
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_update_sub_demo_days_hosp$$
CREATE PROCEDURE sp_update_sub_demo_days_hosp(
	IN p_sample_number VARCHAR(9)
	, IN p_days_hosp SMALLINT UNSIGNED
)
COMMENT 'Make an update to the days_hosp field in the subject_demographics table.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_update_SARS_CoV-2.sql
		DESCRIPTION:
			Make an update to the days_hosp field in the subject_demographics table.
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
 
     
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM subject_demographics 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;
		
	 
	UPDATE subject_demographics 
	SET days_hosp = p_days_hosp 
	WHERE sample_number = p_sample_number
	;

	SELECT
		sample_number
		, gender
		, age
		, covid_test
		, days_hosp
		, cbc
		, treat1
	FROM subject_demographics
	WHERE sample_number = p_sample_number
	;


END$$
DELIMITER ;

/*
SELECT *
FROM subject_demographics
;
*/

/**********************************************************************
	Make an update to the treat1 field in the subject_demographics table
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_update_sub_demo_treat1$$
CREATE PROCEDURE sp_update_sub_demo_treat1(
	IN p_sample_number VARCHAR(9)
	, IN p_treat1 VARCHAR(100)
)
COMMENT 'Make an update to the treat1 field in the subject_demographics table.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_update_SARS_CoV-2.sql
		DESCRIPTION:
			Make an update to the treat1 field in the subject_demographics table.
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
    
        
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM subject_demographics 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;
    
		
	UPDATE subject_demographics 
	SET treat1 = p_treat1
	WHERE sample_number = p_sample_number
	;

	SELECT
		sample_number
		, gender
		, age
		, covid_test
		, days_hosp
		, cbc
		, treat1
	FROM subject_demographics
	WHERE sample_number = p_sample_number
	;


END$$
DELIMITER ;


/*
	FILE: procedures_delete_SARS_CoV-2.sql
    DATE: 2020-12-10
    AUTHOR: Derrick Nagy
    DESCRIPTION:
		Write delete procedures for the final project.
        The most important part is the where clause.
        
        NOTE:
        Looking at HIPPA requirements, it seems like deleting information seems to 
        be the correct route to take instead of an inactive table.
        
*/

/**********************************************************************
	Delete a check_in record
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_check_in$$
CREATE PROCEDURE sp_delete_check_in(
	IN p_sample_number CHAR(9)
)
COMMENT 'Make an update to a single cell in a row.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete the record for the check_in table. The most important part is the where clause.
            
            This needs some error handling because the record table is relied on by all the other tables.
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
    

    
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM check_in 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;
	
	DELETE FROM check_in
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the check_in table.') AS 'Message'
	;
	
END$$
DELIMITER ;


/**********************************************************************
	Delete an extraction record
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_extraction$$
CREATE PROCEDURE sp_delete_extraction(
	IN p_sample_number CHAR(9)
)
COMMENT 'Delete an extraction record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete an extraction record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
	
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);     
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM extraction 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;

	DELETE FROM extraction
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the extraction table.') AS 'Message'
	;
	
END$$
DELIMITER ;

/**********************************************************************
	Delete a qc record
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_qc$$
CREATE PROCEDURE sp_delete_qc(
	IN p_sample_number CHAR(9)
)
COMMENT 'Delete a qc record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete qc record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
	
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM qc 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;

	DELETE FROM qc
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the qc table.') AS 'Message'
	;
	
END$$
DELIMITER ;

/**********************************************************************
	Delete a storage_box record
***********************************************************************/


USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_storage_box$$
CREATE PROCEDURE sp_delete_storage_box(
	IN p_sample_number CHAR(9)
)
COMMENT 'Delete a storage_box record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete storage_box record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM storage_box 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;	


	DELETE FROM storage_box
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the storage_box table.') AS 'Message'
	;
	
END$$
DELIMITER ;

/**********************************************************************
	Delete a sequencing record
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_sequencing$$
CREATE PROCEDURE sp_delete_sequencing(
	IN p_sample_number CHAR(9)
)
COMMENT 'Delete a sequencing record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete sequencing record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
	
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM sequencing 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;	

	DELETE FROM sequencing
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the sequencing table.') AS 'Message'
	;
	
END$$
DELIMITER ;

/**********************************************************************
	Delete a subject_demographics record
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_subject_demographics$$
CREATE PROCEDURE sp_delete_subject_demographics(
	IN p_sample_number CHAR(9)
)
COMMENT 'Delete a subject_demographics record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete subject_demographics record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
    
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM subject_demographics 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;	
	
	DELETE FROM subject_demographics
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the subject_demographics table.') AS 'Message'
	;
	
END$$
DELIMITER ;

/**********************************************************************
	Delete a symptoms_lookup record
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_symptoms_lookup$$
CREATE PROCEDURE sp_delete_symptoms_lookup(
	IN p_symp_code CHAR(5)
)
COMMENT 'Delete a symptoms_lookup record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete symptoms_lookup record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
	
	DECLARE sample_count TINYINT DEFAULT 0;
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM symptoms_lookup 
	WHERE symp_code = p_symp_code
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching symptom record found. It does not exist possibly.';
	END IF;	

	DELETE FROM symptoms_lookup
	WHERE symp_code = p_symp_code
	;

	SELECT CONCAT('The symptom with the code "',p_symp_code,'" was removed from the symptoms_lookup table.') AS 'Message'
	;
	
END$$
DELIMITER ;

/**********************************************************************
	Delete a conditions_lookup record
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_conditions_lookup$$
CREATE PROCEDURE sp_delete_conditions_lookup(
	IN p_cond_code CHAR(6)
)
COMMENT 'Delete a conditions_lookup record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete conditions_lookup record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
    
	DECLARE sample_count TINYINT DEFAULT 0;
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM conditions_lookup 
	WHERE cond_code = p_cond_code
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching condition record found. It does not exist possibly.';
	END IF;	


	DELETE FROM conditions_lookup
	WHERE cond_code = p_cond_code
	;

	SELECT CONCAT('The symptom with the code "',p_cond_code,'" was removed from the conditions_lookup table.') AS 'Message'
	;
	
END$$
DELIMITER ;

/**********************************************************************
	Delete a conditions record
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_conditions$$
CREATE PROCEDURE sp_delete_conditions(
	IN p_sample_number CHAR(9)
)
COMMENT 'Delete a conditions record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete conditions record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
	
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM conditions 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;	

	DELETE FROM conditions
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the conditions table.') AS 'Message'
	;
	
END$$
DELIMITER ;

/**********************************************************************
	Delete a symptoms record
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_symptoms$$
CREATE PROCEDURE sp_delete_symptoms(
	IN p_sample_number CHAR(9)
)
COMMENT 'Delete a symptoms record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete symptoms record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number); 
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM symptoms 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;	

	DELETE FROM symptoms
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the symptoms table.') AS 'Message'
	;
	
END$$
DELIMITER ;


/**********************************************************************
	Delete a gene_table record
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_gene_table_record$$
CREATE PROCEDURE sp_delete_gene_table_record(
	IN p_sample_number CHAR(9)
)
COMMENT 'Delete a gene_table record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete gene_table record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
 	DECLARE sample_count TINYINT DEFAULT 0;

	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
   
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM gene_table 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;	
 
	DELETE FROM gene_table
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the gene_table table.') AS 'Message'
	;
	
END$$
DELIMITER ;

/**********************************************************************
	Delete a gene_table record
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_gene_table_variant$$
CREATE PROCEDURE sp_delete_gene_table_variant(
	IN p_sample_number CHAR(9)
    , IN p_coding_variant VARCHAR(30)
    
)
COMMENT 'Delete a gene_table record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete gene_table variant from a record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-13			Derrick Nagy		Initial Creation
		
	*/
    
	DECLARE sample_count TINYINT DEFAULT 0;
    DECLARE variant_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);  
/*    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM gene_table 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;
    
	
    SELECT 
		COUNT(*)
	INTO variant_count
    FROM gene_table 
    WHERE coding_variant = p_coding_variant
    ;
    
    IF variant_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching variant found. Not associated with this sample possibly.';
	END IF;
 */      
    
    
    
	DELETE FROM gene_table
	WHERE sample_number = p_sample_number
		AND coding_variant = p_coding_variant
	;

	SELECT CONCAT('Coding variant ', p_coding_variant, ' associated with sample ',p_sample_number,' was removed from the gene_table table.') AS 'Message'
	;
	
END$$
DELIMITER ;



/**********************************************************************
	Delete a gene_lookup record by variant
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_gene_lookup_variant$$
CREATE PROCEDURE sp_delete_gene_lookup_variant(
	IN p_coding_variant VARCHAR(30)
)
COMMENT 'Delete a gene_lookup coding_variant record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete gene_lookup record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/

	DELETE FROM gene_lookup
	WHERE coding_variant = p_coding_variant
	;

	SELECT CONCAT('The variant with the code "', p_coding_variant ,'" was removed from the gene_lookup table.') AS 'Message'
	;
	
END$$
DELIMITER ;


/**********************************************************************
	Delete a gene_table record
***********************************************************************/

USE sars_cov_2;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_change_log$$
CREATE PROCEDURE sp_delete_change_log(
	IN p_sample_number CHAR(9)
)
COMMENT 'Delete all records in change log associated with sample number.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete all records in change log associated with sample number. This is if a patient withdrawls
            from the study. This is the last step for completely removing the record.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-13			Derrick Nagy		Initial Creation
		
	*/
 	DECLARE sample_count TINYINT DEFAULT 0;

	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
   
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM change_log 
    WHERE log_sample = p_sample_number
    ;
    
    IF sample_count = 0 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found.';
	END IF;	
 
	DELETE FROM change_log
	WHERE log_sample = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the change_log table.') AS 'Message'
	;
	
END$$
DELIMITER ;




/*
	FILE: create_views_SARS_CoV-2.sql
    AUTHOR: Derrick Nagy
    DATE: 2020-12-13
    
    COMMENTS:
    The views for the SARS_CoV-2 database

*/

/*
	Find all the information about the actual sample itself, see if there is missing information basically.
*/

USE sars_cov_2;

DROP VIEW IF EXISTS v_sample_information;
CREATE VIEW v_sample_information AS
	SELECT
		check_in.sample_number
		, check_in.date_sample_received
		, check_in.sample_condition_notes
		, qc.vol_of_hydration_buffer
		, qc.amt_of_dna
		, qc.frag_gel
		, qc.date_of_gel
		, qc.lane_number
		, qc.gel_image  
		, storage_box.sample_stored
		, storage_box.box_label
		, storage_box.box_coordinates
	FROM check_in
		RIGHT OUTER JOIN qc
			ON check_in.sample_number = qc.sample_number
		RIGHT OUTER JOIN storage_box
			ON check_in.sample_number = storage_box.sample_number
	ORDER BY check_in.sample_number
;

SELECT * FROM v_sample_information;


/*
Result set based on severity
	- get the records with severe redactions from the subject_demographics table
    - join that with check_in by sample_number
    - join those sample_number to the gene_table
    - join those sample_numbers to the descriptive information about the coding_variants
*/

/*
	Step 1: select sample numbers and variants that have the same coding variant
*/
DROP VIEW IF EXISTS v_variants_in_common;
CREATE VIEW v_variants_in_common AS 
	SELECT
		t1.sample_number
		, t1.gene_name
		, t1.coding_variant
	FROM gene_table t1
	INNER JOIN gene_table t2
		ON t1.coding_variant = t2.coding_variant
		AND t1.sample_number <> t2.sample_number
	ORDER BY coding_variant DESC
;

SELECT * FROM v_variants_in_common;
-- ten records for my dumby data
SELECT DISTINCT coding_variant FROM v_variants_in_common;
-- 5 coding variants shared

/*
	Step 2: Join the 'severity' from the demographics table to the gene table base on 'severe'
*/

DROP VIEW IF EXISTS v_shared_variants_severe_outcome;
CREATE VIEW v_shared_variants_severe_outcome AS
	SELECT 
		check_in.sample_number
		, subject_demographics.severity
		, gene_table.gene_name
		, gene_table.coding_variant

	FROM check_in
	INNER JOIN subject_demographics
		ON check_in.sample_number = subject_demographics.sample_number
	INNER JOIN gene_table
		ON subject_demographics.sample_number = gene_table.sample_number
	WHERE subject_demographics.severity = 'severe'
		AND gene_table.coding_variant IN (SELECT coding_variant FROM v_variants_in_common)
	ORDER BY coding_variant DESC
;

SELECT * 
FROM v_shared_variants_severe_outcome
;

SELECT * 
FROM v_shared_variants_severe_outcome v1
INNER JOIN v_shared_variants_severe_outcome v2
		ON v1.coding_variant = v2.coding_variant
		AND v1.sample_number <> v2.sample_number
ORDER BY 
	v1.coding_variant DESC
	, v1.sample_number
;



/*
	Step 3: Add some description by joining the shared variants that had severe outcomes with the gene lookup table
*/

DROP VIEW IF EXISTS v_shared_variants_severe_outcome_description;
CREATE VIEW v_shared_variants_severe_outcome_description AS
	SELECT 
		v_shared_variants_severe_outcome.sample_number
		, v_shared_variants_severe_outcome.severity
		, v_shared_variants_severe_outcome.gene_name
		, v_shared_variants_severe_outcome.coding_variant
		, gene_lookup.protein_change
		, gene_lookup.gene_description
		, gene_lookup. location_chromo
		, gene_lookup.grch38_location
	FROM v_shared_variants_severe_outcome
	INNER JOIN gene_lookup
		ON v_shared_variants_severe_outcome.coding_variant = gene_lookup.coding_variant
	ORDER BY coding_variant DESC
	;

SELECT * FROM v_shared_variants_severe_outcome_description;



-- removes the sample that shares a variant with someone that didn't have a severe outcome
SELECT * 
FROM v_shared_variants_severe_outcome_description v1
INNER JOIN v_shared_variants_severe_outcome_description v2
		ON v1.coding_variant = v2.coding_variant
		AND v1.sample_number <> v2.sample_number
ORDER BY 
	v1.coding_variant DESC
	, v1.sample_number
;



/*
	change_log
	Only show logs from the last week
*/

DROP VIEW IF EXISTS v_logs_past_week;
CREATE VIEW v_logs_past_week AS
	SELECT 
		log_date
		, log_user
		, log_table
		, log_change_type
		, log_sample
		, log_change
	FROM change_log
	WHERE log_date > DATE_SUB(NOW(),INTERVAL 1 WEEK)
;

SELECT * FROM v_logs_past_week;

-- SELECT DATE_SUB(NOW(),INTERVAL 1 WEEK);
-- 20 total


/*
	Views that match the spreadsheet from Elizabeth
*/

DROP VIEW IF EXISTS v_check_in;
CREATE VIEW v_check_in AS
	SELECT
		sars_cov_2.check_in.sample_number
		, sars_cov_2.check_in.sample_type
		, sars_cov_2.check_in.date_sample_received
		, sars_cov_2.check_in.sample_condition_notes
		, sars_cov_2.check_in.need_re_sample
		, sars_cov_2.check_in.subject_contacted
	FROM sars_cov_2.check_in
	ORDER BY sample_number
;
















