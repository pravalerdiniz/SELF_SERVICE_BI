connection: "graduado"

include: "/**/*.view.lkml"

access_grant: grupo_nome {
  user_attribute: grupo_nome
  allowed_values: ["grupo_nome"]
}

access_grant: grupo_telefone {
  user_attribute: grupo_telefone
  allowed_values: ["grupo_telefone"]
}

access_grant: grupo_endereco {
  user_attribute: grupo_endereco
  allowed_values: ["grupo_endereco"]
}

access_grant: grupo_email {
  user_attribute: grupo_email
  allowed_values: ["grupo_email"]
}

access_grant: grupo_renda {
  user_attribute: grupo_renda
  allowed_values: ["grupo_renda"]
}

datagroup: self_service_bi_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "5 hour"
}

persist_with: self_service_bi_default_datagroup

explore: experimentos_germina {
  view_name: jornada
  persist_for: "1 hours"
  fields: [jornada.id_cpf,
    jornada.etapa,
    jornada.status_etapa,
    jornada.dt_status_date,
    jornada.tipo_proposta,
    tela_atendimento*,
    obj_persona_jornada*,
    experimentos_germina*]

  join: tela_atendimento {
    relationship: many_to_many
    type: left_outer
    sql_on: ${jornada.id_cpf} = ${tela_atendimento.id_cpf} ;;
    fields: [id_chamado,
      login,
      email,
      ds_titulo_chamado,
      ds_sub_titulo_chamado,
      data_chamado_date]
  }

  join: obj_persona_jornada {
    view_label: "Persona - Germina"
    relationship: many_to_one
    type: left_outer
    sql_on: ${jornada.id_cpf} = ${obj_persona_jornada.id_cpf} ;;
    fields: [persona]
  }

  join: experimentos_germina {
    relationship: many_to_many
    type: left_outer
    sql_on: ${obj_persona_jornada.control_group} = ${experimentos_germina.group_id} ;;
  }

}
