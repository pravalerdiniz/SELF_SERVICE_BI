view: payment {
  sql_table_name: "CURTA"."PAYMENT"
    ;;

  dimension: boletos {
    type: string
    sql: ${TABLE}."BOLETOS"
      description:"OBJETO CONTENDO OS BOLETOS A SEREM PAGOS";;
  }
  dimension: cep {
    type: string
    sql: ${TABLE}."CEP"
      description:"CEP DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO";;
  }
  dimension: chave_contrato {
    type: string
    sql: ${TABLE}."CHAVE_CONTRATO"
      description:"CHAVE DE LIGAÇÃO COM O CONTRATO";;
  }
  dimension: cidade {
    type: string
    sql: ${TABLE}."CIDADE"
      description:"CIDADE DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO";;
  }
  dimension: complemento {
    type: string
    sql: ${TABLE}."COMPLEMENTO"
      description:"COMPLEMENTO DO ENREDEÇO DO RESPONSÁVEL PELO PAGAMENT DO BOLETO";;
  }
  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF"
      description:"CPF DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO";;
  }
  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL"
      description:"EMAIL DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO";;
  }
  dimension: estado {
    type: string
    sql: ${TABLE}."ESTADO"
      description:"ESTADO DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO";;
  }
  dimension: id_responsavel_pagamento {
    type: string
    sql: ${TABLE}."ID_RESPONSAVEL_PAGAMENTO"
      description:"IDENTIFICADOR UNICO DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO";;
  }
  dimension: nome {
    type: string
    sql: ${TABLE}."NOME"
      description:"NOME DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO";;
  }
  dimension: numero {
    type: string
    sql: ${TABLE}."NUMERO"
      description:"NUMERO DO ENDEREÇO DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO";;
  }
  dimension: rua {
    type: string
    sql: ${TABLE}."RUA"
      description:"RUA DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO";;
  }
  dimension: telefone {
    type: string
    sql: ${TABLE}."TELEFONE"
      description:"TELEFONE DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO";;
  }
  dimension: ultima_atualizacao {
    type: string
    sql: ${TABLE}."ULTIMA_ATUALIZACAO"
      description:"ULTIMA ATUALIZAÇÃO DOS DADOS DO RESPONSÁVEL PELO PAGAMENTO DO BOLETO";;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
