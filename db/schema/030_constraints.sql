prompt 'Adding foreign keys and constraints...'

-- ps_enum_values
alter table ps_enum_values
  add constraint ps_ev_domain_fk foreign key (domain_id)
  references ps_enum_domains(id);

alter table ps_enum_values
  add constraint ps_ev_user_fk foreign key (user_id)
  references ps_users(id);

-- ps_days
alter table ps_days
  add constraint ps_days_user_fk foreign key (user_id)
  references ps_users(id);

alter table ps_days
  add constraint ps_days_energy_fk foreign key (energy_id)
  references ps_enum_values(id);

-- ps_entries
alter table ps_entries
  add constraint ps_entries_user_fk foreign key (user_id)
  references ps_users(id);

alter table ps_entries
  add constraint ps_entries_day_fk foreign key (day_id)
  references ps_days(id);

alter table ps_entries
  add constraint ps_entries_type_fk foreign key (entry_type_id)
  references ps_enum_values(id);

alter table ps_entries
  add constraint ps_entries_status_fk foreign key (status_id)
  references ps_enum_values(id);

alter table ps_entries
  add constraint ps_entries_prio_fk foreign key (priority_id)
  references ps_enum_values(id);

-- ps_entry_tags
alter table ps_entry_tags
  add constraint ps_et_entry_fk foreign key (entry_id)
  references ps_entries(id) on delete cascade;

alter table ps_entry_tags
  add constraint ps_et_tag_fk foreign key (tag_id)
  references ps_tags(id) on delete cascade;

-- ps_reflections
alter table ps_reflections
  add constraint ps_refl_user_fk foreign key (user_id)
  references ps_users(id);
