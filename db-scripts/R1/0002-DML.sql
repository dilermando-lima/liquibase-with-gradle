--liquibase formatted sql

--changeset dilo.lima:1 contextFilter:dev,hml,prd
INSERT INTO TABLE_2(ID, COL1) VALUES(1,'DESCRIPTION 1');
--rollback delete from TABLE_2 where id = 1

--changeset dilo.lima:2 contextFilter:dev
INSERT INTO TABLE_2(ID, COL1) VALUES(2,'DESCRIPTION 2');
--rollback delete from TABLE_2 where id = 2