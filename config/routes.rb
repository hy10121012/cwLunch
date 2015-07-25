CwLunch::Application.routes.draw do
  get "web_service/get_lunch"
  get "web_service/get_dinner"
  get "web_service/create_order"
  get "web_service/cancel_order"
  get "web_service/update_order"
  get "web_service/register"
  get "web_service/login"
  get "order/lunch"
  get "order/dinner"
  get "order/history"
  get "order/number_search"
  get "locations/index"
  get "locations/create"
  get "locations/new"
  get "locations/edit"
  get "locations/show"
  get "items/new"
  get "items/edit"
  get "items/show"
  get "items/update"
  get "items/destory"
  get "items/create"
  get "items/index"
  get "dinner/index"
  get "lunch/index"
  get "lyunch/index"
  get "login/login"
  get "index/login"
  get "index/home"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do‰
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  root 'index#root'

  get 'login'=>'login#login'
  post 'login'=>'login#do_login'

  get 'home'=>'order#lunch'

  get 'lunch'=>'lunch#index'
  get 'dinner'=>'dinner#index'
  get 'order'=>'order#lunch'
  get 'order/lunch'=>'order#lunch'
  get 'order/dinner'=>'order#dinner'
  get 'order/history'=>'index#order_history'
  get 'chatroom'=>'comments#chat_room'
  get 'chatroom_solo'=>'comments#chat_room_solo'
  get 'chatroom_solo/:id'=>'comments#register'
  patch 'lunch/update_setB_menu'=>'lunch#update_setB_menu'
  get 'ajax/lunch'=>'web_service#get_lunch'
  get 'ajax/dinner'=>'web_service#get_dinner'
  post 'ajax/create_order'=>'web_service#create_order'
  post 'ajax/cancel_order'=>'web_service#cancel_order'
  post 'ajax/update_order'=>'web_service#update_order'
  get 'ajax/get_history_order/:user_id/:offset'=>'web_service#get_history_order'


  resources :items
  resources :locations
  resources :comments
  resources :order

end
