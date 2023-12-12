--liquibase formatted sql

--changeset dilo.lima:1 endDelimiter:/
create package PACKAGE_1_V1
as

    cursor c_table_1 is select id, COL1 from TABLE_1;
    cursor c_table_2 is select id, COL1 from TABLE_2;
    
    type T_TABLE_1 is table of c_table_1%rowtype;
    type T_TABLE_2 is table of c_table_2%rowtype;

    function fun_table_1 return T_TABLE_1 pipelined;
    function fun_table_2 return T_TABLE_2 pipelined;

end PACKAGE_1_V1;

create or replace package BODY PACKAGE_1_V1
as

    function fun_table_1 return T_TABLE_1 pipelined
    is
    begin
        for x in c_table_1
        loop
            pipe row(x);
        end loop;
        return;
    exception
        when OTHERS then
            if (c_table_1%isOpen) then
                close c_table_1;
            end if;
            raise;
    end fun_table_1;
    

    function fun_table_2 return T_TABLE_2 pipelined
    is
    begin
        for x in c_table_2
        loop
            pipe row(x);
        end loop;
        return;
    exception
        when OTHERS then
            if (c_table_2%isOpen) then
                close c_table_2;
            end if;
            raise;
    end fun_table_2;
    
end PACKAGE_1_V1;
/
--rollback drop package PACKAGE_1_V1