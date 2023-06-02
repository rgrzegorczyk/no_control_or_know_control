prompt --application/shared_components/files/icons_app_icon_32_png
begin
--   Manifest
--     APP STATIC FILES: 500
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>29276406284253559
,p_default_application_id=>500
,p_default_id_offset=>0
,p_default_owner=>'RAFAL'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000000017352474200AECE1CE9000000E149444154584763CC6B9DF19F610001E3A8034643603404864C08488B0A30C84B8AE02C318E9DB9C8F0F5E71F066E5E7E924A';
wwv_flow_imp.g_varchar2_table(2) := '15A2CB012B3D1506371B139C864F59BC012CF7F0D94B921C415507A82AC933DCBEF790244750CD0147CF5F63387FE5163814AEDDB8C520262D47545450CD01C8B6ED3A7286E1D8A53BB477C0BDC7CF19946425312CA28B03409680002861C2D82AF2D260';
wwv_flow_imp.g_varchar2_table(3) := '07D1D40130CB6096836874319A3A006421AEA087C505CD1D402875D1CD01A3891056348F2642F44449934448A83A4676C4EEA36789AE1189AE0B08653D72E5471D301A02A32130E0210000170DD8610075983D0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(29499022720373533)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
