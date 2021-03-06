Thenoticeboard::Application.routes.draw do
  


  resources :posts
 
  root :to =>'home#index'
 
  match 'home' => 'home#home'
  match 'about' => 'home#about'
  match 'blog' => 'home#blog'
  match 'blog_timeline' => 'home#blog_timeline'
  match 'contact' => 'home#contact'
  match 'shop' => 'home#shop'
  match 'index_slider' => 'home#index_slider'
  match 'profile' => "profile#index"
  
  match 'posts' => 'home#new'
  match 'search' => 'posts#search'
  match 'advance_search' => 'posts#advance_search'
  match 'results' => 'posts#search_results'
  match 'questions' => 'posts#questions'
  
  #admin routes
  namespace :admin do

  root :to =>'dashboard#index'
  resources :user
  resources :questions
  resources :categories do
    member do
        get "change_status"        
      end
  end  
  resources :subcategories do
      member do
        get "change_status"        
      end
  end

  end  

  #user authentication routes
  devise_for :users, :skip => [:sessions]
     as :user do
     get '/login'   => "devise/sessions#new",       :as => :new_user_session
     post '/login'  => 'devise/sessions#create',    :as => :user_session
     match '/signout'  => 'devise/sessions#destroy',   :as => :destroy_user_session
     match '/signin' => "devise/sessions#signin", :as => :user_session_path
     get '/signup'   => "devise/registrations#new",       :as => :new_user_registration
  end



 #Admin routes
 devise_for :adminusers,:controllers => { :registrations => "adminsession",:sessions => "adminregistration" } do
   
 end




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
