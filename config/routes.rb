Raganow::Application.routes.draw do
  resources :ragas, only: %i(index show) do
    collection do
      get :suggestion
    end
  end
  resources :clips, only: :create
  resources :pages, only: :show

  root controller: "ragas", action: "index"
end
