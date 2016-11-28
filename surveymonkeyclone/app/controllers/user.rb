#============================
#== Controlador de usarios ==
#============================
#==============================================================================  
post '/user/reg' do
  @user = User.new(name:params[:name],email:params[:email])
  @user.password = params[:password]
  if @user.save
    session[:user_id] = @user.id
    return  erb :mainpage, layout: false
  else
    return erb :error , layout: false
  end
end
#==============================================================================  
post '/user/ini' do
  @user = User.authenticate(params[:email],params[:password])
  if @user
    session[:user_id] = @user.id
    return erb :mainpage, layout: false
  else
    return erb :error , layout: false
  end
end
#==============================================================================
get '/user/logout' do 
  session.clear
  redirect '/'
end
#============================
#== Controlador de usarios ==
#============================
