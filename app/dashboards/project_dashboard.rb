require "administrate/base_dashboard"

class ProjectDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
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
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    assigned_by
    assigned_to
    currency
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
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
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
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

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how projects are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(project)
  #   "Project ##{project.id}"
  # end
end
