require "administrate/base_dashboard"

class TaskDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    billing_hours: Field::String.with_options(searchable: false),
    project: Field::BelongsTo,
    status: Field::BelongsTo,
    task_description: Field::Text,
    task_status: Field::String,
    working_hours: Field::String.with_options(searchable: false),
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    billing_hours
    project
    status
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    billing_hours
    project
    status
    task_description
    task_status
    working_hours
  ].freeze

  FORM_ATTRIBUTES = %i[
    billing_hours
    project
    status
    task_description
    task_status
    working_hours
  ].freeze

  COLLECTION_FILTERS = {}.freeze

end
