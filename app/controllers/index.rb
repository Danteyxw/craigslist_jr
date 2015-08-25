get '/' do
  # Look in app/views/index.erb
  session = nil
  session = {}
  erb :index
end

post '/posts' do
  session[:category] = params[:category]
  session[:posts] = Category.find_by(name: session[:category]).posts

  redirect '/posts'
end

post '/create_post' do
  key = Faker::Internet.password(8)
  Post.create(title: params[:title],
              category_id: Category.find_by(name: params[:category]).id,
              description: params[:description],
              email: params[:email],
              price: params[:price],
              key: key)
  session[:key] = key
  session[:category] = params[:category]
  session[:posts] = Category.find_by(name: session[:category]).posts
  redirect '/key'
end

post '/edit_post' do
  session[:post] = Post.find_by(key: params[:key]).id
  redirect '/edit'
end

post '/save_post' do
  Post.update(title: params[:title],
              description: params[:description],
              email: params[:email],
              price: params[:price])
  session[:category] = params[:category]
  session[:posts] = Category.find_by(name: session[:category]).posts
  redirect '/posts'
end

get '/posts' do
  erb :posts
end

get '/key' do
  erb :key
end

get '/edit' do
  @post = Post.find(session[:post])
  erb :edit
end