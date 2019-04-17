class ArticlesController < ApplicationController
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
end
