
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