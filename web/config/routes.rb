Rails.application.routes.draw do
  root to: "items#index"

  resources :items
  resources :orders
  resources :employees

# Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         items#index
#     items GET    /items(.:format)          items#index
#           POST   /items(.:format)          items#create
#  new_item GET    /items/new(.:format)      items#new
# edit_item GET    /items/:id/edit(.:format) items#edit
#      item GET    /items/:id(.:format)      items#show
#           PATCH  /items/:id(.:format)      items#update
#           PUT    /items/:id(.:format)      items#update
#           DELETE /items/:id(.:format)      items#destroy

#     orders GET    /orders(.:format)          orders#index
#            POST   /orders(.:format)          orders#create
#  new_order GET    /orders/new(.:format)      orders#new
# edit_order GET    /orders/:id/edit(.:format) orders#edit
#      order GET    /orders/:id(.:format)      orders#show
#            PATCH  /orders/:id(.:format)      orders#update
#            PUT    /orders/:id(.:format)      orders#update
#            DELETE /orders/:id(.:format)      orders#destroy

#     employees GET    /employees(.:format)          employees#index
#               POST   /employees(.:format)          employees#create
#  new_employee GET    /employees/new(.:format)      employees#new
# edit_employee GET    /employees/:id/edit(.:format) employees#edit
#      employee GET    /employees/:id(.:format)      employees#show
#               PATCH  /employees/:id(.:format)      employees#update
#               PUT    /employees/:id(.:format)      employees#update
#               DELETE /employees/:id(.:format)      employees#destroy
# ==============================================

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
end
