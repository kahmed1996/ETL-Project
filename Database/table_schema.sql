CREATE TABLE census_to_city (
    blockgroup VARCHAR(6)   NOT NULL,
    city VARCHAR(100)   NOT NULL,
    CONSTRAINT pk_census_to_city PRIMARY KEY (
        blockgroup
     )
);

CREATE TABLE voters (
    voter_id_org INT   NOT NULL,
    city VARCHAR(100)   NOT NULL,
    party VARCHAR(10)   NOT NULL,
    birth_date VARCHAR(4)   NOT NULL,
    CONSTRAINT pk_voters PRIMARY KEY (
        voter_id_org
     )
);

CREATE TABLE elections (
    voter_id_org INT   NOT NULL,
    election VARCHAR(20)   NOT NULL,
    voted VARCHAR(1)   NOT NULL
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
    Hispanic INT   NOT NULL,
    White INT   NOT NULL,
    Black INT   NOT NULL,
    Native INT   NOT NULL,
    Asian INT   NOT NULL,
    Pacific INT   NOT NULL,
    CONSTRAINT pk_census_ethnicity PRIMARY KEY (
        CensusTract
     )
);

CREATE TABLE census_income (
    CensusTract BIGINT   NOT NULL,
    Median_Household_Income INT   NOT NULL,
    Income_Per_Capita INT   NOT NULL,
    Under_Pert_Level_Perrentage INT   NOT NULL,
    CONSTRAINT pk_census_income PRIMARY KEY (
        CensusTract
     )
);

CREATE TABLE censis_employment_type (
    CensusTract BIGINT   NOT NULL,
    Total_Employed INT   NOT NULL,
    PrivateWork INT   NOT NULL,
    PublicWork INT   NOT NULL,
    SelfEmployed INT   NOT NULL,
    CONSTRAINT pk_censis_employment_type PRIMARY KEY (
        CensusTract
     )
);

CREATE TABLE census_gender (
    census_tract VARCHAR(6)   NOT NULL,
    Total_Population INT   NOT NULL,
    Men INT   NOT NULL,
    Women INT   NOT NULL,
    CONSTRAINT pk_census_gender PRIMARY KEY (
        census_tract
     )
);

CREATE TABLE census_professions (
    CensusTract BIGINT   NOT NULL,
    Total_Employed INT   NOT NULL,
    Professional_Workers_Percentage INT   NOT NULL,
    Service_Workers_percentage INT   NOT NULL,
    Office_Workers_Percentage INT   NOT NULL,
    Construction_Workers_Percentage INT   NOT NULL,
    Production_Workers_Percentage INT   NOT NULL,
    CONSTRAINT pk_census_professions PRIMARY KEY (
        CensusTract
     )
);

ALTER TABLE census_to_city ADD CONSTRAINT fk_census_to_city_blockgroup FOREIGN KEY(blockgroup)
REFERENCES census_population (CensusTract);

ALTER TABLE census_to_city ADD CONSTRAINT fk_census_to_city_city FOREIGN KEY(city)
REFERENCES voters (city);

ALTER TABLE voters ADD CONSTRAINT fk_voters_voter_id_org FOREIGN KEY(voter_id_org)
REFERENCES elections (voter_id_org);

ALTER TABLE census_ethnicity ADD CONSTRAINT fk_census_ethnicity_CensusTract FOREIGN KEY(CensusTract)
REFERENCES census_to_city (blockgroup);

ALTER TABLE census_income ADD CONSTRAINT fk_census_income_CensusTract FOREIGN KEY(CensusTract)
REFERENCES census_to_city (blockgroup);

ALTER TABLE censis_employment_type ADD CONSTRAINT fk_censis_employment_type_CensusTract FOREIGN KEY(CensusTract)
REFERENCES census_to_city (blockgroup);

ALTER TABLE census_gender ADD CONSTRAINT fk_census_gender_census_tract FOREIGN KEY(census_tract)
REFERENCES census_to_city (blockgroup);

ALTER TABLE census_professions ADD CONSTRAINT fk_census_professions_CensusTract FOREIGN KEY(CensusTract)
REFERENCES census_to_city (blockgroup);