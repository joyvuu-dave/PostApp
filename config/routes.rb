Rails.application.routes.draw do
  namespace :api do 
    # POSTS
    get 'posts' => 'posts#list'
    post 'posts' => 'posts#create'
    get 'posts/:id' => 'posts#show'
    patch 'posts/:id' => 'posts#update'
    delete 'posts/:id' => 'posts#destroy'

    # IMAGES
    post 'images' => 'images#create'
    delete 'images/:id' => 'images#destroy'

    # COMMENTS
    get 'comments' => 'comments#list'
    post 'comments' => 'comments#create'
    delete 'comments/:id' => 'comments#destroy'
  end
end
