set feedback off
prompt Dropping PullSar objects (ignore errors)...

-- drop in FK-safe order
begin execute immediate 'drop view v_ps_entries'; exception when others then null; end;
/
begin execute immediate 'drop view v_ps_days';    exception when others then null; end;
/

begin execute immediate 'drop trigger ps_entries_mit_limit'; exception when others then null; end;
/

begin execute immediate 'drop package body ps'; exception when others then null; end;
/
begin execute immediate 'drop package ps';       exception when others then null; end;
/

begin execute immediate 'drop table ps_entry_tags cascade constraints'; exception when others then null; end;
/
begin execute immediate 'drop table ps_reflections cascade constraints'; exception when others then null; end;
/
begin execute immediate 'drop table ps_entries cascade constraints'; exception when others then null; end;
/
begin execute immediate 'drop table ps_tags cascade constraints'; exception when others then null; end;
/
begin execute immediate 'drop table ps_days cascade constraints'; exception when others then null; end;
/
begin execute immediate 'drop table ps_enum_values cascade constraints'; exception when others then null; end;
/
begin execute immediate 'drop table ps_enum_domains cascade constraints'; exception when others then null; end;
/
begin execute immediate 'drop table ps_users cascade constraints'; exception when others then null; end;
/

prompt Done.
set feedback on
