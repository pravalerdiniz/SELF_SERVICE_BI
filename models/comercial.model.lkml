connection: "crm"

include: "/**/*.view.lkml"               # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }


explore: instituicao_metas_gc {
  label: "Metas - Grupo"
  view_label: "1. Meta Grupo IES"
  join: dias_uteis
  {
    view_label: "5. Dias Úteis"
    sql_on:  ${instituicao_metas_gc.data_meta_date} = ${dias_uteis.ds_date};;
    type: left_outer
    relationship: many_to_one
  }

  join: engajometro
  {
    view_label: "4. Engajometro"
    sql_on:  ${instituicao_metas_gc.data_meta_date} = ${engajometro.data};;
    type: left_outer
    relationship: many_to_one
  }

  join: meta_conversao_grupo_ies
  {
    view_label: "3. Meta Conversão Grupo IES"
    sql_on:  ${instituicao_metas_gc.data_meta_month} = ${meta_conversao_grupo_ies.data_meta_month} and
      ${instituicao_metas_gc.grupo_instituicao} = ${meta_conversao_grupo_ies.grupo};;
    type: full_outer
    relationship: many_to_one
  }

  join: meta_conv_grupo_ies_new
  {
    view_label: "3. Meta Conversão Grupo IES Novo"
    sql_on:  ${instituicao_metas_gc.data_meta_date} = ${meta_conv_grupo_ies_new.data_meta_date} and
      ${instituicao_metas_gc.grupo_instituicao} = ${meta_conv_grupo_ies_new.grupo};;
    type: left_outer
    relationship: many_to_one
  }

  join: meta_sla_comercial
  {
    view_label: "2. Meta SLA"
    sql_on: ${instituicao_metas_gc.gerente} = ${meta_sla_comercial.gerente};;
    type: left_outer
    relationship: many_to_one
  }

  join: meta_comercial_grupo
  {
    view_label: "6. Meta Mensal Grupo (Simulador)"
    sql_on: ${instituicao_metas_gc.grupo_instituicao} = ${meta_comercial_grupo.grupo};;
    type: left_outer
    relationship: many_to_one
  }

  join: sazonalidade_mensal_meta
  {
    view_label: "7. Sazonalidade (Simulador)"
    sql_on: ${instituicao_metas_gc.data_meta_date} = ${sazonalidade_mensal_meta.date};;
    type: left_outer
    relationship: many_to_one
  }



}

explore: projecao_formalizados {
  label: "Projeção Formalizados Jornada"
  view_label: "Projeção Formalizados Jornada"
}

explore: projecao_formalizados_grupo_ies {
  label: "Projeção Formalizados - Grupo IES"
  view_label: "Projeção Formalizados - Grupo IES"
}




explore: vw_pipedrive_deals_pipeline {
  label: "Pipedrive Graduação"
  view_label: "1. Negócios"

  join: vw_pipedrive_deals_atividades {
    view_label: "2. Atividade"
    sql_on: ${vw_pipedrive_deals_pipeline.id_negocio}=${vw_pipedrive_deals_atividades.id_negocio} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: obj_pipedrive_etapa {
    view_label: "3. Etapas Funil"
    sql_on: ${vw_pipedrive_deals_pipeline.id_negocio} = ${obj_pipedrive_etapa.id_negocio} ;;
    type: left_outer
    relationship: one_to_many
  }
}


explore: aproveitamento_estoque_nok{
  label: "Aproveitamento Estoque"
}

explore: metas_distribuidas {
  label: "Comercial - Metas Distribuídas"
}

explore: simulador_etapas {
  label: "Comercial - Simulador Etapas Funil"
}
