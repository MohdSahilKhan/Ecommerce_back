require "administrate/base_dashboard"

class StatusDashboard < Administrate::BaseDashboard
  
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    cc: Field::String,
    status_date: Field::DateTime,
    tasks: Field::HasMany,
    to: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    cc
    status_date
    tasks
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    cc
    status_date
    tasks
    to
  ].freeze

  FORM_ATTRIBUTES = %i[
    cc
    status_date
    tasks
    to
  ].freeze

  COLLECTION_FILTERS = {}.freeze

end
