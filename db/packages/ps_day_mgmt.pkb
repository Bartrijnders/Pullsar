create or replace package body ps_day_mgmt as

  procedure ensure_day(p_user_id number, p_date date) is
  begin
    insert /*+ ignore_row_on_dupkey_index */
      into ps_days(user_id, the_date)
    values (p_user_id, trunc(p_date));
  exception
    when dup_val_on_index then
      null; -- already exists
  end ensure_day;


  procedure move_open_tasks_to(p_user_id number, p_from date, p_to date) is
  begin
    update ps_entries
       set status_id = (
         select v.id
         from   ps_enum_values v
         join   ps_enum_domains d on d.id = v.domain_id
         where  d.code = 'STATUS'
           and  v.code = 'MOVED'
           and  rownum = 1
       ),
           moved_to_day = trunc(p_to)
     where user_id = p_user_id
       and day_id  = (
         select id
         from   ps_days
         where  user_id = p_user_id
           and  the_date = trunc(p_from)
       )
       and entry_type_id = (
         select v.id
         from   ps_enum_values v
         join   ps_enum_domains d on d.id = v.domain_id
         where  d.code = 'ENTRY_TYPE'
           and  v.code = 'TASK'
           and  rownum = 1
       )
       and (status_id is null or status_id in (
         select v.id
         from   ps_enum_values v
         join   ps_enum_domains d on d.id = v.domain_id
         where  d.code = 'STATUS'
           and  v.code in ('TODO', 'DOING')
       ));
  end move_open_tasks_to;


  function weekly_digest_md(p_user_id number, p_week_start date) return clob is
    l_md clob := empty_clob();
  begin
    -- Placeholder for real summary logic
    l_md := '# Weekly Digest' || chr(10) ||
            'Week starting: ' || to_char(p_week_start,'YYYY-MM-DD') || chr(10) ||
            '(Summary coming soon...)';
    return l_md;
  end weekly_digest_md;

end ps_day_mgmt;
