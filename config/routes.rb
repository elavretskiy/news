News::Engine.routes.draw do
  filter :locale

  mount Ckeditor::Engine => '/ckeditor'

  resources :articles do
    get '/admin' => 'articles#admin', :as => :admin, on: :collection
  end
end
