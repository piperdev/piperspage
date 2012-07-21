class ArticlesController < ApplicationController
  def index
    @left_column = Article.left_column
    @main_column = Article.main_column
    @right_column = Article.right_column
  end
end
