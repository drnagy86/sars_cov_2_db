/*

	FILE: test_insert_SARS_CoV-2.sql
    DATE: 2020-12-08
    AUTHOR: Derrick Nagy
    DESCRIPTION:
		Procedure calls for inserting records into the sars_cov-2 database .

*/

/*
	insert into the check_in table
*/

USE sars_cov_2;

CALL sp_insert_check_in(
	'CV2000000' -- sample_number
	, 'saliva'-- sample_type 
	, '2020-07-28' -- date_sample_recieved
	, 'Sample Dark Brown in Color' -- sample_condition_notes
	, 'N' -- need_re_sample
	, 'Y' -- subject_contacted
);

CALL sp_insert_check_in(
	'CV2000001' -- sample_number
	, 'saliva'-- sample_type 
	, '2020-07-28' -- date_sample_recieved
	, '' -- sample_condition_notes
	, 'N' -- need_re_sample
	, 'Y' -- subject_contacted
);

CALL sp_insert_check_in(
	'CV2000002' -- sample_number
	, 'saliva'-- sample_type 
	, '2020-08-28' -- date_sample_recieved
	, '' -- sample_condition_notes
	, 'N' -- need_re_sample
	, 'Y' -- subject_contacted
);

CALL sp_insert_check_in(
	'CV2000003' -- sample_number
	, 'saliva'-- sample_type 
	, '2020-08-30' -- date_sample_recieved
	, 'Small ammount' -- sample_condition_notes
	, 'N' -- need_re_sample
	, 'Y' -- subject_contacted
);

CALL sp_insert_check_in(
	'CV2000004' -- sample_number
	, 'saliva'-- sample_type 
	, '2020-08-30' -- date_sample_recieved
	, 'Sample Red in color' -- sample_condition_notes
	, 'N' -- need_re_sample
	, 'Y' -- subject_contacted
);

CALL sp_insert_check_in(
	'CV2000005' -- sample_number
	, 'blood'-- sample_type 
	, '2020-07-28' -- date_sample_recieved
	, '' -- sample_condition_notes
	, 'N' -- need_re_sample
	, 'N' -- subject_contacted
);

CALL sp_insert_check_in(
	'CV2000006' -- sample_number
	, 'blood'-- sample_type 
	, '2020-12-03' -- date_sample_recieved
	, '' -- sample_condition_notes
	, 'Y' -- need_re_sample
	, 'N' -- subject_contacted
);

CALL sp_insert_check_in(
	'CV2000007' -- sample_number
	, 'blood'-- sample_type 
	, '2020-12-08' -- date_sample_recieved
	, '' -- sample_condition_notes
	, 'N' -- need_re_sample
	, 'N' -- subject_contacted
);

/*
SELECT *
FROM check_in
;
*/

/*
	insert into the extraction table
*/

CALL sp_insert_extraction(
	'CV2000000' -- sample_number
    , '2020-07-28'-- date_of_extraction
    , 'ESP' -- extracted_by
)
;

CALL sp_insert_extraction(
	'CV2000001' -- sample_number
    , '2020-07-27'-- date_of_extraction
    , 'ESP' -- extracted_by
)
;

CALL sp_insert_extraction(
	'CV2000002' -- sample_number
    , '2020-08-27'-- date_of_extraction
    , 'ESP' -- extracted_by
)
;

CALL sp_insert_extraction(
	'CV2000003' -- sample_number
    , '2020-08-30'-- date_of_extraction
    , 'ESP' -- extracted_by
)
;
CALL sp_insert_extraction(
	'CV2000004' -- sample_number
    , '2020-08-30'-- date_of_extraction
    , 'ESP' -- extracted_by
)
;

/*
	insert into qc table
*/

