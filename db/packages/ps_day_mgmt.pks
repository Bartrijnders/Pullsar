create or replace package ps_day_mgmt as
  /**
   * Ensures a day record exists for a given user/date.
   * Creates it if not found.
   */
  procedure ensure_day(
    p_user_id number,
    p_date    date default trunc(sysdate)
  );

  /**
   * Moves all open tasks from one day to another and sets their status to MOVED.
   */
  procedure move_open_tasks_to(
    p_user_id number,
    p_from    date,
    p_to      date
  );

  /**
   * Returns a weekly digest as Markdown text for a given user/week start date.
   */
  function weekly_digest_md(
    p_user_id    number,
    p_week_start date
  ) return clob;
end ps_day_mgmt;
