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






