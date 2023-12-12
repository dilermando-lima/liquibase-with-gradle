--liquibase formatted sql

--changeset dilo.lima:1 contextFilter:dev,hml,prd tag:1.0.0
INSERT INTO TABLE_2(ID, COL1) VALUES(3,'DESCRIPTION 3');
INSERT INTO TABLE_2(ID, COL1) VALUES(4,'DESCRIPTION 4');
--rollback delete from TABLE_2 where id in (3,4)

--changeset dilo.lima:2
INSERT INTO TABLE_2(ID, COL1) VALUES(5,'DESCRIPTION 6');
INSERT INTO TABLE_2(ID, COL1) VALUES(6,'DESCRIPTION 7');
--rollback delete from TABLE_2 where id in (5,6)

