CREATE SCHEMA INSTANCE;

CREATE  TABLE "NYPDcomplaints_dw_lgl".INSTANCE.DIM_DATE ( 
	DATE_ID              integer NOT NULL   ,
	CMPLNT_FR_DT         date    ,
	CMPLNT_TO_DT         date    ,
	RPT_DT               date    ,
	CMPLNT_FR_ISO        datetime    ,
	CMPLNT_TO_ISO        datetime    ,
	CONSTRAINT PK_DIM_DATE PRIMARY KEY ( DATE_ID )
 );

CREATE  TABLE "NYPDcomplaints_dw_lgl".INSTANCE.DIM_JURISDICTION ( 
	JURISDICATION_ID     integer NOT NULL   ,
	JURIS_DESC           varchar(255)    ,
	CONSTRAINT PK_DIM_JURISDICTION PRIMARY KEY ( JURISDICATION_ID )
 );

CREATE  TABLE "NYPDcomplaints_dw_lgl".INSTANCE.DIM_LOCATION ( 
	LOCATION_ID          integer NOT NULL   ,
	BORO_NM              varchar(255) NOT NULL   ,
	LATITUDE             double    ,
	LONGITUDE            double    ,
	CONSTRAINT PK_DIM_LOCATION PRIMARY KEY ( LOCATION_ID )
 );

CREATE  TABLE "NYPDcomplaints_dw_lgl".INSTANCE.DIM_OFFENSE ( 
	OFFENSE_ID           integer NOT NULL   ,
	CRM_ATPT_CPTD_CD     varchar(255)    ,
	LAW_CAT_CD           varchar(255)    ,
	OFNS_DESC            varchar(255)    ,
	PD_CD                varchar(255)    ,
	PD_DESC              varchar(255)    ,
	PREM_TYP_DESC        varchar(255)    ,
	LOC_OF_OCCUR_DESC    varchar(255)    ,
	CONSTRAINT PK_DIM_OFFENSE PRIMARY KEY ( OFFENSE_ID )
 );

CREATE  TABLE "NYPDcomplaints_dw_lgl".INSTANCE.FACTS_COMPLAINTS ( 
	CMPLNT_NUM_ID        varchar(255) NOT NULL   ,
	ADDR_PCT_CD          varchar(255)    ,
	KY_CD                varchar(255)    ,
	LOCATION_ID          varchar(255) NOT NULL   ,
	DATE_ID              integer    ,
	OFFENSE_ID           integer    ,
	JURISDICATION_ID     integer    ,
	CONSTRAINT PK_FACTS_COMPLAINTS PRIMARY KEY ( CMPLNT_NUM_ID )
 );
