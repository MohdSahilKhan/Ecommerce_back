require "administrate/base_dashboard"

class RoleDashboard < Administrate::BaseDashboard
  
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    resource: Field::Polymorphic,
    users: Field::HasMany,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    name
    resource
    users
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    resource
    users
  ].freeze

  FORM_ATTRIBUTES = %i[
    name
    resource
    users
  ].freeze

  COLLECTION_FILTERS = {}.freeze

end
