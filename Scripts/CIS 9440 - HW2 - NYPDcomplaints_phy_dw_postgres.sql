CREATE SCHEMA IF NOT EXISTS "NYPDcomplaints";

CREATE  TABLE "NYPDcomplaints".dim_date (
	date_id              INT  NOT NULL  ,
	cmplnt_fr_dt         DATE    ,
	cmplnt_to_dt         DATE    ,
	rpt_dt               DATE    ,
	cmplnt_fr_iso        TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP	    ,
	cmplnt_to_iso        TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP	    ,
	CONSTRAINT pk_dim_date PRIMARY KEY ( date_id )
 );

CREATE  TABLE "NYPDcomplaints".dim_jurisdiction (
	jurisdication_id     INT  NOT NULL  ,
	juris_desc           VARCHAR(255)    ,
	CONSTRAINT pk_dim_jurisdiction PRIMARY KEY ( jurisdication_id )
 );

CREATE  TABLE "NYPDcomplaints".dim_location (
	location_id          INT  NOT NULL  ,
	boro_nm              VARCHAR(255)  NOT NULL  ,
	latitude             DECIMAL(30,12)    ,
	longitude            DECIMAL(30,12)    ,
	CONSTRAINT pk_dim_location PRIMARY KEY ( location_id )
 );

CREATE  TABLE "NYPDcomplaints".dim_offense (
	offense_id           INT  NOT NULL  ,
	crm_atpt_cptd_cd     VARCHAR(255)    ,
	law_cat_cd           VARCHAR(255)    ,
	ofns_desc            VARCHAR(255)    ,
	pd_cd                VARCHAR(255)    ,
	pd_desc              VARCHAR(255)    ,
	prem_typ_desc        VARCHAR(255)    ,
	loc_of_occur_desc    VARCHAR(255)    ,
	CONSTRAINT pk_dim_offense PRIMARY KEY ( offense_id )
 );

CREATE  TABLE "NYPDcomplaints".facts_complaints (
	cmplnt_num_id        VARCHAR(255)  NOT NULL  ,
	addr_pct_cd          VARCHAR(255)    ,
	ky_cd                VARCHAR(255)    ,
	location_id          VARCHAR(255)  NOT NULL  ,
	date_id              INT    ,
	offense_id           INT    ,
	jurisdication_id     INT    ,
	CONSTRAINT pk_facts_complaints PRIMARY KEY ( cmplnt_num_id )
 );

CREATE UNIQUE INDEX unq_location_id ON "NYPDcomplaints".facts_complaints ( location_id );
