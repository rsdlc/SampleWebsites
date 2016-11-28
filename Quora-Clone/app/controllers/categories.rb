#===============================
#== Controlador de Categorias ==
#===============================

get '/categories' do 
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :categorias, layout: true
  else
    redirect  '/'
  end
end

post '/categories/choose' do
  if params.empty?
    redirect '/categories'
  else
    @user = User.find(session[:user_id])
    params[:category].each do |x|
      unless Relation.exists?(user_id:@user.id,category_id:x.to_i)
        Relation.create(user_id:@user.id,category_id:x.to_i)
      end
    end
    @user.category = true
    @user.save  
    redirect  '/'
  end
end

#===============================
#== Controlador de Categorias ==
#===============================