Rails.application.routes.draw do
  resources :forums do
    resources :topics do
      resources :posts
      resource :monitorship, :controller => :monitorships
    end
  end

  resources :posts do
    collection do
      get :index, :as => "all"
      get :search, :as => "search_all"
    end
  end

  %w(forum).each do |attr|
    resources :posts, :as => "#{attr}_posts", :path_prefix => "/#{attr.pluralize}/:#{attr}_id"
  end

  resources :topics
  resources :monitorship
end
