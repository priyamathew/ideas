post '/group/create' do
  @group = Group.create(name: params[:group][:name])
  @group.admin = current_user
  @group.save

  redirect "/group/#{@group.id}/home"
end

get '/group/:group_id/home' do
  @group = Group.find(params[:group_id])

  erb :group_home
end

post '/group/add_member' do
  @group = Group.find_by_group_code(params[:group][:code])
  @group.users << current_user

  redirect "/group/#{@group.id}/home"
end

post '/group/:group_id/remove_member' do
  @group = Group.find(params[:group_id])
  @user = User.find(params[:user][:id].to_i)
  @group.users.destroy(@user.id)

  erb :group_home
end

# Group.where(admin: current_user.id).each do |group|

