Rails.application.routes.draw do
  root 'home#index'
  get 'parkout' , to: 'home#park_out'
  get 'park_update' , to: 'home#park_update' ,as: :park_update
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  resources :floors 
          
  resources :floors do

    resources :slots do
      collection do
        get :park_in
      end  
    end
  end    
end