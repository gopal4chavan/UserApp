class Role < ApplicationRecord
    # Active roles
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    scope :active_roles, -> { where(hidden: false) }
end
