view: dados_intake {
  derived_table: {
    sql: select '43831' as MesAno,'4258972' as Matriculados,'1225' as Graduacao,'479' as AmigoEdu,'114992,244' as Captcao,'0,09' as Sazonalidade,'0,0148183907081594' as Intake_PRV_AE,'0,0106528923811592' as Intake_PRV,'0,00416549832700021' as Intake_AE
union select '43862' ,'4258972' ,'2270','1156','191653,74','0,15','0,0178759882275191','0,0118442770801133','0,00603171114740573'
union select '43891' ,'4258972' ,'2460','1159','204430,656','0,16','0,0177028243748335','0,0120334202713706','0,00566940410346284'
union select '43922' ,'4258972' ,'629','157','89438,412','0,07','0,00878817034452713','0,00703277245128189','0,00175539789324524'
union select '43952' ,'4258972' ,'330','174','51107,664','0,04','0,00986153466141594','0,00645695721878425','0,0034045774426317'
union select '43983' ,'4258972' ,'311','566','51107,664','0,04','0,0171598529723448','0,00608519301527849','0,0110746599570663'
union select '44013' ,'4258972' ,'432','1173','114992,244','0,09','0,0139574630789882','0,00375677510911084','0,0102006879698773'
union select '44044' ,'4258972' ,'446','1221','166099,908','0,13','0,0100361283764227','0,00268513092734525','0,00735099744907745'
union select '44075' ,'4258972' ,'497','796','127769,16','0,1','0,0101198129501673','0,00388982756089184','0,00622998538927547'
union select '44105' ,'4258972' ,'327','547','51107,664','0,04','0,017101153361265','0,00639825760770439','0,0107028957535606'
union select '44136' ,'4258972' ,'199','807','51107,664','0,04','0,0196839362487787','0,00389374086829717','0,0157901953804815'
union select '44166' ,'4258972' ,'313','513','63884,58','0,05','0,0129295676671898','0,00489946087146538','0,00803010679572441'
union select '44197' ,'4544000,376' ,'801','650','122688,010152','0,09','0,0118267465435484','0,00652875532831309','0,00529799121523534'
union select '44228' ,'4544000,376' ,'1263','1058','204480,01692','0,15','0,0113507424097488','0,00617664268139283','0,00517409972835599'
union select '44256' ,'4544000,376' ,'1322','1220','218112,018048','0,16','0,0116545618290533','0,00606110571912212','0,00559345610993116'
union select '44287' ,'4544000,376' ,'859','1154','95424,007896','0,07','0,0210953201860261','0,00900192749120536','0,0120933926948207'
union select '44317' ,'4544000,376' ,'315','652','54528,004512','0,04','0,0177340067485358','0,00577684811353546','0,0119571586350004'
union select '44348' ,'4544000,376' ,'373','938','54528,004512','0,04','0,0240426916725238','0,0068405217344404','0,0172021699380834'
union select '44378' ,'4544000,376' ,'585','2526','122688,010152','0,09','0,0253570010316879','0,0047681920937118','0,0205888089379761'
union select '44409' ,'4544000,376' ,'677','2532','177216,014664','0,13','0,0181078442943446','0,00382019650584958','0,014287647788495'
union select '44440' ,'4544000,376' ,'291','1116','136320,01128','0,1','0,01032130196285','0,00213468292195405','0,00818661904089596'
union select '44470' ,'4544000,376' ,'142','1229','54528,004512','0,04','0,0251430436941496','0,00260416645118106','0,0225388772429685'
union select '44501' ,'4544000,376' ,'338','2484','54528,004512','0,04','0,0517532234171335','0,00619864972182535','0,0455545736953082'
union select '44531' ,'4544000,376' ,'613','1294','68160,00564','0,05','0,027978284069872','0,00899354385675488','0,0189847402131172'
union select '44562' ,'4822226,370552' ,'2109','4040','130200,112004904','0,09','0,0472273019225083','0,0161981427475313','0,031029159174977'
union select '44593' ,'4822226,370552' ,'3349','6076','217000,18667484','0,15','0,0434331423600235','0,0154331664470789','0,0279999759129446'
       ;;
  }

 dimension: date {
   type: string
  sql: ${TABLE}."MesAno" ;;
 }

 measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: matriculados {
    type: string
    sql: ${TABLE}."matriculados" ;;
    value_format: "0"
  }

  dimension: graduacao {
    type: string
    sql: ${TABLE}."graduacao" ;;
    value_format: "0"
  }

  dimension: amigoedu {
    type: string
    sql: ${TABLE}."amigoedu" ;;
    value_format: "0"
  }

  dimension: captcao {
    type: string
    sql: ${TABLE}."captcao" ;;
    value_format: "0"
  }

  measure: sazonalidade {
    type: sum
    sql: ${TABLE}."sazonalidade" ;;
    value_format: "0"
  }

  measure: intake_prv_ae {
    type: sum
    sql: ${TABLE}."intake_prv_ae" ;;
    value_format: "0"
  }

  measure: intake_prv {
    type: sum
    sql: ${TABLE}."intake_prv" ;;
    value_format: "0"
  }

  measure: intake_ae {
    type: sum
    sql: ${TABLE}."intake_ae" ;;
    value_format: "0"
  }

  set: detail {
    fields: [
      matriculados,
      graduacao,
      amigoedu,
      captcao,
      sazonalidade,
      intake_prv_ae,
      intake_prv,
      intake_ae
    ]
  }
}
