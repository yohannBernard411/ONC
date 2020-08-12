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
      average_notation
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
    @clothe = Clothe.find(@comment.clothe.id)
    authorize @comment
    if @comment.update(comment_params)
      average_notation
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

  def average_notation
    all_comments = Comment.where(clothe: @clothe)
    total = 0
    count = 0
    all_comments.each do |comment|
      total += comment.note
      count += 1
    end
    moyenne = total.fdiv(count)
    @clothe.update(scoring: moyenne, nbov: count)
  end

end
