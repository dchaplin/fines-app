class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    #unauthorized! unless logged_in? 
    @users = User.by_name
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def edit_own_profile
    @user = current_user
    render 'edit'
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    # raise user_params.to_yaml

    if @user.save
      redirect_to fines_url
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      redirect_to fines_url
    else
      render 'edit'
    end
  end

  def update_own_profile
    @user = current_user
    if @user.update(user_params)
      redirect_to fines_url
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      if authorised?(UsersController, params[:action].to_sym)
        params.require(:user).permit(:username, :password, :password_confirmation, :admin)
      else
        params.require(:user).permit(:username, :password, :password_confirmation)
      end
    end
end
