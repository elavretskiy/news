News::Engine.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  resources :articles do
    get '/admin' => 'articles#admin', :as => :admin, on: :collection
  end
end