CALL sp_insert_qc(
	'CV2000000'-- sample_number
	, 688 -- concentration
	, 800 -- vol_of_hydration_buffer
	, 550.4 -- amt_of_dna
	, 'N' -- frag_gel
	, '2020-06-15' -- date_of_gel
	, 33 -- lane_number
	, 'N/A'-- gel_imag
);
CALL sp_insert_qc(
	'CV2000001'-- sample_number
	, 178.4 -- concentration
	, 800 -- vol_of_hydration_buffer
	, 142.72 -- amt_of_dna
	, 'N' -- frag_gel
	, '2020-05-13' -- date_of_gel
	, 2 -- lane_number
	, 'N/A'-- gel_imag
);
CALL sp_insert_qc(
	'CV2000002'-- sample_number
	, 23.2 -- concentration
	, 800 -- vol_of_hydration_buffer
	, 18.56 -- amt_of_dna
	, 'N' -- frag_gel
	, '2020-04-13' -- date_of_gel
	, 1 -- lane_number
	, 'N/A'-- gel_imag
);
CALL sp_insert_qc(
	'CV2000003'-- sample_number
	, 22 -- concentration
	, 800 -- vol_of_hydration_buffer
	, 17.6 -- amt_of_dna
	, 'N' -- frag_gel
	, '2020-08-15' -- date_of_gel
	, 1  -- lane_number
	, 'N/A'-- gel_imag
);
CALL sp_insert_qc(
	'CV2000004'-- sample_number
	, 22 -- concentration
	, 800 -- vol_of_hydration_buffer
	, 17.6 -- amt_of_dna
	, 'N' -- frag_gel
	, '2020-08-15' -- date_of_gel
	, 2 -- lane_number
	, 'N/A'-- gel_imag
);

/*
SELECT *
FROM qc
;
*/

/*
	insert into the storage_box table
*/

CALL sp_storage_box(
	'CV2000000' -- sample_number
    , 'fridge 1'-- sample_stored
    , 'A' -- box_label
	, '1' -- box_coordinates
)
;

CALL sp_storage_box(
	'CV2000001' -- sample_number
    , 'fridge 1'-- sample_stored
    , 'A' -- box_label
	, '2' -- box_coordinates
)
;

CALL sp_storage_box(
	'CV2000002' -- sample_number
    , 'fridge 2'-- sample_stored
    , 'C' -- box_label
	, '2' -- box_coordinates
)
;

CALL sp_storage_box(
	'CV2000003' -- sample_number
    , 'fridge 1'-- sample_stored
    , 'C' -- box_label
	, '3' -- box_coordinates
)
;
CALL sp_storage_box(
	'CV2000004' -- sample_number
    , 'fridge 2'-- sample_stored
    , 'C' -- box_label
	, '1' -- box_coordinates
)
;

/*
SELECT *
FROM storage_box
;
*/
/****************************************************************/

CALL sp_sequencing(
	'CV2000000'-- sample_number
	, 'Giant Evil Corporation 5' -- sequencing_company
	, 56 -- sequence_batch
	, 550.4 -- amt_of_dna_sent?? should this match the value in the extraction table? or like half or somthing
	, '2020-07-28' -- date_mailed
	, '2020-08-24' -- date_returned
	, 'abc1.fastq' -- fastq_file_name
	, 'abc1.qd' -- quality_date_filename
	, 'abc1.bam'-- bam_file_name
	, 'abc1.vcf'-- vcf_file_name
	, 'area51' -- sequencing_stored
);

CALL sp_sequencing(
	'CV2000001'-- sample_number
	, 'Giant Evil Corporation 3' -- sequencing_company
	, 30 -- sequence_batch
	, 142.72 -- amt_of_dna_sent?? should this match the value in the extraction table? or like half or somthing
	, '2020-07-28' -- date_mailed
	, '2020-08-24' -- date_returned
	, 'abc2.fastq' -- fastq_file_name
	, 'abc2.qd' -- quality_date_filename
	, 'abc2.bam'-- bam_file_name
	, 'abc2.vcf'-- vcf_file_name
	, 'area51' -- sequencing_stored
);

