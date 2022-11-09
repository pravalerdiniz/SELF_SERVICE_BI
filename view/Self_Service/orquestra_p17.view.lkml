view: orquestra_p17 {
  sql_table_name: "CS"."ORQUESTRA_P17"
    ;;


  dimension: acordotrocadevencimento {
    type: string
    sql: ${TABLE}."ACORDOTROCADEVENCIMENTO" ;;
  }

  dimension: alunojapagoualgumaparcela {
    type: string
    sql: ${TABLE}."ALUNOJAPAGOUALGUMAPARCELA" ;;
  }

  dimension: analiseefetuada {
    type: string
    sql: ${TABLE}."ANALISEEFETUADA" ;;
  }

  dimension: analiserealizada {
    type: string
    sql: ${TABLE}."ANALISEREALIZADA" ;;
  }

  dimension: analisesolicitacaorealizadapelaarea {
    type: string
    sql: ${TABLE}."ANALISESOLICITACAOREALIZADAPELAAREA" ;;
  }

  dimension: anexo {
    type: string
    sql: ${TABLE}."ANEXO" ;;
  }

  dimension: apessoaestanobancodedados {
    type: string
    sql: ${TABLE}."APESSOAESTANOBANCODEDADOS" ;;
  }

  dimension: area {
    type: string
    sql: ${TABLE}."AREA" ;;
  }

  dimension: area_executor {
    type: string
    sql: ${TABLE}."AREA_EXECUTOR" ;;
  }

  dimension: area_requisitante {
    type: string
    sql: ${TABLE}."AREA_REQUISITANTE" ;;
  }

  dimension: arquivo {
    type: string
    sql: ${TABLE}."ARQUIVO" ;;
  }

  dimension: assuntoprincipalcontatocorrecao {
    type: string
    sql: ${TABLE}."ASSUNTOPRINCIPALCONTATOCORRECAO" ;;
  }

  dimension: assuntoprincipaldocontato {
    type: string
    sql: ${TABLE}."ASSUNTOPRINCIPALDOCONTATO" ;;
  }

  dimension: assuntoprincipaldocontato2 {
    type: string
    sql: ${TABLE}."ASSUNTOPRINCIPALDOCONTATO2" ;;
  }

  dimension: automacaomarketingonline {
    type: string
    sql: ${TABLE}."AUTOMACAOMARKETINGONLINE" ;;
  }

  dimension: automacaotier2_trocadestatus {
    type: string
    sql: ${TABLE}."AUTOMACAOTIER2TROCADESTATUS" ;;
  }

  dimension: autorizanovaanalisedaies {
    type: string
    sql: ${TABLE}."AUTORIZANOVAANALISEDAIES" ;;
  }

  dimension: avaliacaodaexcecao {
    type: string
    sql: ${TABLE}."AVALIACAODAEXCECAO" ;;
  }

  dimension: casodepfies {
    type: string
    sql: ${TABLE}."CASODEPFIES" ;;
  }

  dimension: categoria {
    type: string
    sql: ${TABLE}."CATEGORIA" ;;
  }

  dimension: cep {
    type: string
    sql: ${TABLE}."CEP" ;;
  }

  dimension: chamadocentralatendimento {
    type: string
    sql: ${TABLE}."CHAMADOCENTRALATENDIMENTO" ;;
  }

  dimension: codigo_resultado {
    type: number
    sql: ${TABLE}."CODIGO_RESULTADO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_codigo_resultado {
    type: sum
    sql: ${codigo_resultado} ;;
  }

  measure: average_codigo_resultado {
    type: average
    sql: ${codigo_resultado} ;;
  }

  dimension: compradecarteira {
    type: string
    sql: ${TABLE}."COMPRADECARTEIRA" ;;
  }

  dimension: comunicacaodisparadaporitau {
    type: string
    sql: ${TABLE}."COMUNICACAODISPARADAPORITAU" ;;
  }

  dimension: cpf {
    type: string
    sql: ${TABLE}."CPF" ;;
  }

  dimension: cpf_2 {
    type: string
    sql: ${TABLE}."CPF_2" ;;
  }

  dimension: cpf_do_aluno {
    type: string
    sql: ${TABLE}."CPF_DO_ALUNO" ;;
  }

  dimension: cpfdocliente {
    type: string
    sql: ${TABLE}."CPFDOCLIENTE" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_atualizacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
  }

  dimension_group: data_carga {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_CARGA" ;;
  }

  dimension_group: data_expectativa_conclusao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_EXPECTATIVA_CONCLUSAO" ;;
  }

  dimension_group: data_fim_task {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_FIM_TASK" ;;
  }

  dimension_group: data_inicio_task {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_INICIO_TASK" ;;
  }

  dimension: descrevaoretornodocaso {
    type: string
    sql: ${TABLE}."DESCREVAORETORNODOCASO" ;;
  }

  dimension: descricao_resultado {
    type: string
    sql: ${TABLE}."DESCRICAO_RESULTADO" ;;
  }

  dimension: descricaodasolicitacao {
    type: string
    sql: ${TABLE}."DESCRICAODASOLICITACAO" ;;
  }

  dimension: descricaodasolicitacaodeexclusao {
    type: string
    sql: ${TABLE}."DESCRICAODASOLICITACAODEEXCLUSAO" ;;
  }

  dimension: descricaodasolicitao_2 {
    type: string
    sql: ${TABLE}."DESCRICAODASOLICITAO_2" ;;
  }

  dimension: detalhamento_solicitacao {
    type: string
    sql: ${TABLE}."DETALHAMENTO_SOLICITACAO" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: emaildoaluno {
    type: string
    sql: ${TABLE}."EMAILDOALUNO" ;;
  }

  dimension: emaildocliente {
    type: string
    sql: ${TABLE}."EMAILDOCLIENTE" ;;
  }

  dimension: endereco {
    type: string
    sql: ${TABLE}."ENDERECO" ;;
  }

  dimension: enviarpara {
    type: string
    sql: ${TABLE}."ENVIARPARA" ;;
  }

  dimension: flg_primeira_task {
    type: string
    sql: ${TABLE}."FLG_PRIMEIRA_TASK" ;;
  }

  dimension: flg_processo_em_andamento {
    type: yesno
    sql: ${TABLE}."FLG_PROCESSO_EM_ANDAMENTO" ;;
  }

  dimension: flg_task_em_andamento {
    type: yesno
    sql: ${TABLE}."FLG_TASK_EM_ANDAMENTO" ;;
  }

  dimension: flg_task_sem_atraso {
    type: yesno
    sql: ${TABLE}."FLG_TASK_SEM_ATRASO" ;;
  }

  dimension: flg_ultima_task {
    type: string
    sql: ${TABLE}."FLG_ULTIMA_TASK" ;;
  }

  dimension: flg_ultima_task_manual {
    type: yesno
    sql: ${TABLE}."FLG_ULTIMA_TASK_MANUAL" ;;
  }

  dimension: id_instance_task {
    type: number
    sql: ${TABLE}."ID_INSTANCE_TASK" ;;
  }

  dimension: id_supervisao {
    type: string
    sql: ${TABLE}."ID_SUPERVISAO" ;;
  }

  dimension: ies {
    type: string
    sql: ${TABLE}."IES" ;;
  }

  dimension: ies1 {
    type: string
    sql: ${TABLE}."IES1" ;;
  }

  dimension: iesdoaluno {
    type: string
    sql: ${TABLE}."IESDOALUNO" ;;
  }

  dimension: incluirinfobaseconhecimento {
    type: string
    sql: ${TABLE}."INCLUIRINFOBASECONHECIMENTO" ;;
  }

  dimension: lead_time_task {
    type: string
    sql: ${TABLE}."LEAD_TIME_TASK" ;;
  }

  dimension: login_executor {
    type: string
    sql: ${TABLE}."LOGIN_EXECUTOR" ;;
  }

  dimension: login_requisitante {
    type: string
    sql: ${TABLE}."LOGIN_REQUISITANTE" ;;
  }

  dimension: matricula {
    type: string
    sql: ${TABLE}."MATRICULA" ;;
  }

  dimension_group: max_data_chamado {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."MAX_DATA_CHAMADO" ;;
  }

  dimension_group: min_data_chamado {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."MIN_DATA_CHAMADO" ;;
  }

  dimension: motivo_contato {
    type: string
    sql: ${TABLE}."MOTIVO_CONTATO" ;;
  }

  dimension: motivodaaberturadochamado {
    type: string
    sql: ${TABLE}."MOTIVODAABERTURADOCHAMADO" ;;
  }

  dimension: motivodaexcecao {
    type: string
    sql: ${TABLE}."MOTIVODAEXCECAO" ;;
  }

  dimension: motivodecancelamento {
    type: string
    sql: ${TABLE}."MOTIVODECANCELAMENTO" ;;
  }

  dimension: nome_executor {
    type: string
    sql: ${TABLE}."NOME_EXECUTOR" ;;
  }

  dimension: nome_fila {
    type: string
    sql: ${TABLE}."NOME_FILA" ;;
  }

  dimension: nome_requisitante {
    type: string
    sql: ${TABLE}."NOME_REQUISITANTE" ;;
  }

  dimension: nome_task {
    type: string
    sql: ${TABLE}."NOME_TASK" ;;
  }

  dimension: nomecompleto {
    type: string
    sql: ${TABLE}."NOMECOMPLETO" ;;
  }

  dimension: nomedoaluno {
    type: string
    sql: ${TABLE}."NOMEDOALUNO" ;;
  }

  dimension: nomedoaluno2 {
    type: string
    sql: ${TABLE}."NOMEDOALUNO2" ;;
  }

  dimension: nomedoaluno3 {
    type: string
    sql: ${TABLE}."NOMEDOALUNO3" ;;
  }

  dimension: nomedocurso {
    type: string
    sql: ${TABLE}."NOMEDOCURSO" ;;
  }

  dimension: numero_chamado {
    type: number
    sql: ${TABLE}."NUMERO_CHAMADO" ;;
  }

  dimension: numerochamadoematraso {
    type: string
    sql: ${TABLE}."NUMEROCHAMADOEMATRASO" ;;
  }

  dimension: numerodocontratoqueelequercancelar {
    type: string
    sql: ${TABLE}."NUMERODOCONTRATOQUEELEQUERCANCELAR" ;;
  }

  dimension: numerototaldeparcelasemcontrato {
    type: string
    sql: ${TABLE}."NUMEROTOTALDEPARCELASEMCONTRATO" ;;
  }

  dimension: obj_mensagens {
    type: string
    sql: ${TABLE}."OBJ_MENSAGENS" ;;
  }

  dimension: observacaoanalise {
    type: string
    sql: ${TABLE}."OBSERVACAOANALISE" ;;
  }

  dimension: observacoes1 {
    type: string
    sql: ${TABLE}."OBSERVACOES1" ;;
  }

  dimension: observacoes3 {
    type: string
    sql: ${TABLE}."OBSERVACOES3" ;;
  }

  dimension: observacoes4 {
    type: string
    sql: ${TABLE}."OBSERVACOES4" ;;
  }

  dimension: observacoesdaanalise {
    type: string
    sql: ${TABLE}."OBSERVACOESDAANALISE" ;;
  }

  dimension: observacoesdocontatocomoaluno {
    type: string
    sql: ${TABLE}."OBSERVACOESDOCONTATOCOMOALUNO" ;;
  }

  dimension: observacoessobreenviodecasoaies {
    type: string
    sql: ${TABLE}."OBSERVACOESSOBREENVIODECASOAIES" ;;
  }

  dimension: observasoes2 {
    type: string
    sql: ${TABLE}."OBSERVASOES2" ;;
  }

  dimension: origemdasolicitacao {
    type: string
    sql: ${TABLE}."ORIGEMDASOLICITACAO" ;;
  }

  dimension: posicao_executor {
    type: string
    sql: ${TABLE}."POSICAO_EXECUTOR" ;;
  }

  dimension: posicao_requisitante {
    type: string
    sql: ${TABLE}."POSICAO_REQUISITANTE" ;;
  }

  dimension: precisareanaliseinterfile {
    type: string
    sql: ${TABLE}."PRECISAREANALISEINTERFILE" ;;
  }

  dimension: printdoemail {
    type: string
    sql: ${TABLE}."PRINTDOEMAIL" ;;
  }

  dimension: printdoerro {
    type: string
    sql: ${TABLE}."PRINTDOERRO" ;;
  }

  dimension: qualasuasolicitacao {
    type: string
    sql: ${TABLE}."QUALASUASOLICITACAO" ;;
  }

  dimension: qualonumerodocontrato {
    type: string
    sql: ${TABLE}."QUALONUMERODOCONTRATO" ;;
  }

  dimension: rendaatualizada {
    type: string
    sql: ${TABLE}."RENDAATUALIZADA" ;;
  }

  dimension: resumo_solicitacao {
    type: string
    sql: ${TABLE}."RESUMO_SOLICITACAO" ;;
  }

  dimension: retorno {
    type: string
    sql: ${TABLE}."RETORNO" ;;
  }

  dimension: selecione_1_opcao {
    type: string
    sql: ${TABLE}."SELECIONE_1_OPCAO" ;;
  }

  dimension: selecione_opcao {
    type: string
    sql: ${TABLE}."SELECIONE_OPCAO" ;;
  }

  dimension: sla {
    type: string
    sql: ${TABLE}."SLA" ;;
  }

  dimension: status_processo {
    type: string
    sql: ${TABLE}."STATUS_PROCESSO" ;;
  }

  dimension: status_task {
    type: string
    sql: ${TABLE}."STATUS_TASK" ;;
  }

  dimension: subcategoria_app {
    type: string
    sql: ${TABLE}."SUBCATEGORIA_APP" ;;
  }

  dimension: subcategoria_boletos {
    type: string
    sql: ${TABLE}."SUBCATEGORIA_BOLETOS" ;;
  }

  dimension: subcategoria_canais_ies {
    type: string
    sql: ${TABLE}."SUBCATEGORIA_CANAIS_IES" ;;
  }

  dimension: subcategoria_cessao {
    type: string
    sql: ${TABLE}."SUBCATEGORIA_CESSAO" ;;
  }

  dimension: subcategoria_cobranca {
    type: string
    sql: ${TABLE}."SUBCATEGORIA_COBRANCA" ;;
  }

  dimension: subcategoria_compra_carteira {
    type: string
    sql: ${TABLE}."SUBCATEGORIA_COMPRA_CARTEIRA" ;;
  }

  dimension: subcategoria_contratacao_form {
    type: string
    sql: ${TABLE}."SUBCATEGORIA_CONTRATACAO_FORM" ;;
  }

  dimension: subcategoria_infra_devops {
    type: string
    sql: ${TABLE}."SUBCATEGORIA_INFRA_DEVOPS" ;;
  }

  dimension: subcategoria_portal {
    type: string
    sql: ${TABLE}."SUBCATEGORIA_PORTAL" ;;
  }

  dimension: subcategoria_proposta {
    type: string
    sql: ${TABLE}."SUBCATEGORIA_PROPOSTA" ;;
  }

  dimension: subcategoria_risco {
    type: string
    sql: ${TABLE}."SUBCATEGORIA_RISCO" ;;
  }

  dimension: subcategoria_sem_fiador {
    type: string
    sql: ${TABLE}."SUBCATEGORIA_SEM_FIADOR" ;;
  }

  dimension: subcategoria_site {
    type: string
    sql: ${TABLE}."SUBCATEGORIA_SITE" ;;
  }

  dimension: supervisorresponsavel {
    type: string
    sql: ${TABLE}."SUPERVISORRESPONSAVEL" ;;
  }

  dimension: telefonecelular {
    type: string
    sql: ${TABLE}."TELEFONECELULAR" ;;
  }

  dimension: temcontratacaocedida {
    type: string
    sql: ${TABLE}."TEMCONTRATACAOCEDIDA" ;;
  }

  dimension: tempo_desde_abertura_horas {
    type: string
    sql: ${TABLE}."TEMPO_DESDE_ABERTURA_HORAS" ;;
  }

  dimension: ticketzendesk {
    type: string
    sql: ${TABLE}."TICKETZENDESK" ;;
  }

  dimension: ticketzendesk2 {
    type: string
    sql: ${TABLE}."TICKETZENDESK2" ;;
  }

  dimension: ticketzendesk3 {
    type: string
    sql: ${TABLE}."TICKETZENDESK3" ;;
  }

  dimension: ticketzendesk4 {
    type: string
    sql: ${TABLE}."TICKETZENDESK4" ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
  }

  dimension: tratativadocaso {
    type: string
    sql: ${TABLE}."TRATATIVADOCASO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
