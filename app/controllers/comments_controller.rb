class CommentsController < ApplicationController
  
  def new
    @clothe = Clothe.find(params[:clothe_id])
    @comment = Comment.new
    authorize @clothe
    authorize @comment 
  end

  def create
    @comment = Comment.new(comment_params)
    @clothe = Clothe.find(params[:clothe_id])
    @comment.clothe = @clothe
    @comment.user_id = current_user.id
    authorize @clothe
    authorize @comment
    if @comment.save
      redirect_to clothe_path(@clothe)
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def edit
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def update
    @comment = Comment.find(params[:id])
    authorize @comment
    if @comment.update(comment_params)
      redirect_to clothe_path(@comment.clothe)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to clothe_path(@comment.clothe)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content, :note, :user_id)
  end

end
