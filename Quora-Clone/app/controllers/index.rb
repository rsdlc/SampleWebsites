enable :sessions
#===========================
#== Controlador Principal ==
#===========================
get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    if @user.category
      erb :kuora, layout: true
    else
      erb :categorias, layout: true
    end
  else
    erb :index, layout: true
  end
end

#===========================
#== Controlador Principal ==
#===========================