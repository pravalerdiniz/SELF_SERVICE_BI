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
