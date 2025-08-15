prompt Creating views...

create or replace view v_ps_entries as
select e.*,
       et.code   as entry_type_code,
       et.label  as entry_type_label,
       st.code   as status_code,
       st.label  as status_label,
       pr.code   as priority_code,
       pr.label  as priority_label
from   ps_entries e
left join ps_enum_values et on et.id = e.entry_type_id
left join ps_enum_values st on st.id = e.status_id
left join ps_enum_values pr on pr.id = e.priority_id;

create or replace view v_ps_days as
select d.*,
       en.code      as energy_code,
       en.label     as energy_label,
       en.color_hex as energy_color
from   ps_days d
left join ps_enum_values en on en.id = d.energy_id;
