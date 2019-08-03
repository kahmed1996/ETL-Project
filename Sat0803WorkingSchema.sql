CREATE TABLE voters (
    voter_id_org INT   NOT NULL,
    city VARCHAR(100)   NOT NULL,
    party VARCHAR(10)   NOT NULL,
    birth_date VARCHAR(4)   NOT NULL,
    CONSTRAINT pk_voters PRIMARY KEY (
        voter_id_org,city
     )
);

CREATE TABLE elections (
    voter_id_org INT   NOT NULL,
    election VARCHAR(20)   NOT NULL,
    voted VARCHAR(1)   NOT NULL,
	 CONSTRAINT pk_elections PRIMARY KEY (
        voter_id_org,election
		 )
);

CREATE TABLE census_population (
    CensusTract BIGINT   NOT NULL,
    Total_Population INT   NOT NULL,
    CONSTRAINT pk_census_population PRIMARY KEY (
        CensusTract
     )
);

CREATE TABLE census_ethnicity (
    CensusTract BIGINT   NOT NULL,
    Total_Population INT   NOT NULL,
    Hispanic decimal(10,2),
    White decimal(10,2),
    Black decimal(10,2),
    Native decimal(10,2),
    Asian decimal(10,2),
    Pacific decimal(10,2),
    CONSTRAINT pk_census_ethnicity PRIMARY KEY (
        CensusTract
     )
);

CREATE TABLE census_income (
    CensusTract BIGINT   NOT NULL,
    Median_Household_Income INT DEFAULT 0 NOT NULL,
    Income_Per_Capita INT DEFAULT 0   NOT NULL,
    Under_Poverty_Level_Percentage  decimal(10,2),
    CONSTRAINT pk_census_income PRIMARY KEY (
        CensusTract
     )
);

CREATE TABLE census_employment_type (
    CensusTract BIGINT   NOT NULL,
    Total_Employed INT   NOT NULL,
    PrivateWork decimal(10,2),
    PublicWork decimal(10,2),
    SelfEmployed decimal(10,2),
    CONSTRAINT pk_census_employment_type PRIMARY KEY (
        CensusTract
     )
);

CREATE TABLE census_gender (
    censustract BIGINT   NOT NULL,
    Total_Population INT   NOT NULL,
    Men INT   NOT NULL,
    Women INT   NOT NULL,
    CONSTRAINT pk_census_gender PRIMARY KEY (
        censustract
     )
);

CREATE TABLE census_professions (
    CensusTract BIGINT   NOT NULL,
    Total_Employed INT   NOT NULL,
    Professional_Workers_Percentage decimal(10,2),
    Service_Workers_percentage decimal(10,2),
    Office_Workers_Percentage decimal(10,2),
    Construction_Workers_Percentage decimal(10,2),
    Production_Workers_Percentage decimal(10,2),
    CONSTRAINT pk_census_professions PRIMARY KEY (
        CensusTract
     )
);

