Rails.application.routes.draw do
  root "home#index"
  resources :order_dishes
  resources :orders do
    collection do
      get 'cacl_price_dish'
    end
  end

  resources :dishes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
