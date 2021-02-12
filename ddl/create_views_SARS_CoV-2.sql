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
















