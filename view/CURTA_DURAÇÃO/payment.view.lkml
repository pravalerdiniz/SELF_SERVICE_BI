view: payment {
  sql_table_name: "CURTA"."PAYMENT"
    ;;

  dimension: boletos {
    type: string
    sql: ${TABLE}."BOLETOS";;
      description:"OBJETO CONTENDO OS BOLETOS A SEREM PAGOS"
      hidden: yes
  }

  dimension: cep {
    type: string
    sql: ${TABLE}."CEP";;
      description:"CEP DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO"
      group_item_label: "CEP"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: chave_contrato {
    type: string
    sql: ${TABLE}."CHAVE_CONTRATO";;
      description:"CHAVE DE LIGAÇÃO COM O CONTRATO"
      hidden: yes
  }
  dimension: cidade {
    type: string
    sql: ${TABLE}."CIDADE";;
      description:"CIDADE DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO"
      group_item_label: "Cidade"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: complemento {
    type: string
    sql: ${TABLE}."COMPLEMENTO";;
      description:"COMPLEMENTO DO ENREDEÇO DO RESPONSÁVEL PELO PAGAMENT DO BOLETO"
      group_item_label: "Complemento Endereço"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF";;
      description:"CPF DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO"
      group_item_label: "CPF"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL";;
      description:"EMAIL DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO"
      group_item_label: "E-mail"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: estado {
    type: string
    sql: ${TABLE}."ESTADO";;
      description:"ESTADO DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO"
      group_item_label: "Estado"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: id_responsavel_pagamento {
    type: string
    sql: ${TABLE}."ID_RESPONSAVEL_PAGAMENTO";;
      description:"IDENTIFICADOR UNICO DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO"
      group_item_label: "Id do Responsável"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: nome {
    type: string
    sql: ${TABLE}."NOME";;
      description:"NOME DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO"
      group_item_label: "Nome"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: numero {
    type: string
    sql: ${TABLE}."NUMERO";;
      description:"NUMERO DO ENDEREÇO DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO"
      group_item_label: "Numero da Residencia"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: rua {
    type: string
    sql: ${TABLE}."RUA";;
      description:"RUA DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO"
      group_item_label: "Rua"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: telefone {
    type: string
    sql: ${TABLE}."TELEFONE";;
      description:"TELEFONE DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO"
      group_item_label: "Telefone"
    group_label: "Dados Responsável Financeiro"
  }
  dimension_group: ultima_atualizacao {
    type: time    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    datatype: date
    sql: ${TABLE}."ULTIMA_ATUALIZACAO";;
      description:"ULTIMA ATUALIZAÇÃO DOS DADOS DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO"
      group_item_label: "Data da Ultima Atualização"
    group_label: "Dados Responsável Financeiro"
  }

measure: count_cpf_distinct {
  type: count_distinct
  sql: ${cpf} ;;
  group_label: "Quantidade de CPF"
  group_item_label: "Valor"
  description: "Indica a quantidade de CPF dos alunos do Curta Duração"
  drill_fields: []

}

  measure: perc_cpf_distinct {
    type: percent_of_total
    sql: ${count_cpf_distinct} ;;
    group_label: "Quantidade de CPF"
    group_item_label: "Porcentagem"
    description: "Indica a porcentagem da quantidade de CPF dos alunos do Curta Duração"
    drill_fields: []

  }

  measure: count {
    type: count
    drill_fields: []
  }
}
