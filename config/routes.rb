Rails.application.routes.draw do
  post '/register-url', to: 'urls#register_url'
  get '/urls', to: 'urls#original_url_list'
  get '/:short_url', to: 'urls#original_url'
end
