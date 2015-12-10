class ArticlesController < ApplicationController
  def index
    # TODO handle GET[search] params
    # TODO handle GET[tags] params
    # TODO add pagination
    
    @articles = Article.all
  end

  def show
    @article = Article.find_by(slug: params[:slug])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to article_path(@article)
    else

    end
  end

  def edit
    @article = Article.find_by(slug: params[:slug])
  end

  def update
    @article = Article.find_by(slug: params[:slug])

    if @article.update(article_params)
      redirect_to article_path(@article)
    else

    end
  end

  def destroy
    @article = Article.find_by(slug: params[:slug])

    @aricle.delete!

    redirect_to articles_path
  end

  private

  def article_params
    params.allow(:article).permit(:title, :slug, :content, :published_at)
  end
end
