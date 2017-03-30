Rails.application.routes.draw do
  #when we receive a get request with URL `/about` then rails will invoke the
  #about controller with index action (action is just a method that is defined
  #within a controller)
  get '/about', to:'about#index'
  # if you don't pass an `as:` option then Rails will attempt to generate a URL
  # / PATH helper for you. If you pass the `as:` option then Rails will use
  # that as the URL/PATH helper. The auto-generated path helper will be
  # `contact_us_path` while after we added the `as:` option, it will just be
  # `contact_path`
  get('/contact_us', { to: 'contact#new', as: 'contact' })
  post('/contact',{to:'contact#create',as:'contact_submit'})
  get('/questions/new',{to:'questions#new', as:'new_question'})
  post('/questions', {to:'questions#create', as:'questions'})
  get('/questions/:id', {to:'questions#show', as:'question'})
  root 'welcome#index'

  #you can also write it as:
  # get('/about' => 'about#index')

end
