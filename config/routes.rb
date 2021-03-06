Performanceci::Application.routes.draw do
  resources :build_endpoints

  resources :endpoints

  resources :builds do
    collection do
      get 'ongoing'
    end
  end

  resources :repositories do
    member do
      get 'summary'
    end
  end

  resources :results_overview

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users

  # You can have the root of your site routed with "root"
  root 'landings#redirects'

  # Example of regular route:

  post '/webhooks/:user_id' => 'webhooks#hook'

  # Example of named route that can be invoked with purchase_url(id: product.id)
     get 'jobtest' => 'job_test#swarm'

  get 'dockerjob' => 'job_test#docker'
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
