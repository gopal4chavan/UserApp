class User < ApplicationRecord
    
    serialize :roles, Array
    serialize :meta_cols, Hash

    validates :email, uniqueness: { case_sensitive: false }

    # active_storage for storing images
    has_many_attached :images
    
    def user_role_names()
        Role.where(id: self.roles).pluck(:name).join(", ")
    end

    def has_active_role(active_roles)
        self.roles.each do |role|
            return true if active_roles.include? role
        end
        return false
    end

    
end
