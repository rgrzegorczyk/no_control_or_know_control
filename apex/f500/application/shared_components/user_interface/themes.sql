prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 500
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>29276406284253559
,p_default_application_id=>500
,p_default_id_offset=>0
,p_default_owner=>'RAFAL'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(29475790263373483)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(29323776598373352)
,p_default_dialog_template=>wwv_flow_imp.id(29318543917373348)
,p_error_template=>wwv_flow_imp.id(29308549376373342)
,p_printer_friendly_template=>wwv_flow_imp.id(29323776598373352)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(29308549376373342)
,p_default_button_template=>wwv_flow_imp.id(29472773786373464)
,p_default_region_template=>wwv_flow_imp.id(29399895105373406)
,p_default_chart_template=>wwv_flow_imp.id(29399895105373406)
,p_default_form_template=>wwv_flow_imp.id(29399895105373406)
,p_default_reportr_template=>wwv_flow_imp.id(29399895105373406)
,p_default_tabform_template=>wwv_flow_imp.id(29399895105373406)
,p_default_wizard_template=>wwv_flow_imp.id(29399895105373406)
,p_default_menur_template=>wwv_flow_imp.id(29412219891373412)
,p_default_listr_template=>wwv_flow_imp.id(29399895105373406)
,p_default_irr_template=>wwv_flow_imp.id(29390007153373399)
,p_default_report_template=>wwv_flow_imp.id(29437726801373431)
,p_default_label_template=>wwv_flow_imp.id(29470247102373459)
,p_default_menu_template=>wwv_flow_imp.id(29474383667373465)
,p_default_calendar_template=>wwv_flow_imp.id(29474479914373467)
,p_default_list_template=>wwv_flow_imp.id(29460119901373448)
,p_default_nav_list_template=>wwv_flow_imp.id(29468913497373455)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(29468913497373455)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(29467163409373454)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(29336672431373367)
,p_default_dialogr_template=>wwv_flow_imp.id(29333855366373365)
,p_default_option_label=>wwv_flow_imp.id(29470247102373459)
,p_default_required_label=>wwv_flow_imp.id(29471595391373460)
,p_default_navbar_list_template=>wwv_flow_imp.id(29466707148373453)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/22.2/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_imp.component_end;
end;
/
