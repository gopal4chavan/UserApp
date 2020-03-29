class RolesController < ApplicationController
  def create
    @role = Role.create(role_params)
    if @role.valid?
      flash[:success] = "Role Successfully Added"
    else
      flash[:error] = @role.errors.full_messages.first
    end
    redirect_to '/roles/new'
  end

  def new
    @role = Role.new
  end

  def hide_roles_form
    @roles = Role.all
  end

  def update_roles
    Role.all.update_all(hidden: false)
    Role.where(id: hidden_role_ids).update_all(hidden: true)
    flash[:success] = "Roles updated successfully"
    redirect_to '/roles/hide_roles_form'
  end

  private

  def role_params
    params.require(:role).permit(:name, :hidden)
  end

  def hidden_role_ids
    roles = []
    params["roles"].each do |elem|
      roles << elem.last["id"] if elem.last["hidden"] == "1"
    end
    roles
  end
end
