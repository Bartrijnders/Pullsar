prompt Creating PullSar base tables...

-- USERS
create table ps_users (
  id           number generated always as identity primary key,
  email        varchar2(255) unique,
  display_name varchar2(100)
);

-- ENUM DOMAINS (PRIORITY, STATUS, ENERGY, ENTRY_TYPE)
create table ps_enum_domains (
  id    number generated always as identity primary key,
  code  varchar2(40)   not null,
  name  varchar2(100)  not null,
  constraint ps_enum_domains_uk unique (code)
);

-- ENUM VALUES (global or per-user override)
create table ps_enum_values (
  id         number generated always as identity primary key,
  domain_id  number       not null,
  user_id    number       null,
  code       varchar2(40) not null,
  label      varchar2(200) not null,
  sort_order number default 0,
  is_default char(1) default 'N' check (is_default in ('Y','N')),
  is_active  char(1) default 'Y' check (is_active  in ('Y','N')),
  color_hex  varchar2(9),
  icon_name  varchar2(40),
  constraint ps_enum_values_uk unique (domain_id, user_id, code)
);

-- DAYS (one row per user per day)
create table ps_days (
  id           number generated always as identity primary key,
  user_id      number not null,
  the_date     date   not null,
  energy_id    number null,
  focus_note   varchar2(4000),
  constraint ps_days_uq unique (user_id, the_date)
);

-- ENTRIES (tasks/ideas/notes)
create table ps_entries (
  id            number generated always as identity primary key,
  user_id       number not null,
  day_id        number not null,
  entry_type_id number not null,
  status_id     number null,
  priority_id   number null,
  is_mit        char(1) default 'N' check (is_mit in ('Y','N')),
  content       varchar2(4000) not null,
  moved_to_day  date,
  created_at    timestamp default systimestamp
);

-- TAGS
create table ps_tags (
  id   number generated always as identity primary key,
  name varchar2(50) unique
);

-- ENTRY <-> TAG (M:N)
create table ps_entry_tags (
  entry_id number not null,
  tag_id   number not null,
  constraint ps_entry_tags_pk primary key (entry_id, tag_id)
);

-- WEEKLY REFLECTIONS
create table ps_reflections (
  id         number generated always as identity primary key,
  user_id    number not null,
  week_start date   not null,
  wins       varchar2(4000),
  lessons    varchar2(4000),
  focus_next varchar2(4000),
  constraint ps_reflections_uq unique (user_id, week_start)
);
