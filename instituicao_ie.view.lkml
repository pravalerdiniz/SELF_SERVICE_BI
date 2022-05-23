view: instituicao_ie {
  derived_table: {
    sql: select distinct ID_INSTITUICAO, CNPJ_IE, NOME_FANTASIA, RAZAO_SOCIAL, IE_ATIVA, IE_SUPER_PRAVALER, MODELO_CONTRATO, REPROVA_POR_SCORE, DS_MANTENEDOR
from "GRADUADO"."SELF_SERVICE_BI"."INSTITUICAO" ;;
}

  dimension: id_instituicao {
    type: string
    group_label: "Dados da Instituição"
    label: "ID da Instituição"
    description:"Indica o ID da Instituição de Ensino cadastrado no Backoffice."
    sql: ${TABLE}."ID_INSTITUICAO";;
  }

}
