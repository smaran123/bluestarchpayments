Rails.application.routes.draw do

  resources :payments do
    collection do
      get :payment_pdf
    end
  end
    root "home#index"
  resources :signatures, only: [:create]
end
