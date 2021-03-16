view: jira {
  sql_table_name: "AD_HOC"."JIRA"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."Id" ;;
  }

  dimension: affected_versions_aggregate {
    type: string
    sql: ${TABLE}."AffectedVersionsAggregate" ;;
  }

  dimension: aggregate_progress {
    type: number
    sql: ${TABLE}."AggregateProgress" ;;
  }

  dimension: aggregate_time_estimate {
    type: number
    sql: ${TABLE}."AggregateTimeEstimate" ;;
  }

  dimension: aggregate_time_original_estimate {
    type: number
    sql: ${TABLE}."AggregateTimeOriginalEstimate" ;;
  }

  dimension: aggregate_time_spent {
    type: number
    sql: ${TABLE}."AggregateTimeSpent" ;;
  }

  dimension: assignee_display_name {
    type: string
    sql: ${TABLE}."AssigneeDisplayName" ;;
  }

  dimension: assignee_email {
    type: string
    sql: ${TABLE}."AssigneeEmail" ;;
  }

  dimension: assignee_key {
    type: string
    sql: ${TABLE}."AssigneeKey" ;;
  }

  dimension: assignee_name {
    type: string
    sql: ${TABLE}."AssigneeName" ;;
  }

  dimension: components_aggregate {
    type: string
    sql: ${TABLE}."ComponentsAggregate" ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}."Created" ;;
  }

  dimension: creator_display_name {
    type: string
    sql: ${TABLE}."CreatorDisplayName" ;;
  }

  dimension: creator_email {
    type: string
    sql: ${TABLE}."CreatorEmail" ;;
  }

  dimension: creator_key {
    type: string
    sql: ${TABLE}."CreatorKey" ;;
  }

  dimension: creator_name {
    type: string
    sql: ${TABLE}."CreatorName" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."Description" ;;
  }

  dimension_group: due {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DueDate" ;;
  }

  dimension: environment {
    type: string
    sql: ${TABLE}."Environment" ;;
  }

  dimension: fix_versions_aggregate {
    type: string
    sql: ${TABLE}."FixVersionsAggregate" ;;
  }

  dimension: has_votes {
    type: yesno
    sql: ${TABLE}."HasVotes" ;;
  }

  dimension: is_watching {
    type: yesno
    sql: ${TABLE}."IsWatching" ;;
  }

  dimension: issue_links_aggregate {
    type: string
    sql: ${TABLE}."IssueLinksAggregate" ;;
  }

  dimension: issue_type_id {
    type: string
    sql: ${TABLE}."IssueTypeId" ;;
  }

  dimension: issue_type_name {
    type: string
    sql: ${TABLE}."IssueTypeName" ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}."Key" ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}."Labels" ;;
  }

  dimension_group: last_viewed {
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
    sql: ${TABLE}."LastViewed" ;;
  }

  dimension: original_estimate {
    type: string
    sql: ${TABLE}."OriginalEstimate" ;;
  }

  dimension: original_estimate_seconds {
    type: number
    sql: ${TABLE}."OriginalEstimateSeconds" ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}."ParentId" ;;
  }

  dimension: parent_key {
    type: string
    sql: ${TABLE}."ParentKey" ;;
  }

  dimension: priority_id {
    type: string
    sql: ${TABLE}."PriorityId" ;;
  }

  dimension: priority_name {
    type: string
    sql: ${TABLE}."PriorityName" ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}."ProjectId" ;;
  }

  dimension: project_key {
    type: string
    sql: ${TABLE}."ProjectKey" ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}."ProjectName" ;;
  }

  dimension: remaining_estimate {
    type: string
    sql: ${TABLE}."RemainingEstimate" ;;
  }

  dimension: remaining_estimate_seconds {
    type: number
    sql: ${TABLE}."RemainingEstimateSeconds" ;;
  }

  dimension: reporter_display_name {
    type: string
    sql: ${TABLE}."ReporterDisplayName" ;;
  }

  dimension: reporter_email {
    type: string
    sql: ${TABLE}."ReporterEmail" ;;
  }

  dimension: reporter_key {
    type: string
    sql: ${TABLE}."ReporterKey" ;;
  }

  dimension: reporter_name {
    type: string
    sql: ${TABLE}."ReporterName" ;;
  }

  dimension_group: resolution {
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
    sql: ${TABLE}."ResolutionDate" ;;
  }

  dimension: resolution_description {
    type: string
    sql: ${TABLE}."ResolutionDescription" ;;
  }

  dimension: resolution_id {
    type: string
    sql: ${TABLE}."ResolutionId" ;;
  }

  dimension: resolution_name {
    type: string
    sql: ${TABLE}."ResolutionName" ;;
  }

  dimension: security_level {
    type: string
    sql: ${TABLE}."SecurityLevel" ;;
  }

  dimension: status_id {
    type: string
    sql: ${TABLE}."StatusId" ;;
  }

  dimension: status_name {
    type: string
    sql: ${TABLE}."StatusName" ;;
  }

  dimension: subtasks_aggregate {
    type: string
    sql: ${TABLE}."SubtasksAggregate" ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}."Summary" ;;
  }

  dimension: time_spent {
    type: string
    sql: ${TABLE}."TimeSpent" ;;
  }

  dimension: time_spent_seconds {
    type: number
    sql: ${TABLE}."TimeSpentSeconds" ;;
  }

  dimension: total_progress {
    type: number
    sql: ${TABLE}."TotalProgress" ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}."Updated" ;;
  }

  dimension: votes {
    type: number
    sql: ${TABLE}."Votes" ;;
  }

  dimension: watch_count {
    type: number
    sql: ${TABLE}."WatchCount" ;;
  }

  dimension: work_ratio {
    type: number
    sql: ${TABLE}."WorkRatio" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      assignee_display_name,
      resolution_name,
      priority_name,
      assignee_name,
      creator_display_name,
      creator_name,
      reporter_name,
      reporter_display_name,
      project_name,
      status_name,
      issue_type_name
    ]
  }
}
