module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :articles, Type::ArticleType.connection_type, null: false, resolve: -> (_object, _args, _context) do
      Article.order(id: :desc)
    end
  end
end