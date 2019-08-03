CREATE TABLE public.census_employment_type
(
    censustract bigint NOT NULL,
    total_employed integer NOT NULL,
    privatework numeric(10,2),
    publicwork numeric(10,2),
    selfemployed numeric(10,2),
    CONSTRAINT pk_census_employment_type PRIMARY KEY (censustract)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.census_employment_type
    OWNER to postgres;
	
	-- Table: public.census_ethnicity

-- DROP TABLE public.census_ethnicity;

CREATE TABLE public.census_ethnicity
(
    censustract bigint NOT NULL,
    total_population integer NOT NULL,
    hispanic numeric(10,2),
    white numeric(10,2),
    black numeric(10,2),
    native numeric(10,2),
    asian numeric(10,2),
    pacific numeric(10,2),
    CONSTRAINT pk_census_ethnicity PRIMARY KEY (censustract)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.census_ethnicity
    OWNER to postgres;


CREATE TABLE public.census_gender
(
    censustract bigint NOT NULL,
    total_population integer NOT NULL,
    men integer NOT NULL,
    women integer NOT NULL,
    CONSTRAINT pk_census_gender PRIMARY KEY (censustract)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.census_gender
    OWNER to postgres;
	
	

CREATE TABLE public.census_income
(
    censustract bigint NOT NULL,
    median_household_income integer DEFAULT 0,
    income_per_capita integer DEFAULT 0,
    under_poverty_level_percentage numeric(10,2),
    CONSTRAINT pk_census_income PRIMARY KEY (censustract)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.census_income
    OWNER to postgres;
	

CREATE TABLE public.census_population
(
    censustract bigint NOT NULL,
    total_population integer NOT NULL,
    CONSTRAINT pk_census_population PRIMARY KEY (censustract)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.census_population
    OWNER to postgres;
	

CREATE TABLE public.census_professions
(
    censustract bigint NOT NULL,
    total_employed integer NOT NULL,
    professional_workers_percentage numeric(10,2),
    service_workers_percentage numeric(10,2),
    office_workers_percentage numeric(10,2),
    construction_workers_percentage numeric(10,2),
    production_workers_percentage numeric(10,2),
    CONSTRAINT pk_census_professions PRIMARY KEY (censustract)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.census_professions
    OWNER to postgres;
	

CREATE TABLE public.census_to_city
(
    city character varying(100) COLLATE pg_catalog."default" NOT NULL,
    censustract bigint NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.census_to_city
    OWNER to postgres;
	

CREATE TABLE public.elections
(
    voter_id_org integer NOT NULL,
    election character varying(20) COLLATE pg_catalog."default" NOT NULL,
    voted character varying(1) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_elections PRIMARY KEY (voter_id_org, election)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.elections
    OWNER to postgres;
	

CREATE TABLE public.voters
(
    voter_id_org integer NOT NULL,
    city character varying(100) COLLATE pg_catalog."default" NOT NULL,
    party character varying(10) COLLATE pg_catalog."default" NOT NULL,
    birth_date character varying(4) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_voters PRIMARY KEY (voter_id_org, city)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.voters
    OWNER to postgres;