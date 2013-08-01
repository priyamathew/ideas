get '/idea/create' do
  @groups = current_user.groups
  erb :new_idea
end
