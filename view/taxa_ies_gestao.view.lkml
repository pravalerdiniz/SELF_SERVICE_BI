view: taxa_ies_gestao {
    derived_table: {
      sql: select
              id_instituicao,
              g.value:ID_PRODUTO::int as id_produto,
              g.value:CONTRATACAO::int as numero_contracao,
              g.value:MULTIPLICADOR_PARCELA::int as multiplicador_parcela,
              g.value:TX_ADESAO::float as taxa_adesao
              g.value:TX_ADM::float as taxa_adesao
              g.value:TX_COMISSAO::float as taxa_adesao
              g.value:TX_FEE_MENSAL::float as taxa_adesao
              g.value:TX_FEE_UNICO::float as taxa_adesao
              g.value:TX_JUROS::float as taxa_adesao

          from GRADUADO.SELF_SERVICE_BI.INSTITUICAO a,
          lateral flatten (input => gestao) g
               ;;
    }



   }
