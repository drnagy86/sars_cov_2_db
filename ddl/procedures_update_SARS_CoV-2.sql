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


