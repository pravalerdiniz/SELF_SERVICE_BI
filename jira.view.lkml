view: jira {
  derived_table: {
    sql: select
      jr.*,
      cluster.ds as cluster,
      email.ds as EMAIL,
      OriLe.ds as ORIGEM_LEAD,
      par.ds as Parceira,
      Cargo.ds as Cargo,
      resp.ds as Responsavel,
      Site.ds as Site,
      Telefone.ds as Telefone,
      tk.ds as Ticket_medio,
      Tipo.ds as Tipo
      from "GRADUADO"."AD_HOC"."JIRA" jr
      left join (select max("IssueUpdatedDate"), "IssueKey" ik, "ItemFromString" ds from stage.public.jIRA_fields where "ItemFieldType" ilike 'custom' and "ItemField" ilike 'Cluster' group by 2,3) cluster
      on cluster.ik = jr."Key"
      left join (select max("IssueUpdatedDate"), "IssueKey" ik, "ItemFromString" ds from stage.public.jIRA_fields where "ItemFieldType" ilike 'custom' and "ItemField" ilike 'E-mail' group by 2,3) email
      on email.ik = jr."Key"
      left join (select max("IssueUpdatedDate"), "IssueKey" ik, "ItemFromString" ds from stage.public.jIRA_fields where "ItemFieldType" ilike 'custom' and "ItemField" ilike 'Origem Lead' group by 2,3) OriLe
      on OriLe.ik = jr."Key"
      left join (select max("IssueUpdatedDate"), "IssueKey" ik, "ItemFromString" ds from stage.public.jIRA_fields where "ItemFieldType" ilike 'custom' and "ItemField" ilike 'Parceira' group by 2,3) par
      on par.ik = jr."Key"
      left join (select max("IssueUpdatedDate"), "IssueKey" ik, "ItemFromString" ds from stage.public.jIRA_fields where "ItemFieldType" ilike 'custom' and "ItemField" ilike 'Cargo' group by 2,3) Cargo
      on Cargo.ik = jr."Key"
      left join (select max("IssueUpdatedDate"), "IssueKey" ik, "ItemFromString" ds from stage.public.jIRA_fields where "ItemFieldType" ilike 'custom' and "ItemField" ilike 'Responsável' group by 2,3) resp
      on resp.ik = jr."Key"
      left join (select max("IssueUpdatedDate"), "IssueKey" ik, "ItemFromString" ds from stage.public.jIRA_fields where "ItemFieldType" ilike 'custom' and "ItemField" ilike 'Site' group by 2,3) Site
      on Site.ik = jr."Key"
      left join (select max("IssueUpdatedDate"), "IssueKey" ik, "ItemFromString" ds from stage.public.jIRA_fields where "ItemFieldType" ilike 'custom' and "ItemField" ilike 'Telefone' group by 2,3) Telefone
      on Telefone.ik = jr."Key"
      left join (select max("IssueUpdatedDate"), "IssueKey" ik, "ItemToString" ds from stage.public.jIRA_fields where "ItemFieldType" ilike 'custom' and "ItemField" ilike 'Ticket Médio' group by 2,3) tk
      on tk.ik = jr."Key"
      left join (select max("IssueUpdatedDate"), "IssueKey" ik, "ItemFromString" ds from stage.public.jIRA_fields where "ItemFieldType" ilike 'custom' and "ItemField" ilike 'Tipo' group by 2,3) Tipo
      on Tipo.ik = jr."Key"
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}."Id" ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}."Key" ;;
  }

  dimension: issue_type_id {
    type: string
    sql: ${TABLE}."IssueTypeId" ;;
  }

  dimension: issue_type_name {
    type: string
    sql: ${TABLE}."IssueTypeName" ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}."ProjectId" ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}."ProjectName" ;;
  }

  dimension: project_key {
    type: string
    sql: ${TABLE}."ProjectKey" ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}."ParentId" ;;
  }

  dimension: parent_key {
    type: string
    sql: ${TABLE}."ParentKey" ;;
  }

  dimension: resolution_id {
    type: string
    sql: ${TABLE}."ResolutionId" ;;
  }

  dimension: resolution_name {
    type: string
    sql: ${TABLE}."ResolutionName" ;;
  }

  dimension: resolution_description {
    type: string
    sql: ${TABLE}."ResolutionDescription" ;;
  }

  dimension_group: resolution_date {
    type: time
    sql: ${TABLE}."ResolutionDate" ;;
  }

  dimension: work_ratio {
    type: number
    sql: ${TABLE}."WorkRatio" ;;
  }

  dimension_group: last_viewed {
    type: time
    sql: ${TABLE}."LastViewed" ;;
  }

  dimension: watch_count {
    type: number
    sql: ${TABLE}."WatchCount" ;;
  }

  dimension: is_watching {
    type: string
    sql: ${TABLE}."IsWatching" ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}."Created" ;;
  }

  dimension: priority_id {
    type: string
    sql: ${TABLE}."PriorityId" ;;
  }

  dimension: priority_name {
    type: string
    sql: ${TABLE}."PriorityName" ;;
  }

  dimension: time_spent_seconds {
    type: number
    sql: ${TABLE}."TimeSpentSeconds" ;;
  }

  dimension: time_spent {
    type: string
    sql: ${TABLE}."TimeSpent" ;;
  }

  dimension: remaining_estimate_seconds {
    type: number
    sql: ${TABLE}."RemainingEstimateSeconds" ;;
  }

  dimension: remaining_estimate {
    type: string
    sql: ${TABLE}."RemainingEstimate" ;;
  }

  dimension: original_estimate_seconds {
    type: number
    sql: ${TABLE}."OriginalEstimateSeconds" ;;
  }

  dimension: original_estimate {
    type: string
    sql: ${TABLE}."OriginalEstimate" ;;
  }

  dimension: aggregate_time_spent {
    type: number
    sql: ${TABLE}."AggregateTimeSpent" ;;
  }

  dimension: aggregate_time_original_estimate {
    type: number
    sql: ${TABLE}."AggregateTimeOriginalEstimate" ;;
  }

  dimension: aggregate_time_estimate {
    type: number
    sql: ${TABLE}."AggregateTimeEstimate" ;;
  }

  dimension: assignee_display_name {
    type: string
    sql: ${TABLE}."AssigneeDisplayName" ;;
  }

  dimension: assignee_key {
    type: string
    sql: ${TABLE}."AssigneeKey" ;;
  }

  dimension: assignee_name {
    type: string
    sql: ${TABLE}."AssigneeName" ;;
  }

  dimension: assignee_email {
    type: string
    sql: ${TABLE}."AssigneeEmail" ;;
  }

  dimension_group: updated {
    type: time
    sql: ${TABLE}."Updated" ;;
  }

  dimension: status_id {
    type: string
    sql: ${TABLE}."StatusId" ;;
  }

  dimension: status_name {
    type: string
    sql: ${TABLE}."StatusName" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."Description" ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}."Summary" ;;
  }

  dimension: creator_display_name {
    type: string
    sql: ${TABLE}."CreatorDisplayName" ;;
  }

  dimension: creator_name {
    type: string
    sql: ${TABLE}."CreatorName" ;;
  }

  dimension: creator_key {
    type: string
    sql: ${TABLE}."CreatorKey" ;;
  }

  dimension: creator_email {
    type: string
    sql: ${TABLE}."CreatorEmail" ;;
  }

  dimension: reporter_display_name {
    type: string
    sql: ${TABLE}."ReporterDisplayName" ;;
  }

  dimension: reporter_name {
    type: string
    sql: ${TABLE}."ReporterName" ;;
  }

  dimension: reporter_key {
    type: string
    sql: ${TABLE}."ReporterKey" ;;
  }

  dimension: reporter_email {
    type: string
    sql: ${TABLE}."ReporterEmail" ;;
  }

  dimension: aggregate_progress {
    type: number
    sql: ${TABLE}."AggregateProgress" ;;
  }

  dimension: total_progress {
    type: number
    sql: ${TABLE}."TotalProgress" ;;
  }

  dimension: votes {
    type: number
    sql: ${TABLE}."Votes" ;;
  }

  dimension: has_votes {
    type: string
    sql: ${TABLE}."HasVotes" ;;
  }

  dimension: due_date {
    type: date
    sql: ${TABLE}."DueDate" ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}."Labels" ;;
  }

  dimension: environment {
    type: string
    sql: ${TABLE}."Environment" ;;
  }

  dimension: security_level {
    type: string
    sql: ${TABLE}."SecurityLevel" ;;
  }

  dimension: fix_versions_aggregate {
    type: string
    sql: ${TABLE}."FixVersionsAggregate" ;;
  }

  dimension: components_aggregate {
    type: string
    sql: ${TABLE}."ComponentsAggregate" ;;
  }

  dimension: issue_links_aggregate {
    type: string
    sql: ${TABLE}."IssueLinksAggregate" ;;
  }

  dimension: affected_versions_aggregate {
    type: string
    sql: ${TABLE}."AffectedVersionsAggregate" ;;
  }

  dimension: subtasks_aggregate {
    type: string
    sql: ${TABLE}."SubtasksAggregate" ;;
  }

  dimension: cluster {
    type: string
    sql: ${TABLE}."CLUSTER" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: origem_lead {
    type: string
    sql: ${TABLE}."ORIGEM_LEAD" ;;
  }

  dimension: parceira {
    type: string
    sql: ${TABLE}."PARCEIRA" ;;
  }

  dimension: cargo {
    type: string
    sql: ${TABLE}."CARGO" ;;
  }

  dimension: responsavel {
    type: string
    sql: ${TABLE}."RESPONSAVEL" ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}."SITE" ;;
  }

  dimension: telefone {
    type: string
    sql: ${TABLE}."TELEFONE" ;;
  }

  dimension: ticket_medio {
    type: string
    sql: ${TABLE}."TICKET_MEDIO" ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
  }

  set: detail {
    fields: [
      id,
      key,
      issue_type_id,
      issue_type_name,
      project_id,
      project_name,
      project_key,
      parent_id,
      parent_key,
      resolution_id,
      resolution_name,
      resolution_description,
      resolution_date_time,
      work_ratio,
      last_viewed_time,
      watch_count,
      is_watching,
      created_time,
      priority_id,
      priority_name,
      time_spent_seconds,
      time_spent,
      remaining_estimate_seconds,
      remaining_estimate,
      original_estimate_seconds,
      original_estimate,
      aggregate_time_spent,
      aggregate_time_original_estimate,
      aggregate_time_estimate,
      assignee_display_name,
      assignee_key,
      assignee_name,
      assignee_email,
      updated_time,
      status_id,
      status_name,
      description,
      summary,
      creator_display_name,
      creator_name,
      creator_key,
      creator_email,
      reporter_display_name,
      reporter_name,
      reporter_key,
      reporter_email,
      aggregate_progress,
      total_progress,
      votes,
      has_votes,
      due_date,
      labels,
      environment,
      security_level,
      fix_versions_aggregate,
      components_aggregate,
      issue_links_aggregate,
      affected_versions_aggregate,
      subtasks_aggregate,
      cluster,
      email,
      origem_lead,
      parceira,
      cargo,
      responsavel,
      site,
      telefone,
      ticket_medio,
      tipo
    ]
  }
}
