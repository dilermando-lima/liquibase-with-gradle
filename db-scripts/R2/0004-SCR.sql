--liquibase formatted sql

--changeset dilo.lima:1 endDelimiter:/ runOnChange:true
create or replace package PACKAGE_2_V0
as
    cursor c_table_2 is select id, COL1 from TABLE_2;
    type T_TABLE_2 is table of c_table_2%rowtype;
    function fun_table_2 return T_TABLE_2 pipelined;

end PACKAGE_2_V0;

create or replace package BODY PACKAGE_2_V0
as

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
    
end PACKAGE_2_V0;
/
--rollback not required