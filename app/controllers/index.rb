get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/posts' do
  @category = params[:category]
  @posts = Category.find_by(name: @category).posts
  erb :posts
end
