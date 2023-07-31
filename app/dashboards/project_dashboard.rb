require "administrate/base_dashboard"

class ProjectDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    assigned_by: Field::Number,
    assigned_to: Field::Number,
    currency: Field::String,
    description: Field::Text,
    domain: Field::String,
    name: Field::String,
    project_type: Field::String,
    rate: Field::String.with_options(searchable: false),
    start_date: Field::Date,
    tasks: Field::HasMany,
    user_id: Field::Number,
   
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    assigned_by
    assigned_to
    currency
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    assigned_by
    assigned_to
    currency
    description
    domain
    name
    project_type
    rate
    start_date
    tasks
    user_id
  ].freeze

  FORM_ATTRIBUTES = %i[
    assigned_by
    assigned_to
    currency
    description
    domain
    name
    project_type
    rate
    start_date
    tasks
    user_id
  ].freeze

  COLLECTION_FILTERS = {}.freeze
  
end
