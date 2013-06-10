Eagle::Application.routes.draw do

  devise_for :users

  # /api/*
  namespace :api do

    # /api/v1/*
    namespace :v1 do

      # /posts
      resources :posts, only: [:show, :create, :update, :destroy] do

        # /posts/popular
        get 'popular', on: :collection

        # /posts/posts_by_user_id/1
        #get 'posts_by_user_id/:id', on: :collection

        # /posts/:post_id/comments
        resources :comments, only: [:index, :show, :create, :update, :destroy]

        # /posts/:post_id/likes
        resources :likes, only: [:index, :create, :update, :destroy]

        # /posts/:post_id/mentions
        resources :mentions, only: [:index, :create, :destroy]
      end

      # /comments
      resources :comments, only: [] do

        # /comments/:comment_id/likes
        resources :likes, only: [:index, :create, :update, :destroy]

      end

      # /hashtags
      match '/hashtags/popular' => 'hashtags#popular' # /hashtags/popular
      match '/hashtags/suggest/:prefix' => 'hashtags#suggest' # /hashtags/suggest/:prefix
      resources :hashtags, only: [:index, :show, :create]


      # /activities
      resources :activities, only: [:index, :show]

    end
  end

  root to: "posts#index"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
