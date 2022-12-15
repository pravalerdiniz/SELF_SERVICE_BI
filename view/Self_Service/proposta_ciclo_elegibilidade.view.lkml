view: proposta_ciclo_eligibilidade {
  derived_table: {
    persist_for: "1 hour"
    sql: with semestre_gerado as (SELECT
    pro.CPF_ALUNO,
    pro.id_proposta,
    jor.ETAPA,
    jor.DT_STATUS,
    pro.SEMESTRE_FINANCIADO,
    pro.tipo_proposta,
    concat(year(dt_status),'/',case when month(dt_status) in ('1','2','3','4','5','6') then  '1' else '2' end) as semestre_gerado

FROM GRADUADO.SELF_SERVICE_BI.JORNADA jor
LEFT JOIN GRADUADO.SELF_SERVICE_BI.PROPOSTA pro ON (pro.ID_PROPOSTA) = (jor.ID_PROPOSTA)
WHERE DT_STATUS >= '2021-01-01'
AND ETAPA IN ('Finalizado', 'Iniciado / Elegivel')
AND STATUS_ETAPA = 1
AND pro.TIPO_PROPOSTA IN ('NOVO', 'RENOVACAO')
qualify row_number() over (partition by cpf_aluno, semestre_financiado order by dt_status desc) = 1)

select pro.cpf_aluno, pro.id_proposta, jor.etapa, jor.dt_status, pro.tipo_proposta,
case when pro.tipo_proposta = 'NOVO' then (case when pro.semestre_financiado >= semestre_gerado.semestre_gerado then pro.semestre_financiado else semestre_gerado.semestre_gerado end)
when pro.tipo_proposta = 'RENOVAÇÃO' then pro.semestre_financiado else pro.semestre_financiado end as semestre_financiado_final
FROM GRADUADO.SELF_SERVICE_BI.JORNADA jor
LEFT JOIN GRADUADO.SELF_SERVICE_BI.PROPOSTA pro ON (pro.ID_PROPOSTA) = (jor.ID_PROPOSTA)
inner join semestre_gerado on semestre_gerado.id_proposta = pro.id_proposta
where jor.DT_STATUS >= '2021-01-01'
and JOR.etapa in ('Aprovado Instituicao', 'Aprovado Risco', 'Aprovado Behavior', 'Iniciado / Elegivel', 'Finalizado', 'Formalizado', 'Cedido', 'Aguardando Documento', 'Aguardando Assinatura')
AND STATUS_ETAPA = 1
AND pro.TIPO_PROPOSTA IN ('NOVO', 'RENOVACAO')
AND pro.TIPO_PRODUTO not in ('COMPRA DE CARTEIRA', 'FIES')
qualify row_number() over (partition by pro.cpf_aluno, semestre_financiado_final order by jor.dt_status desc) = 1
 ;;
  }}
