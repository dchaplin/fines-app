class VotesController < ApplicationController
  before_action :set_fine

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
  end

  # GET fines/:id/votes/up
  def up
    current_user.vote(@fine, true)
    redirect_to fines_url
  end
  
  # POST fines/:id/votes/down
  def down    
    current_user.vote(@fine, false)
    redirect_to fines_url
  end

private
  def set_fine
    @fine = Fine.find(params[:fine_id])
  end
end
