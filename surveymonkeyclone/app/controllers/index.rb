enable :sessions
#===========================
#== Controlador Principal ==
#===========================
get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :mainpage, layout: true
  else
    erb :index, layout: true
  end
end
#===========================
#== Controlador Principal ==
#===========================