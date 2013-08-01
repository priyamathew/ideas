#sign up a new user
post '/user/create' do
  p params
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/user/profile/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    #how can I pass the errors to the homepage 
    redirect '/'
  end
end

#show profile of a user after signup or login 
get '/user/profile/:user_id' do 
  @user = User.find(params[:user_id])
  erb :profile
end

#sign-in 
post '/user/login' do
  @user = User.find_by_email(params[:user][:email])
  p @user
  p @user.authenticate(params[:user][:password])
  if @user && @user.authenticate(params[:user][:password])
    session[:id] = @user.id
    redirect "/user/profile/#{@user.id}"
  else
    erb :index
  end
end

get '/user/logout' do 
  session[:id] = nil
  redirect '/'
end

