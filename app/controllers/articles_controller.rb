class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
    def show
    end
    def index
      @articles=Article.all
  end
  def new
    @article=Article.new
  end
  def create
    @article=Article.new(article_params)
    @article.user=User.first
   if @article.save
    flash[:notice]="Article created successfully"
    redirect_to articles_path(@article)
   else
    render 'new'
    end
  end
     def update
    if @article.update(article_params)
    flash[:notice]="Article updated successfully"
    redirect_to articles_path(@article)
   else
    render 'edit'
    end
     end
  def edit
  end
  def destroy
   @article.destroy
    redirect_to articles_path
    end

  private
    def set_article
      @article = Article.find(params[:id])
   end
    def article_params
    params.require(:article).permit(:title,:description)
end
end