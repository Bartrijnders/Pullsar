prompt 'Seeding enum domains and values...'

-- Domains
insert into ps_enum_domains(code, name) values ('PRIORITY','Priority');
insert into ps_enum_domains(code, name) values ('STATUS','Status');
insert into ps_enum_domains(code, name) values ('ENERGY','Energy');
insert into ps_enum_domains(code, name) values ('ENTRY_TYPE','Entry Type');

-- PRIORITY
insert into ps_enum_values(domain_id, code, label, sort_order, is_default, color_hex)
select id, 'A', 'A — Must do today', 1, 'Y', '#14C8C4'
from ps_enum_domains where code='PRIORITY';

insert into ps_enum_values(domain_id, code, label, sort_order)
select id, 'B', 'B — Should do soon', 2
from ps_enum_domains where code='PRIORITY';

insert into ps_enum_values(domain_id, code, label, sort_order)
select id, 'C', 'C — Nice to do', 3
from ps_enum_domains where code='PRIORITY';

-- STATUS
insert into ps_enum_values(domain_id, code, label, sort_order, is_default, icon_name)
select id, 'TODO',  'To do',        1, 'Y', 'circle'
from ps_enum_domains where code='STATUS';

insert into ps_enum_values(domain_id, code, label, sort_order, icon_name)
select id, 'DOING', 'In progress',  2, 'play'
from ps_enum_domains where code='STATUS';

insert into ps_enum_values(domain_id, code, label, sort_order, icon_name)
select id, 'DONE',  'Done',         3, 'check'
from ps_enum_domains where code='STATUS';

insert into ps_enum_values(domain_id, code, label, sort_order, icon_name)
select id, 'MOVED', 'Moved',        4, 'arrow-right'
from ps_enum_domains where code='STATUS';

insert into ps_enum_values(domain_id, code, label, sort_order, icon_name)
select id, 'BLOCK', 'Blocked',      5, 'lock'
from ps_enum_domains where code='STATUS';

-- ENERGY
insert into ps_enum_values(domain_id, code, label, sort_order, color_hex, is_default)
select id, 'LOW',   'Low',    1, '#E76F51', 'N'
from ps_enum_domains where code='ENERGY';

insert into ps_enum_values(domain_id, code, label, sort_order, color_hex, is_default)
select id, 'MED',   'Medium', 2, '#F4D35E', 'Y'
from ps_enum_domains where code='ENERGY';

insert into ps_enum_values(domain_id, code, label, sort_order, color_hex, is_default)
select id, 'HIGH',  'High',   3, '#2A9D8F', 'N'
from ps_enum_domains where code='ENERGY';

-- ENTRY_TYPE
insert into ps_enum_values(domain_id, code, label, sort_order, is_default, icon_name)
select id, 'TASK', 'Task', 1, 'Y', 'check-square'
from ps_enum_domains where code='ENTRY_TYPE';

insert into ps_enum_values(domain_id, code, label, sort_order, icon_name)
select id, 'IDEA', 'Idea', 2, 'lightbulb'
from ps_enum_domains where code='ENTRY_TYPE';

insert into ps_enum_values(domain_id, code, label, sort_order, icon_name)
select id, 'NOTE', 'Note', 3, 'sticky-note'
from ps_enum_domains where code='ENTRY_TYPE';

commit;
prompt 'Seeding enum domains and values completed successfully.';