view: proposta_sem_fiador {
    derived_table: {
      persist_for: "1 hour"
      sql: select
          concat('BOF-',f.value:ids:proposal_id) as ID_PROPOSTA,
          last_sync_data:data:proposal:without_guarantor::int as WITHOUT_GUARANTOR,
          last_sync_data:data:proposal:elected_without_guarantor::int as ELECTED_WITHOUT_GUARANTOR
          from BICHO.DOCDB.DOCDB_INTEGRATIONS a,
          lateral flatten (input => last_sync_data:systems) f
          where last_sync_data:data:proposal:without_guarantor is not null
          or last_sync_data:data:proposal:elected_without_guarantor is not null
          and f.value:ids:proposal_id is not null ;;
    }


dimension: sem_fiador_elegivel {
  type: string
  sql: ${TABLE}."WITHOUT_GUARANTOR" ;;
  hidden: no
  label: "Flag Eleito - Sem Fiador Teste A/B"
  group_label: "Sem Fiador - Teste A/B"

}

dimension: sem_fiador_eleito {
  type: string
  sql: ${TABLE}."ELECTED_WITHOUT_GUARANTOR" ;;
  hidden: no
  label: "Flag Eleito - Sem Fiador Teste A/B"
  group_label: "Sem Fiador - Teste A/B"
  }

dimension: id_proposta {
  type:  string
  sql: ${TABLE}."ID_PROPOSTA" ;;
  hidden: yes
}


}
