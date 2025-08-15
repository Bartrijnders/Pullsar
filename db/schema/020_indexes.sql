prompt Creating indexes...

-- Helpful foreign key indexes
create index ps_idx_enum_values_domain on ps_enum_values(domain_id);
create index ps_idx_enum_values_user   on ps_enum_values(user_id);

create index ps_idx_days_user          on ps_days(user_id);
create index ps_idx_days_energy        on ps_days(energy_id);

create index ps_idx_entries_user       on ps_entries(user_id);
create index ps_idx_entries_day        on ps_entries(day_id);
create index ps_idx_entries_type       on ps_entries(entry_type_id);
create index ps_idx_entries_status     on ps_entries(status_id);
create index ps_idx_entries_priority   on ps_entries(priority_id);

create index ps_idx_entry_tags_entry   on ps_entry_tags(entry_id);
create index ps_idx_entry_tags_tag     on ps_entry_tags(tag_id);

create index ps_idx_refl_user_week     on ps_reflections(user_id, week_start);
