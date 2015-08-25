get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/posts' do
  session[:category] = params[:category]
  session[:posts] = Category.find_by(name: session[:category]).posts

  redirect '/posts'
end

post '/create_post' do
  Post.create(title: params[:title], category_id: Category.find_by(name: session[:category]).id, description: params[:description], email: params[:email], price: params[:price], key: Faker::Internet.password(8))

  redirect '/post'
end

post '/editor_create' do
  session[:category] = params[:category]

  redirect '/editor'
end

post '/edit_post' do
end

get '/posts' do
  erb :posts
end

get '/editor' do
  erb :editor
end

get '/post' do
  erb :post
end