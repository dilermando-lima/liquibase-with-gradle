--liquibase formatted sql

--changeset dilo.lima:1 contextFilter:dev,hml,prd
CREATE TABLE TABLE_1 (
	ID NUMBER(2),					
    COL1 VARCHAR2(255)
)
--rollback drop table TABLE_1

--changeset dilo.lima:2 
CREATE TABLE TABLE_2 (
	ID NUMBER(2),					
    COL1 VARCHAR2(255)
)
--rollback drop table TABLE_2

