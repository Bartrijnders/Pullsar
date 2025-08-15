whenever sqlerror exit failure rollback
set serveroutput on feedback on define off

prompt == PullSar DB deploy start ==

@../schema/010_tables.sql
@../schema/020_indexes.sql
@../schema/030_constraints.sql
@../schema/040_seed_enums.sql
@../schema/050_views.sql

@../packages/ps.pks
@../packages/ps.pkb

@../triggers/ps_entries_mit_limit.trg.sql

prompt == PullSar DB deploy complete ==
