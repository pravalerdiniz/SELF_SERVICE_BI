view: student {
  sql_table_name: "CURTA"."STUDENT"
    ;;

  dimension: bairro {
    type: string
    sql: ${TABLE}." BAIRRO  ";;
    description:" BAIRRO DO ENDEREÇO DO ALUNO "
  }
  dimension: bairro_fiador {
    type: string
    sql: ${TABLE}." BAIRRO_FIADOR ";;
    description:" BAIRRO DO FIADOR  "
  }
  dimension: cep {
    type: string
    sql: ${TABLE}." CEP ";;
    description:" CEP DO ALUNO  "
  }
  dimension: cep_fiador {
    type: string
    sql: ${TABLE}." CEP_FIADOR  ";;
    description:" CEP DO FIADOR "
  }
  dimension: cidade {
    type: string
    sql: ${TABLE}." CIDADE  ";;
    description:" CIDADE DO ENDEREÇO DO ALUNO "
  }
  dimension: cidade_fiador {
    type: string
    sql: ${TABLE}." CIDADE_FIADOR ";;
    description:" CIDADE DO FIADOR  "
  }
  dimension: complemento_endereco {
    type: string
    sql: ${TABLE}." COMPLEMENTO_ENDERECO  ";;
    description:" COMPLEMENTO DO ENDEREÇO DO ALUNO  "
  }
  dimension: complemento_endereco_fiador {
    type: string
    sql: ${TABLE}." COMPLEMENTO_ENDERECO_FIADOR ";;
    description:" COMPLEMENTO DO ENDEREÇO DO FIADOR "
  }
  dimension: cpf_aluno {
    type: number
    sql: ${TABLE}." CPF_ALUNO ";;
    description:" NUMERO DO CPF DO ALUNO  "
  }
  dimension: cpf_fiador {
    type: number
    sql: ${TABLE}." CPF_FIADOR  ";;
    description:" CPF DO FIADOR "
  }
  dimension: cpf_garantidor {
    type: number
    sql: ${TABLE}." CPF_GARANTIDOR  ";;
    description:" CPF DO GARANTIDOR "
  }
  dimension: cursos {
    type: string
    sql: ${TABLE}." CURSOS  ";;
    description:" CURSOS REALIZADOS PELO ALUNO  "
  }
  dimension_group: data_aceite {
    type: time    timeframes: [ raw, time, date, week, month, quarter, year    ]
    sql: ${TABLE}." DATA_ACEITE ";;
    description:" DATA EM QUE O ALUNO FOI ACEITO NO CURSO "
  }
  dimension_group: data_atualizacao_aluno {
    type: time    timeframes: [ raw, time, date, week, month, quarter, year    ]
    sql: ${TABLE}." DATA_ATUALIZACAO_ALUNO  ";;
    description:" DATA DA ULTIMA ATUALIZAÇÃO DOS DADOS DO ALUNO "
  }
  dimension_group: data_atualizacao_endereco {
    type: time    timeframes: [ raw, time, date, week, month, quarter, year    ]
    sql: ${TABLE}." DATA_ATUALIZACAO_ENDERECO ";;
    description:" DATA DA ULTIMA ATUALIZAÇÃO DO ENDEREÇO DO ALUNO "
  }
  dimension_group: data_atualizacao_endereco_fiador {
    type: time    timeframes: [ raw, time, date, week, month, quarter, year    ]
    sql: ${TABLE}." DATA_ATUALIZACAO_ENDERECO_FIADOR  ";;
    description:" DATA DA ULTIMA ATUALIZAÇÃO DOS DADOS DE ENDEREÇO DO FIADOR  "
  }
  dimension_group: data_atualizacao_fiador {
    type: time    timeframes: [ raw, time, date, week, month, quarter, year    ]
    sql: ${TABLE}." DATA_ATUALIZACAO_FIADOR ";;
    description:" DATA DE ATUALIZACAO DOS DADOS DO FIADOR "
  }
  dimension_group: data_atualizacao_garantidor {
    type: time    timeframes: [ raw, time, date, week, month, quarter, year    ]
    sql: ${TABLE}." DATA_ATUALIZACAO_GARANTIDOR ";;
    description:" DATA DA ULTIMA ATUALIZAÇÃO DOS DADOS DO GARANTIDOR  "
  }
  dimension_group: data_nascimento_aluno {
    type: time    timeframes: [ raw, date, week, month, quarter, year    ]    convert_tz: no    datatype: date
    sql: ${TABLE}." DATA_NASCIMENTO_ALUNO ";;
    description:" DATA DE NASCIMENTO DO ALUNO "
  }
  dimension_group: data_nascimento_fiador {
    type: time    timeframes: [ raw, date, week, month, quarter, year    ]    convert_tz: no    datatype: date
    sql: ${TABLE}." DATA_NASCIMENTO_FIADOR  ";;
    description:" DATA DE NASCIMENTO DO FIADOR  "
  }
  dimension: email_aluno {
    type: string
    sql: ${TABLE}." EMAIL_ALUNO ";;
    description:" E-MAIL DO ALUNO "
  }
  dimension: email_fiador {
    type: string
    sql: ${TABLE}." EMAIL_FIADOR  ";;
    description:" EMAIL DO FIADOR "
  }
  dimension: estado {
    type: string
    sql: ${TABLE}." ESTADO  ";;
    description:" ESTADO DO ENDEREÇO DO ALUNO "
  }
  dimension: estado_civil_garantidor {
    type: string
    sql: ${TABLE}." ESTADO_CIVIL_GARANTIDOR ";;
    description:" ESTADO CIVIL DO GARANTIDOR  "
  }
  dimension: estado_fiador {
    type: string
    sql: ${TABLE}." ESTADO_FIADOR ";;
    description:" ESTADO DO FIADOR  "
  }
  dimension: id_aluno {
    type: string
    sql: ${TABLE}." ID_ALUNO  ";;
    description:" IDENTIFICAR ÚNICO DO ALUNO  "
  }
  dimension: id_fiador {
    type: string
    sql: ${TABLE}." ID_FIADOR ";;
    description:" IDENTIFICADOR UNICO DO FIADOR "
  }
  dimension: id_ocupacao {
    type: string
    sql: ${TABLE}." ID_OCUPACAO ";;
    description:" IDENTIFICARDO DA OCUPAÇÃO DO GARANTIDOR "
  }
  dimension: nome_aluno {
    type: string
    sql: ${TABLE}." NOME_ALUNO  ";;
    description:" NOME DO ALUNO "
  }
  dimension: nome_fiador {
    type: string
    sql: ${TABLE}." NOME_FIADOR ";;
    description:" NOME DO FIADOR  "
  }
  dimension: nome_garantidor {
    type: string
    sql: ${TABLE}." NOME_GARANTIDOR ";;
    description:" NOME DO GARANTIDOR  "
  }
  dimension: numero_endereco {
    type: string
    sql: ${TABLE}." NUMERO_ENDERECO ";;
    description:" NUMERO DO ENDEREÇO DO ALUNO "
  }
  dimension: numero_endereco_fiador {
    type: string
    sql: ${TABLE}." NUMERO_ENDERECO_FIADOR  ";;
    description:" NUMERO DO ENDEREÇO DO FIADOR  "
  }
  dimension: parentesco {
    type: string
    sql: ${TABLE}." PARENTESCO  ";;
    description:" PARENTESCO ENTRE GARANTIDOR E ALUNO "
  }
  dimension: renda_aluno {
    type: number
    sql: ${TABLE}." RENDA_ALUNO ";;
    description:" RENDA INFORMADA PELO ALUNO  "
  }
  dimension: renda_fiador {
    type: number
    sql: ${TABLE}." RENDA_FIADOR  ";;
    description:" RENDA INFORMADA PELO FIADOR "
  }
  dimension: renda_garantidor {
    type: number
    sql: ${TABLE}." RENDA_GARANTIDOR  ";;
    description:" RENDA INFORMADA PELO GARANTIDOR "
  }
  dimension: rua {
    type: string
    sql: ${TABLE}." RUA ";;
    description:" RUA DO ENDEREÇO DO ALUNO  "
  }
  dimension: rua_fiador {
    type: string
    sql: ${TABLE}." RUA_FIADOR  ";;
    description:" RUA DO FIADOR "
  }
  dimension: telefone_aluno_1 {
    type: string
    sql: ${TABLE}." TELEFONE_ALUNO_1  ";;
    description:" TELEFONE PRINCIPAL DO ALUNO "
  }
  dimension: telefone_aluno_2 {
    type: string
    sql: ${TABLE}." TELEFONE_ALUNO_2  ";;
    description:" TELEFONE SECUNDÁRIO DO ALUNO  "
  }
  dimension: telefone_primario_fiador {
    type: string
    sql: ${TABLE}." TELEFONE_PRIMARIO_FIADOR  ";;
    description:" TELEFONE PRIMARIO DO FIADOR "
  }
  dimension: telefone_secundario_fiador {
    type: string
    sql: ${TABLE}." TELEFONE_SECUNDARIO_FIADOR  ";;
    description:" TELEFONE SECUNDARIO DO FIADOR "
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
