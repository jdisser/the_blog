class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @article = Article.all
  end

  def show
    @article = Article.find(params[:id])      #retrieve an article from the db
                                              #using the :id parameter to pass to the view
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)    #use params from POST to create new article

    if @article.save                             #save article to the database
      redirect_to @article                      #redirect to the SHOW action/method
    else
      render 'new'        #use render to pass @article to new template
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end





  private
    def article_params
      params.require(:article).permit(:title,:text) #add the parameter security check
    end


end
