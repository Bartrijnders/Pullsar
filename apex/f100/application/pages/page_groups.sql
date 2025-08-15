prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.7'
,p_default_workspace_id=>8059848450878557
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'PULLSAR'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(8072469378888017)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/
