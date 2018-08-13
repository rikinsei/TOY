# frozen_string_literal: true

# CommentsController
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
 
  # GET /comments
  def index
    if params[:micropost_id]
      @comments = Comment.where(micropost_id: params[:micropost_id])
    else
      @comments = Comment.all
    end
  end 

  # GET /comments/1
  def show; end

  # GET /comments/new
  def new
   @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit; end

  # POST /comments
  # POST /comments.json
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to micropost_path(@micropost), notice: t('created', name: 'Comment') 
        end
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json do
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    end
  end
     
  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: t('updated', name: 'Comment') }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    # @micropost = Micropost.find(params[:micropost_id])
    @comment.destroy
    redirect_to micropost_path(@comment.micropost_id)
    # @comment.destroy
    # respond_to do |format|
    #   format.html { redirect_to comments_url, notice: Comment was successfully destroyed}
    #   format.json { head :no_content }
    # end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:name, :comment)
  end
end