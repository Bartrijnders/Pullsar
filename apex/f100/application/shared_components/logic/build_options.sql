prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.7'
,p_default_workspace_id=>8059848450878557
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'PULLSAR'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(8066341704887913)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>45084269092862
);
wwv_flow_imp.component_end;
end;
/
