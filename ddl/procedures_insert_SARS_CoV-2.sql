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


