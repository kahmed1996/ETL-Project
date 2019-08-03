DROP TABLE census_to_city;
CREATE TABLE census_to_city (
    
    city VARCHAR(100)   NOT NULL,
	censustract BIGINT   NOT NULL
     
);

select * from census_to_city
group by blockgroup
having count(1) > 1


SELECT * FROM CENSUS_TO_CITY CC
WHERE  NOT EXISTS (SELECT 1 FROM VOTERS V
				WHERE CC.CITY = V.CITY )
				
				SELECT * FROM CENSUS_TO_CITY CC
WHERE   EXISTS (SELECT 1 FROM VOTERS V
				WHERE CC.CITY = V.CITY )


SELECT DISTINCT CITY FROM VOTERS
ORDER BY 1

SELECT E.VOTER_ID_ORG, V.CITY, PARTY, BIRTH_DATE, 
ELECTION, VOTED,MEN, WOMEN, CG.TOTAL_POPULATION,
HISPANIC, WHITE, BLACK, NATIVE, ASIAN,PACIFIC
FROM ELECTIONS E
JOIN (SELECT * FROM VOTERS  LIMIT  10000) V  ON E.VOTER_ID_ORG = V.VOTER_ID_ORG 
JOIN CENSUS_TO_CITY CC ON V.CITY = CC.CITY
JOIN CENSUS_GENDER CG ON CC.CENSUSTRACT = CG.CENSUSTRACT
JOIN CENSUS_ETHNICITY CE ON CC.CENSUSTRACT = CE.CENSUSTRACT;



SELECT  V.CITY, PARTY, ELECTION, sum(case when VOTED = 'Y' Then 1 end) Voted_CNT,
sum(case when VOTED = 'N' Then 1 end) NOT_Voted_CNT,
sum(distinct CG.TOTAL_POPULATION) TOTAL_POPULATION--,
--MEN, WOMEN, 
--HISPANIC, WHITE, BLACK, NATIVE, ASIAN,PACIFIC
FROM ELECTIONS E
JOIN (SELECT * FROM VOTERS  LIMIT  10000) V  ON E.VOTER_ID_ORG = V.VOTER_ID_ORG 
JOIN CENSUS_TO_CITY CC ON V.CITY = CC.CITY
JOIN CENSUS_GENDER CG ON CC.CENSUSTRACT = CG.CENSUSTRACT
JOIN CENSUS_ETHNICITY CE ON CC.CENSUSTRACT = CE.CENSUSTRACT
GROUP BY V.CITY, PARTY, ELECTION;


select date_part('year',CURRENT_DATE)

SELECT  V.CITY, PARTY, (cast(date_part('year',CURRENT_DATE) as integer) 
						- cast(birth_date as integer)) Age, 
ELECTION,sum(distinct MEN) MEN_POPULATION, 
SUM(distinct WOMEN) WOMEN_POPULATION, 
sum(distinct HISPANIC)HISPANIC_POPULATION
,sum(distinct  WHITE) WHITE_POPULATION
,sum(distinct  BLACK) BLACK_POPULATION
,sum(distinct  NATIVE) NATIVE_POPULATION
,sum(distinct  ASIAN) ASIAN_POPULATION
,sum(distinct PACIFIC)PACIFIC_POPULATION
,sum(case when VOTED = 'Y' Then 1 else 0 end) Voted_CNT,
sum(case when VOTED = 'N' Then 1 else 0 end) NOT_Voted_CNT,
sum(distinct CG.TOTAL_POPULATION) TOTAL_POPULATION--,
--MEN, WOMEN, 
--HISPANIC, WHITE, BLACK, NATIVE, ASIAN,PACIFIC
FROM ELECTIONS E
JOIN (SELECT * FROM VOTERS  where city = 'BEDFORD' ) V  ON E.VOTER_ID_ORG = V.VOTER_ID_ORG 
JOIN CENSUS_TO_CITY CC ON V.CITY = CC.CITY
JOIN CENSUS_GENDER CG ON CC.CENSUSTRACT = CG.CENSUSTRACT
JOIN CENSUS_ETHNICITY CE ON CC.CENSUSTRACT = CE.CENSUSTRACT
GROUP BY V.CITY, PARTY, ELECTION,date_part('year',CURRENT_DATE),birth_date;

ALTER TABLE CENSUS_TO_CITY RENAME COLUMN BLOCKGROUP TO CENSUSTRACT


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

ALTER TABLE census_employment_type ADD CONSTRAINT fk_census_employment_type_CensusTract FOREIGN KEY(CensusTract)
REFERENCES census_to_city (blockgroup);

ALTER TABLE census_gender ADD CONSTRAINT fk_census_gender_census_tract FOREIGN KEY(census_tract)
REFERENCES census_to_city (blockgroup);

ALTER TABLE census_professions ADD CONSTRAINT fk_census_professions_CensusTract FOREIGN KEY(CensusTract)
REFERENCES census_to_city (blockgroup);

DROP TABLE IF EXISTS elections;
alter table census_income alter column income_per_capita drop not null;

select * from census_income;

ALTER TABLE census_gender 
ALTER TABLE elections DROP CONSTRAINT pk_elections ;
RENAME census_tract TO new_censustract;