CALL sp_sequencing(
	'CV2000002'-- sample_number
	, 'Giant Evil Corporation 3' -- sequencing_company
	, 30 -- sequence_batch
	, 18.56 -- amt_of_dna_sent?? should this match the value in the extraction table? or like half or somthing
	, '2020-08-28' -- date_mailed
	, '2020-08-29' -- date_returned
	, 'abc3.fastq' -- fastq_file_name
	, 'abc3.qd' -- quality_date_filename
	, 'abc3.bam'-- bam_file_name
	, 'abc3.vcf'-- vcf_file_name
	, 'area52' -- sequencing_stored
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

CALL sp_sequencing(
	'CV2000004'-- sample_number
	, 'Lab Corp' -- sequencing_company
	, 21 -- sequence_batch
	, 17.6 -- amt_of_dna_sent?? should this match the value in the extraction table? or like half or somthing
	, '2020-08-30' -- date_mailed
	, '2020-09-06' -- date_returned
	, 'abc5.fastq' -- fastq_file_name
	, 'abc5.qd' -- quality_date_filename
	, 'abc5.bam'-- bam_file_name
	, 'abc5.vcf'-- vcf_file_name
	, 'lab fridge' -- sequencing_stored
);
/*
SELECT *
FROM sequencing
;
*/
/*
	insert subject_demographics
*/

CALL sp_subject_demographics(
	'CV2000000'-- sample_number
	, 'M'-- gender
	, 26 -- age
	, 'S' -- covid_test
	, 7 -- days_hosp
	, 4.3 -- cbc
	, 'remdesivir'-- treat1
    , 'severe'-- severity

);

CALL sp_subject_demographics(
	'CV2000001'-- sample_number
	, 'F'-- gender
	, 68 -- age
	, 'S' -- covid_test
	, 10 -- days_hosp
	, 3.1 -- cbc
	, 'remdesivir'-- treat1
    , 'severe' -- severity
);

CALL sp_subject_demographics(
	'CV2000002'-- sample_number
	, 'F'-- gender
	, 78 -- age
	, 'P ' -- covid_test
	, 0 -- days_hosp
	, 4.6 -- cbc
	, 'bed rest'-- treat1
    , 'symptomatic' -- severity
);

CALL sp_subject_demographics(
	'CV2000003'-- sample_number
	, 'F'-- gender
	, 8 -- age
	, 'A ' -- covid_test
	, 0 -- days_hosp
	, 4.3 -- cbc
	, 'nothing'-- treat1
    , 'asymptomatic'-- severity
);

CALL sp_subject_demographics(
	'CV2000004'-- sample_number
	, 'M'-- gender
	, 34 -- age
	, 'A ' -- covid_test
	, 14 -- days_hosp
	, 3.1 -- cbc
	, 'ventilator'-- treat1
    , 'severe' -- severity
);

SELECT *
FROM subject_demographics
;

/*
	call  sp_symptoms_lookup for testing
*/

CALL  sp_symptoms_lookup(
	'sym01' -- symp_code
	, 'Abnormal chest x-ray' -- symp_descrip
);


/*
	There is a procedure to add individual symptoms
	, but the following code adds all of them at once.
    
    Added the first one to test the procedure
*/


 INSERT INTO symptoms_lookup (
	symp_code
	, symp_descrip
    
) VALUES (
	'sym02' -- code
    , 'Abnormal CT' -- symp_descriptip
),
(
	'sym03' -- code
    , 'Acute kidney injury' -- symp_descriptip
),
(
	'sym04' -- code
    , 'ARDS' -- symp_descriptip
),
(
	'sym05' -- code
    , 'Cardiac involvement' -- symp_descriptip
),
(
	'sym06' -- code
    , 'Chills' -- symp_descriptip
),
(
	'sym07' -- code
    , 'Clotting' -- symp_descriptip
),
(
	'sym08' -- code
    , 'Conjunctival congestion' -- symp_descriptip
),
(
	'sym09' -- code
    , 'Diarrhea' -- symp_descriptip
),
(
	'sym10' -- code
    , 'Dry cough' -- symp_descriptip
),
(
	'sym11' -- code
    , 'Enanthem' -- symp_descriptip
),
(
	'sym12' -- code
    , 'Fatigue' -- symp_descriptip
),
(
	'sym13' -- code
    , 'Fever' -- symp_descriptip
),
(
	'sym14' -- code
    , 'Headache' -- symp_descriptip
),
(
	'sym15' -- code
    , 'Hemoptysis' -- symp_descriptip
),
(
	'sym16' -- code
    , 'Loss of taste/smell' -- symp_descriptip
),
(
	'sym17' -- code
    , 'Multiple organ failure' -- symp_descriptip
),
(
	'sym18' -- code
    , 'Myalgia/arthralgia' -- symp_descriptip
),
(
	'sym19' -- code
    , 'Nasal congestion' -- symp_descriptip
),
(
	'sym20' -- code
    , 'Nausea/vomiting' -- symp_descriptip
),
(
	'sym21' -- code
    , 'Pneumonia' -- symp_descriptip
),
(
	'sym22' -- code
    , 'Productive cough' -- symp_descriptip
),
(
	'sym23' -- code
    , 'pulmonary edema' -- symp_descriptip
),
(
	'sym24' -- code
    , 'Rash' -- symp_descriptip
),
(
	'sym25' -- code
    , 'Shortness of breath' -- symp_descriptip
),
(
	'sym26' -- code
    , 'Sore throat' -- symp_descriptip
)
;

/* 26 total symptoms*/

/*
SELECT 
	symp_code
	, symp_descrip
FROM
    symptoms_lookup
;

SELECT *
FROM symptoms
;
*/

/*
	call  sp_conditions_lookup for testing
*/

CALL  sp_conditions_lookup(
	'cond01' -- cond_code
	, 'Cardiovascular (Heart) Disease' -- cond_descrip
);


/*
	There is a procedure to add individual conditions
	, but the following code adds all of them at once.
    
    Added the first one to test the procedure
*/


INSERT INTO conditions_lookup (
	cond_code
	, cond_descrip
    
) VALUES (
	'cond02' -- code
    , 'Cerbrovascular disease' -- cond_descrip
),
(
	'cond03' -- code
    , 'Acute kidney injury' -- cond_descrip
),
(
	'cond04' -- code
    , 'Chronic Kidney Disease' -- cond_descrip
),
(
	'cond05' -- code
    , 'Diabetes' -- cond_descrip
),
(
	'cond06' -- code
    , 'Hepatitus B Infection' -- cond_descrip
),
(
	'cond07' -- code
    , 'Hypertension' -- cond_descrip
),
(
	'cond08' -- code
    , 'Immunodeficiency' -- cond_descrip
),
(
	'cond09' -- code
    , 'Malignancy' -- cond_descrip
),
(
	'cond10' -- code
    , 'Overweight' -- cond_descrip
)
;

/*
SELECT *
FROM conditions_lookup
;
*/

/*
	Insert into gene_lookup table
*/

CALL sp_gene_lookup(
	'TP53' -- gene_name
    , 'c.266G>C' -- coding_variant
    , 'R [CGG] > P [CCG]'-- protien_change
    , 'tumor protein p53' -- gene_description
    , 17 -- location_chromo
    , '7668421..7687490, complement' -- grch38_location
);
	
CALL sp_gene_lookup(
	'EGFR' -- gene_name
    , 'c.347>A.' -- coding_variant
    , 't.658> G.'-- protien_change
    , 'epidermal growth factor receptor' -- gene_description
    , 7 -- location_chromo
    , '55019017..55211628' -- grch38_location
);

CALL sp_gene_lookup(
	'EGFR' -- gene_name
    , 'c.516>A.' -- coding_variant
    , 'p.66> T.'-- protien_change
    , 'epidermal growth factor receptor' -- gene_description
    , 7 -- location_chromo
    , '55019017..55211628' -- grch38_location
);

CALL sp_gene_lookup(
	'EGFR' -- gene_name
    , 'c.656>G.' -- coding_variant
    , 'c.54> A.'-- protien_change
    , 'epidermal growth factor receptor' -- gene_description
    , 7 -- location_chromo
    , '55019017..55211628' -- grch38_location
);

CALL sp_gene_lookup(
	'ESR1' -- gene_name
    , 'c.522A>G.' -- coding_variant
    , 'P.Arg63>Arg.'-- protien_change
    , 'estrogen receptor 1 [Homo sapiens (human)]' -- gene_description
    , 6 -- location_chromo
    , '151654148..152129619' -- grch38_location
);

CALL sp_gene_lookup(
	'MMP9' -- gene_name
    , 'c.743G>A' -- coding_variant
    , 'R [CGG] > P [CCG]'-- protien_change
    , 'matrix metallopeptidase 9' -- gene_description
    , 17 -- location_chromo
    , '7668421..7687490, complement' -- grch38_location
);

CALL sp_gene_lookup(
	'MMP9' -- gene_name
    , 'c.626G>T' -- coding_variant
    , 'R [CGG] > L [CTG]'-- protien_change
    , 'matrix metallopeptidase 9' -- gene_description
    , 17 -- location_chromo
    , '7668421..7687490, complement' -- grch38_location
);

CALL sp_gene_lookup(
	'HLA-DRB1' -- gene_name
    , 'c.532A>T.' -- coding_variant
    , 'P.Arg>Arg.'-- protien_change
    , 'major histocompatibility complex, class II, DR beta 1' -- gene_description
    , 6 -- location_chromo
    , '32578775..32589848, complement' -- grch38_location
);

CALL sp_gene_lookup(
	'HLA-DRB1' -- gene_name
    , 'c.266G>A.' -- coding_variant
    , 'R [CGG] > Q [CAG]'-- protien_change
    , 'major histocompatibility complex, class II, DR beta 1' -- gene_description
    , 6 -- location_chromo
    , '32578775..32589848, complement' -- grch38_location
);

CALL sp_gene_lookup(
	'AR' -- gene_name
    , 'c.522A>T.' -- coding_variant
    , 'P.Arg54>Arg.'-- protien_change
    , 'androgen receptor [Homo sapiens (human)]' -- gene_description
    , 'X' -- location_chromo
    , '67544021..67730619' -- grch38_location
);
/*
SELECT *
FROM gene_lookup
;
*/

/*
	Insert conditions table
*/


CALL sp_insert_samp_and_cond(
	'CV2000000' -- insert sample_number
	, 'cond01' -- insert cond_code
)
;

CALL sp_insert_samp_and_cond(
	'CV2000001' -- insert sample_number
	, 'cond02'-- insert cond_code
)
;

CALL sp_insert_samp_and_cond(
	'CV2000002' -- insert sample_number
	, 'cond05'-- insert cond_code
)
;

CALL sp_insert_samp_and_cond(
	'CV2000003' -- insert sample_number
	, 'cond05' -- insert cond_code
)
;
CALL sp_insert_samp_and_cond(
	'CV2000004' -- insert sample_number
	, 'cond08'-- insert cond_code
)
;

CALL sp_insert_samp_and_cond(
	'CV2000000' -- insert sample_number
	, 'cond02' -- insert cond_code
)
;

CALL sp_insert_samp_and_cond(
	'CV2000000' -- insert sample_number
	, 'cond06' -- insert cond_code
)
;
CALL sp_insert_samp_and_cond(
	'CV2000000' -- insert sample_number
	, 'cond08' -- insert cond_code
)
;


/* insert symptoms with the sample number*/
/*
CALL sp_insert_samp_and_symp(
	'CV2000000' -- insert sample_number
	, 'P'	--  'Abnormal chest x-ray'
	, 'P'	--  'Abnormal CT'
	, 'P'	--  'Acute kidney injury'
	, 'P'	--  'ARDS'
	, 'P'	--  'Cardiac involvement'
	, 'P'	--  'Chills'
	, 'P'	--  'Clotting'
	, 'P'	--  'Conjunctival congestion'
	, 'P'	--  'Diarrhea'
	, 'P'	--  'Dry cough'
	, 'P'	--  'Enanthem'
	, 'A'	--  'Fatigue'
	, 'A'	--  'Fever'
	, 'A'	--  'Headache'
	, 'A'	--  'Hemoptysis'
	, 'A'	--  'Loss of taste/smell'
	, 'A'	--  'Multiple organ failure'
	, 'A'	--  'Myalgia/arthralgia'
	, 'A'	--  'Nasal congestion'
	, 'A'	--  'Nausea/vomiting'
	, 'ND'	--  'Pneumonia'
	, 'ND'	--  'Productive cough'
	, 'ND'	--  'pulmonary edema'
	, 'ND'	--  'Rash'
	, 'ND'	--  'Shortness of breath'
	, 'ND'	--  'Sore throat'
)
;

CALL sp_insert_samp_and_symp(
	'CV2000001' -- insert sample_number
	, 'P'	--  'Abnormal chest x-ray'
	, 'P'	--  'Abnormal CT'
	, 'P'	--  'Acute kidney injury'
	, 'P'	--  'ARDS'
	, 'P'	--  'Cardiac involvement'
	, 'P'	--  'Chills'
	, 'P'	--  'Clotting'
	, 'P'	--  'Conjunctival congestion'
	, 'P'	--  'Diarrhea'
	, 'P'	--  'Dry cough'
	, 'P'	--  'Enanthem'
	, 'A'	--  'Fatigue'
	, 'A'	--  'Fever'
	, 'A'	--  'Headache'
	, 'A'	--  'Hemoptysis'
	, 'A'	--  'Loss of taste/smell'
	, 'A'	--  'Multiple organ failure'
	, 'A'	--  'Myalgia/arthralgia'
	, 'A'	--  'Nasal congestion'
	, 'A'	--  'Nausea/vomiting'
	, 'ND'	--  'Pneumonia'
	, 'ND'	--  'Productive cough'
	, 'ND'	--  'pulmonary edema'
	, 'ND'	--  'Rash'
	, 'ND'	--  'Shortness of breath'
	, 'ND'	--  'Sore throat'
)
;

CALL sp_insert_samp_and_symp(
	'CV2000002' -- insert sample_number
	, 'P'	--  'Abnormal chest x-ray'
	, 'P'	--  'Abnormal CT'
	, 'P'	--  'Acute kidney injury'
	, 'P'	--  'ARDS'
	, 'P'	--  'Cardiac involvement'
	, 'P'	--  'Chills'
	, 'P'	--  'Clotting'
	, 'P'	--  'Conjunctival congestion'
	, 'P'	--  'Diarrhea'
	, 'P'	--  'Dry cough'
	, 'P'	--  'Enanthem'
	, 'A'	--  'Fatigue'
	, 'A'	--  'Fever'
	, 'A'	--  'Headache'
	, 'A'	--  'Hemoptysis'
	, 'A'	--  'Loss of taste/smell'
	, 'A'	--  'Multiple organ failure'
	, 'A'	--  'Myalgia/arthralgia'
	, 'A'	--  'Nasal congestion'
	, 'A'	--  'Nausea/vomiting'
	, 'ND'	--  'Pneumonia'
	, 'ND'	--  'Productive cough'
	, 'ND'	--  'pulmonary edema'
	, 'ND'	--  'Rash'
	, 'ND'	--  'Shortness of breath'
	, 'ND'	--  'Sore throat'
)
;

CALL sp_insert_samp_and_symp(
	'CV2000003' -- insert sample_number
	, 'P'	--  'Abnormal chest x-ray'
	, 'P'	--  'Abnormal CT'
	, 'P'	--  'Acute kidney injury'
	, 'P'	--  'ARDS'
	, 'P'	--  'Cardiac involvement'
	, 'P'	--  'Chills'
	, 'P'	--  'Clotting'
	, 'P'	--  'Conjunctival congestion'
	, 'P'	--  'Diarrhea'
	, 'P'	--  'Dry cough'
	, 'P'	--  'Enanthem'
	, 'A'	--  'Fatigue'
	, 'A'	--  'Fever'
	, 'A'	--  'Headache'
	, 'A'	--  'Hemoptysis'
	, 'A'	--  'Loss of taste/smell'
	, 'A'	--  'Multiple organ failure'
	, 'A'	--  'Myalgia/arthralgia'
	, 'A'	--  'Nasal congestion'
	, 'A'	--  'Nausea/vomiting'
	, 'ND'	--  'Pneumonia'
	, 'ND'	--  'Productive cough'
	, 'ND'	--  'pulmonary edema'
	, 'ND'	--  'Rash'
	, 'ND'	--  'Shortness of breath'
	, 'ND'	--  'Sore throat'
)
;
CALL sp_insert_samp_and_symp(
	'CV2000004' -- insert sample_number
	, 'P'	--  'Abnormal chest x-ray'
	, 'P'	--  'Abnormal CT'
	, 'P'	--  'Acute kidney injury'
	, 'P'	--  'ARDS'
	, 'P'	--  'Cardiac involvement'
	, 'P'	--  'Chills'
	, 'P'	--  'Clotting'
	, 'P'	--  'Conjunctival congestion'
	, 'P'	--  'Diarrhea'
	, 'P'	--  'Dry cough'
	, 'P'	--  'Enanthem'
	, 'A'	--  'Fatigue'
	, 'A'	--  'Fever'
	, 'A'	--  'Headache'
	, 'A'	--  'Hemoptysis'
	, 'A'	--  'Loss of taste/smell'
	, 'A'	--  'Multiple organ failure'
	, 'A'	--  'Myalgia/arthralgia'
	, 'A'	--  'Nasal congestion'
	, 'A'	--  'Nausea/vomiting'
	, 'ND'	--  'Pneumonia'
	, 'ND'	--  'Productive cough'
	, 'ND'	--  'pulmonary edema'
	, 'ND'	--  'Rash'
	, 'ND'	--  'Shortness of breath'
	, 'ND'	--  'Sore throat'
)
;

CALL sp_insert_samp_and_symp(
	'CV2000005' -- insert sample_number
	, 'P'	--  'Abnormal ch5est x-ray'
	, 'P'	--  'Abnormal CT'
	, 'P'	--  'Acute kidney injury'
	, 'P'	--  'ARDS'
	, 'P'	--  'Cardiac involvement'
	, 'P'	--  'Chills'
	, 'P'	--  'Clotting'
	, 'P'	--  'Conjunctival congestion'
	, 'P'	--  'Diarrhea'
	, 'P'	--  'Dry cough'
	, 'P'	--  'Enanthem'
	, 'A'	--  'Fatigue'
	, 'A'	--  'Fever'
	, 'A'	--  'Headache'
	, 'A'	--  'Hemoptysis'
	, 'A'	--  'Loss of taste/smell'
	, 'A'	--  'Multiple organ failure'
	, 'A'	--  'Myalgia/arthralgia'
	, 'A'	--  'Nasal congestion'
	, 'A'	--  'Nausea/vomiting'
	, 'ND'	--  'Pneumonia'
	, 'ND'	--  'Productive cough'
	, 'ND'	--  'pulmonary edema'
	, 'ND'	--  'Rash'
	, 'ND'	--  'Shortness of breath'
	, 'ND'	--  'Sore throat'
)
;

CALL sp_insert_samp_and_symp(
	'CV2000006' -- insert sample_number
	, 'P'	--  'Abnormal chest x-ray'
	, 'P'	--  'Abnormal CT'
	, 'P'	--  'Acute kidney injury'
	, 'P'	--  'ARDS'
	, 'P'	--  'Cardiac involvement'
	, 'P'	--  'Chills'
	, 'P'	--  'Clotting'
	, 'P'	--  'Conjunctival congestion'
	, 'P'	--  'Diarrhea'
	, 'P'	--  'Dry cough'
	, 'P'	--  'Enanthem'
	, 'A'	--  'Fatigue'
	, 'A'	--  'Fever'
	, 'A'	--  'Headache'
	, 'A'	--  'Hemoptysis'
	, 'A'	--  'Loss of taste/smell'
	, 'A'	--  'Multiple organ failure'
	, 'A'	--  'Myalgia/arthralgia'
	, 'A'	--  'Nasal congestion'
	, 'A'	--  'Nausea/vomiting'
	, 'ND'	--  'Pneumonia'
	, 'ND'	--  'Productive cough'
	, 'ND'	--  'pulmonary edema'
	, 'ND'	--  'Rash'
	, 'ND'	--  'Shortness of breath'
	, 'ND'	--  'Sore throat'
)
;

CALL sp_insert_samp_and_symp(
	'CV2000007' -- insert sample_number
	, 'P'	--  'Abnormal chest x-ray'
	, 'P'	--  'Abnormal CT'
	, 'P'	--  'Acute kidney injury'
	, 'P'	--  'ARDS'
	, 'P'	--  'Cardiac involvement'
	, 'P'	--  'Chills'
	, 'P'	--  'Clotting'
	, 'P'	--  'Conjunctival congestion'
	, 'P'	--  'Diarrhea'
	, 'P'	--  'Dry cough'
	, 'P'	--  'Enanthem'
	, 'A'	--  'Fatigue'
	, 'A'	--  'Fever'
	, 'A'	--  'Headache'
	, 'A'	--  'Hemoptysis'
	, 'A'	--  'Loss of taste/smell'
	, 'A'	--  'Multiple organ failure'
	, 'A'	--  'Myalgia/arthralgia'
	, 'A'	--  'Nasal congestion'
	, 'A'	--  'Nausea/vomiting'
	, 'ND'	--  'Pneumonia'
	, 'ND'	--  'Productive cough'
	, 'ND'	--  'pulmonary edema'
	, 'ND'	--  'Rash'
	, 'ND'	--  'Shortness of breath'
	, 'ND'	--  'Sore throat'
)
;
*/

-- Alternate insert values into alternate symptoms table
CALL sp_insert_samp_and_symp(
	'CV2000000' -- insert sample_number
	, 'sym01' -- insert sym_code
    , 'P' -- present, absent, not known
)
;

CALL sp_insert_samp_and_symp(
	'CV2000001' -- insert sample_number
	, 'sym02'-- insert sym_code
	, 'P' -- present, absent, not known
)
;

CALL sp_insert_samp_and_symp(
	'CV2000002' -- insert sample_number
	, 'sym13'-- insert sym_code
    , 'P' -- present, absent, not known
)
;

CALL sp_insert_samp_and_symp(
	'CV2000003' -- insert sample_number
	, 'sym20' -- insert sym_code
    , 'P' -- present, absent, not known
)
;
CALL sp_insert_samp_and_symp(
	'CV2000004' -- insert sample_number
	, 'sym20'-- insert sym_code
    , 'P' -- present, absent, not known
)
;

CALL sp_insert_samp_and_symp(
	'CV2000000' -- insert sample_number
	, 'sym02' -- insert sym_code
    , 'P' -- present, absent, not known
)
;

CALL sp_insert_samp_and_symp(
	'CV2000004' -- insert sample_number
	, 'sym21'-- insert sym_code
    , 'P' -- present, absent, not known
)
;

CALL sp_insert_samp_and_symp(
	'CV2000004' -- insert sample_number
	, 'sym01'-- insert sym_code
    , 'P' -- present, absent, not known
)
;

CALL sp_insert_samp_and_symp(
	'CV2000002' -- insert sample_number
	, 'sym14'-- insert sym_code
    , 'A' -- present, absent, not known
)
;

CALL sp_insert_samp_and_symp(
	'CV2000002' -- insert sample_number
	, 'sym19'-- insert sym_code
    , 'A' -- present, absent, not known
)
;




/*
SELECT * 
FROM symptoms_lookup
;
*/

/* 
	insert genes with the sample number
*/

CALL sp_insert_samp_and_gene(
	'CV2000000' -- insert sample_number
	, 'c.656>G.' -- gene_name
)
;

CALL sp_insert_samp_and_gene(
	'CV2000000' -- insert sample_number
	, 'c.626G>T' -- gene_name
)
;

CALL sp_insert_samp_and_gene(
	'CV2000000' -- insert sample_number
	, 'c.532A>T.' -- gene_name
)
;

CALL sp_insert_samp_and_gene(
	'CV2000000' -- insert sample_number
	, 'c.522A>T.' -- gene_name
)
;

CALL sp_insert_samp_and_gene(
	'CV2000001' -- insert sample_number
	, 'c.522A>G.' -- gene_name
)
;

CALL sp_insert_samp_and_gene(
	'CV2000001' -- insert sample_number
	, 'c.516>A.' -- gene_name
)
;

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

CALL sp_insert_samp_and_gene(
	'CV2000003' -- insert sample_number
    , 'c.626G>T' -- gene_name
)
;

CALL sp_insert_samp_and_gene(
	'CV2000003' -- insert sample_number
    , 'c.532A>T.' -- gene_name
)
;

CALL sp_insert_samp_and_gene(
	'CV2000004' -- insert sample_number
    , 'c.522A>T.' -- gene_name
)
;

CALL sp_insert_samp_and_gene(
	'CV2000004' -- insert sample_number
    , 'c.522A>G.' -- gene_name
)
;
/*
SELECT *
FROM conditions
;

SELECT *
FROM symptoms
;


SELECT *
FROM gene_table
;
*/

/*
	Error Code: 1062. Duplicate entry 'c.656>G.' for key 'gene_table.coding_variant'
*/
/*
SELECT *
FROM gene_lookup
;
*/

/*
18:59:28	CALL sp_insert_qc(  'CV2000004'-- sample_number  , 22 -- concentration  , 800 -- vol_of_hydration_buffer  , 17.6 -- amt_of_dna  , 'N' -- frag_gel  , 2020-08-15 -- date_of_gel  , 2 -- lane_number  , 'N/A'-- gel_imag )	Error Code: 1292. Incorrect date value: '1997' for column 'p_date_of_gel' at row 1	0.000 sec
19:01:29	CALL sp_insert_samp_and_cond(  'CV2000000' -- insert sample_number  , 'cond01' -- insert cond_code )	Error Code: 1054. Unknown column 'date_check_in' in 'field list'	0.016 sec
19:03:31	CALL sp_insert_samp_and_symp(  'CV2000000' -- insert sample_number  , 'sym01' -- insert sym_code )	Error Code: 1054. Unknown column 'date_check_in' in 'field list'	0.000 sec
19:04:51	CALL sp_insert_samp_and_gene(  'CV2000000' -- insert sample_number  , 'c.656>G.' -- gene_name )	Error Code: 1054. Unknown column 'date_check_in' in 'field list'	0.000 sec

*/