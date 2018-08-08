# frozen_string_literal: true

# app/controllers/microposts_controller.rb
class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[show edit update destroy]
  before_action :authenticate_user!
  # GET /microposts
  # GET /microposts.json
  def index
    @microposts = Micropost.all
  end
  # GET /microposts/1
  # GET /microposts/1.json

  def show; end
  # GET /microposts/new

  def new
    @micropost = Micropost.new
  end
  # GET /microposts/1/edit

  def edit; end
  # POST /microposts
  # POST /microposts.json

  def create
    @micropost = current_user.microposts.new(micropost_params)
    respond_to do |format|
      if @micropost.save
        format.html do
          redirect_to @micropost,
                      notice: t('created', name: 'Micropost')
        end
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new }
        format.json do
          ender json: @micropost.errors,
                status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /microposts/1
  # PATCH/PUT /microposts/1.json
  def update
    @micropost.category_id = params[:category_id]
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html do
          redirect_to @micropost,
                      notice: t('updated', name: 'Micropost')
        end
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit }
        format.json do
          render json: @micropost.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost.destroy if @micropost == current_user.microposts.find(params[:id])
    respond_to do |format|
      format.html do
        redirect_to microposts_url, notice: t('destroyed', name: 'Micropost')
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_micropost
    @micropost = Micropost.find(params[:id])
  end

  def micropost_params
    params.require(:micropost).permit(:content, :image, category_ids: [])
  end
end
