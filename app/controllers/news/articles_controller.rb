module News
  class ArticlesController < ApplicationController
    before_action :set_article, only: [:destroy, :edit, :update, :show]

    respond_to :html

    def index
      @articles = Article.page(params[:page]).per(10)
    end

    def show
    end

    def new
      @article = Article.new
    end

    def edit
    end

    def create
      @article = Article.new(article_params)
      @article.save
      redirect_to admin_articles_path(page: params[:page])
    end

    def update
      @article.update(article_params)
      redirect_to admin_articles_path(page: params[:page])
    end

    def destroy
      @article.destroy
      redirect_to admin_articles_path(page: params[:page])
    end

    def admin
      params[:page] ? page = params[:page].to_i : page = 1
      loop do
        @articles = Article.page(page).per(10)
        page -= 1
        break if @articles.any? || page < 1
      end
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :annonce, :text)
    end
  end
end
