class UsersController < ApplicationController
  
  before_action :set_user_and_roles, only: [:new]
  before_action :set_roles, only: [:index, :filter_table]
  
  def new
  end

  def create
    @user = User.new(user_params)
    @user.roles = get_role_ids
    @user.meta_cols = params.require("meta_cols").permit!.to_h
    if @user.save
      flash[:now] = "User created successfully "
    else
      flash[:now] = @user.errors.full_messages.first
    end
    @roles = Role.active_roles
    render :new
    # todo merge with additional params
  end

  def index
    active_roles = Role.active_roles.pluck(:id)
    @users = []
    User.all.each do |user|
      @users << user if user.has_active_role(active_roles)
    end
  end

  def filter_table
    active_roles = params["roles"].map{|elem| elem.to_i}
    @users = []
    User.all.each do |user|
      @users << user if user.has_active_role(active_roles)
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, roles: [], images: [])
    end

    def get_role_ids
      roles = params[:roles]
      ids = []
      roles.each do |elem|
        ids << elem.last["id"].to_i if elem.last["selected"] == "1"
      end
      ids
    end

    def set_user_and_roles
      @user = User.new
      @roles = Role.active_roles
    end

    def set_roles
      @active_roles = Role.active_roles.pluck(:name, :id)
    end
end
