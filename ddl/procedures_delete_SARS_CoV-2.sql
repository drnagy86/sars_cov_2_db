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




