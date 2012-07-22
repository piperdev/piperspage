class ArticlesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def index
    @left_column = Article.left_column
    @main_column = Article.main_column
    @right_column = Article.right_column
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.user = current_user

    if @article.save
      redirect_to article_path(@article)
    else
      render "new"
    end
  end
end
