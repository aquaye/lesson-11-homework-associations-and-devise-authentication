class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :find_article, only: [ :show, :edit, :update, :destroy ]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article was saved successfully"
      redirect_to articles_path
    else
      flash.now[:error] = "Article was not saved successfully"
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was saved successfully"
      redirect_to articles_path
    else
      flash.now[:error] = "Article was not saved successfully"
      render :edit
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, )
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
