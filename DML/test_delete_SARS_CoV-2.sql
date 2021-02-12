/*

	FILE: test_delete_SARS_CoV-2.sql
    DATE: 2020-12-10
    AUTHOR: Derrick Nagy
    DESCRIPTION:
		Procedure calls for deleting records from the sars_cov-2 database.
        The most important part is the where clause. 

*/

/* 
	Delete from the extraction table
*/
USE sars_cov_2;

/*
SELECT *
FROM extraction
WHERE sample_number = 'CV2000003'
;

DELETE FROM extraction
WHERE sample_number = 'CV2000003'
;
*/

CALL sp_delete_extraction(
	'CV2000003' -- p_sample_number
)
;

CALL sp_insert_extraction(
	'CV2000003' -- sample_number
    , '2020-08-30'-- date_of_extraction
    , 'ESP' -- extracted_by
)
;

/* 
	delete record from qc
*/

CALL sp_delete_qc(
	'CV2000003' -- p_sample_number
);

CALL sp_insert_qc(
	'CV2000003'-- sample_number
	, 22 -- concentration
	, 800 -- vol_of_hydration_buffer
	, 17.6 -- amt_of_dna
	, 'N' -- frag_gel
	, NULL -- date_of_gel
	, NULL-- lane_number
	, 'N/A'-- gel_imag
);

/* 
	Delete a record from the storage_box
*/

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

/* 
	Delete a record from sequencing
*/

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

/*
	Delete a record from subject_demographics
*/

CALL sp_delete_subject_demographics(
	'CV2000003' -- p_sample_number
);

CALL sp_subject_demographics(
	'CV2000003'-- sample_number
	, 'F'-- gender
	, 8 -- age
	, 'A ' -- covid_test
	, 0 -- days_hosp
	, 4.3 -- cbc
	, 'nothing'-- treat1
	, 'asymptomatic'

);

/* 
	Delete a record from symptoms_lookup
*/
/*
SELECT *
FROM symptoms_lookup
;
*/
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


/*
	Delete a record from conditions_lookup
*/


CALL sp_delete_conditions(
	'CV2000003' -- p_sample_number
);

CALL sp_delete_conditions(
	'CV2000002' -- p_sample_number
);

CALL sp_delete_conditions_lookup (
	'cond05' -- p_sample_number
);


CALL  sp_conditions_lookup(
	'cond05' -- code
    , 'Diabetes' -- cond_descrip
);

CALL sp_insert_samp_and_cond(
	'CV2000003' -- insert sample_number
	, 'cond05' -- insert cond_code
)
;

CALL sp_insert_samp_and_cond(
	'CV2000002' -- insert sample_number
	, 'cond05' -- insert cond_code
)
;


/* 
	Delete a record from conditions 
*/



/* 
	Delete a record from symptoms 
*/

CALL sp_delete_symptoms(
	'CV2000003' -- p_sample_number
);

CALL sp_insert_samp_and_symp(
	'CV2000003' -- insert sample_number
	, 'sym20' -- insert sym_code
    , 'P'
)
;


/* 
	Delete a record from gene_table.
	
    Note:
    This needs to be run before deleting from the lookup table
*/

-- remove all variants that are associated with that record
CALL sp_delete_gene_table_record(
	'CV2000002' -- p_sample_number
);

-- put them back
CALL sp_insert_samp_and_gene(
	'CV2000002' -- insert sample_number
    , 'c.347>A.' -- gene_name
)
;

CALL sp_insert_samp_and_gene(
	'CV2000002' -- insert sample_number
    , 'c.266G>C' -- gene_name
)
;

CALL sp_insert_samp_and_gene(
	'CV2000002' -- insert sample_number
    , 'c.266G>A.' -- gene_name
)
;

CALL sp_insert_samp_and_gene(
	'CV2000002' -- insert sample_number
    , 'c.656>G.' -- gene_name
)
;


/* 
	Test for sp_delete_gene_table_variant
*/

-- delete the only the variant associated with the record, and not the whole record
CALL sp_delete_gene_table_variant (
	'CV2000002' -- sample_number
	, 'c.266G>A.' -- coding variant
);


-- put it back
CALL sp_insert_samp_and_gene(
	'CV2000002' -- insert sample_number
    , 'c.266G>A.' -- gene_name
)
;




/* 
	Delete a record from gene_lookup
*/


/*
NOTE:
	I just dropped the whole table to make this work for testing. Probably lazy...  

-- remove the coding_variant from the lookup table
CALL sp_delete_gene_lookup_variant(
	'c.266G>A.' -- coding_variant
);

-- put the coding_variant back into lookup table
CALL sp_gene_lookup(
	'TP53' -- gene_name
    , 'c.266G>C' -- coding_variant
    , 'R [CGG] > P [CCG]'-- protien_change
    , 'tumor protein p53' -- gene_description
    , 17 -- location_chromo
    , '7668421..7687490, complement' -- grch38_location
);


SELECT *
FROM gene_table
WHERE coding_variant = 'c.266G>A.'
;

*/

/* Delete all records of a sample from change log 
	A kind of special thing to do so I don't want to run it on my final turn in.
    But it works.
*/
/*
CALL sp_delete_change_log (
	'CV2000002'
);

SELECT *
FROM change_log
;
*/





