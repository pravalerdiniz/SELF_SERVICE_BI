view: proposta_valor_financiamento_ajuste {
  derived_table: {
    sql: select
id_contrato_final,
proposta_final,
sum(vl_financiamento) as vl_financiamento
from
(SELECT
    to_date(p.data_preenchimento) as DATA_PROPOSTA,
    p.cpf_aluno as cpf,
    p.ds_curso as curso,
    p.tipo_proposta as proposta,
    p.id_contrato as id_contrato,
    p.id_contrato_conjunto as id_contrato_conjunto,
    CASE WHEN p.id_contrato_conjunto is null or p.id_contrato_conjunto = 'BOF-0'
        THEN p.id_contrato
        ELSE p.id_contrato_conjunto END AS id_contrato_final,
    CASE WHEN p.tipo_proposta = 'SEGUNDO REPASSE' THEN 'NOVO'
        ELSE p.tipo_proposta END AS proposta_final,
    sum(p.vl_financiamento) as vl_financiamento
    FROM graduado.self_service_bi.proposta as p
WHERE p.data_preenchimento >=  '2021-01-01'
       AND proposta_final = 'NOVO'
GROUP BY (1,2,3,4,5,6)
ORDER BY DATA_PROPOSTA ASC
) a
where vl_financiamento is not null
GROUP BY (1,2) ;;
persist_for: "1 hour"
  }

  dimension: id_proposta {
    sql: ${TABLE}."ID_CONTRATO_FINAL" ;;
    primary_key: yes
    hidden: yes
  }

  dimension: vl_financiamento_conjunto {
    sql: ${TABLE}."VL_FINANCIAMENTO" ;;
    type: number
    group_label: "Dados do Contrato"
    label: "Valor do Financiamento Final NEW"
    value_format: "$ #,###.00"
    hidden: no
  }
  }
