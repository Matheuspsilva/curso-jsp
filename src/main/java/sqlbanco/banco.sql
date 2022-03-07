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

CREATE TABLE IF NOT EXISTS public.model_login
(
    login character varying(200) COLLATE pg_catalog."default",
    senha character varying(200) COLLATE pg_catalog."default",
    CONSTRAINT login_unique UNIQUE (login)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.model_login
    OWNER to postgres;
    
INSERT INTO public.model_login(
login, senha)
VALUES ('admin', 'admin');