class ArticlesController < ApplicationController
  # GET /articles GraphQLで置き換える前のREST-full API
  def index
    articles = Articles.recent
    render json: {
      data: articles.map do |article|
        {
          id: article.id,
          name: article.name,
          content: article.content,
          createdAt: article.created_at
        }
      end
    }
  end

  # POST /articles GraphQLで置き換える前のREST-full API
  def create
    article = Article.new(params[:article].permit(:name, :content))
    article.save!
    render json: {
      data: {
        id: article.id,
        name: article.name,
        content: article.content,
        createdAt: article.created_at,
      },
    }
  end
end
