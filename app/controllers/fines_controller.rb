class FinesController < ApplicationController
  before_action :set_fine, only: [:show, :edit, :update, :destroy]
  before_action :get_users, only: [:index, :edit, :new]

  # GET /fines
  # GET /fines.json
  def index
    @fines = Fine.all
  end

  # GET /fines/1
  # GET /fines/1.json
  def show
  end

  # GET /fines/new
  def new
    @fine = Fine.new
  end

  # GET /fines/1/edit
  def edit
  end

  # POST /fines
  # POST /fines.json
  def create
    @fine = Fine.new(fine_params.merge(:amount => 5, :date => Time.now, :status => "Pending"))
    # raise fine_params.to_yaml

    if @fine.save
      redirect_to fines_url
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fines/1
  # PATCH/PUT /fines/1.json
  def update
    redirect_to @fine
  end

  # DELETE /fines/1
  # DELETE /fines/1.json
  def destroy
    @fine.destroy
    redirect_to fines_url
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_fine
    @fine = Fine.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fine_params
    params.require(:fine).permit(:date, :description, :status, :amount, :offender_id, :proposer_id)
  end

  def get_users
    @users = User.all.by_name
  end
end