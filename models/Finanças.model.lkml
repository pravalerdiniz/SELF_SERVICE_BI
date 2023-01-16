connection: "pos_graduado"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

access_grant: grupo_nome {
  user_attribute: grupo_nome
  allowed_values: ["grupo_nome"]

}
datagroup: pdd_gestao_default_datagroup {

  max_cache_age: "12 hour"
}
persist_with: pdd_gestao_default_datagroup


# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
 explore: pdd_gestao_garantido {
  persist_for: "24 hour"
  from: pdd_gestao_garantido
  label: "PDD Gestão Garantido"
  view_label: "PDD Gestão Garantido"
  description: "Mostra as informações de PDD para o Gestão Garantido."

 }

explore: processo_wo {
  persist_for: "1 hour"
  from: processo_wo
  label: "Processo WO"
  view_label: "Processo WO"
  description: "Mostra informações dos títulos que estão qualificados para serem marcados em WO no backoffice e OT."

}

explore: ot_consolidado {
  persist_for: "12 hour"
  from: ot_consolidado
  label: "OT Consolidado"
  view_label: "OT Consolidado"
  description: "Mostra as informações histórica da OT, sepearando por safra, fundo e data de referência."

}
