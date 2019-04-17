module Mutations
  class CreateArticle < GraphQL::Schema::RelayClassicMutation
    field :article, Type::ArticleType, null: false

    argument :name, String, required: true
    argument :content, String, required: true

    def resolve(name:, content:)
      article = Article.new(name: name, content: content)
      article.save!
      { article: article }
    end
  end
end
