prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 500
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>29276406284253559
,p_default_application_id=>500
,p_default_id_offset=>0
,p_default_owner=>'RAFAL'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(29501281094373541)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/