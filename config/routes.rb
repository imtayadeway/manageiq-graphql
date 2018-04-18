ManageIQ::GraphQL::Engine.routes.draw do
  root :to => 'graphql#execute', :as => :endpoint, :via => %i(get post)
end

Rails.application.routes.draw do
  mount ManageIQ::GraphQL::Engine, :at => '/graphql'

  if Rails.env.development?
    get "/graphql/explorer", :to => "graphql_explorer#index"
  end
end
