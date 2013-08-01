get '/idea/create' do
  @groups = current_user.groups + current_user.admingroups

  erb :new_idea
end

post '/idea/create' do
  @group = Group.find_by_id(params[:idea][:group_id])
  @idea = Idea.create(name: params[:idea][:name], creator: current_user, group: @group)

  redirect "/group/#{@group.id}/ideas"
end

post '/idea/:group_id/:idea_id/vote' do
  @idea = Idea.find(params[:idea_id])
  @group = Group.find(params[:group_id])
  @idea.votes.create(voter: current_user)

  redirect "/group/#{@group.id}/ideas"
end

get '/group/:group_id/ideas' do
  @group = Group.find(params[:group_id])

  erb :group_ideas
end
