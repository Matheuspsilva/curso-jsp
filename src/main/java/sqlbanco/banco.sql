-- Database: curso-jsp

-- DROP DATABASE IF EXISTS "curso-jsp";

CREATE DATABASE "curso-jsp"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'pt_BR.UTF-8'
    LC_CTYPE = 'pt_BR.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
    
    
-- Table: public.model_login

-- DROP TABLE IF EXISTS public.model_login;

-- Table: public.model_login

-- DROP TABLE IF EXISTS public.model_login;

CREATE TABLE IF NOT EXISTS public.model_login
(
    login character varying(200) COLLATE pg_catalog."default" NOT NULL,
    senha character varying(200) COLLATE pg_catalog."default" NOT NULL,
    id integer NOT NULL DEFAULT nextval('model_login_id_seq'::regclass),
    nome character varying(300) COLLATE pg_catalog."default" NOT NULL,
    email character varying(300) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT model_login_pkey PRIMARY KEY (id),
    CONSTRAINT login_unique UNIQUE (login)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.model_login
    OWNER to postgres;
    
INSERT INTO public.model_login(
login, senha)
VALUES ('admin', 'admin');

alter table model_login add id serial primary key;

alter table model_login add nome character varying(300);

alter table model_login add email character varying(300);