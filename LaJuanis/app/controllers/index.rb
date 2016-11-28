get '/' do
  # La siguiente linea hace render de la vista
  # que esta en app/views/index.erb
  erb :index
end

get '/galeria' do
  erb :galeria
end

get '/pedidos' do
  erb :pedidos
end

get '/historia' do
  erb :quienessomos
end

get '/adminpanel' do
  @pendingorders   = Order.where(status: false)
  @completedorders = Order.where(status: true)
  @users           = User.all
  erb :adminpanel
end

post '/pedidos' do
    valor = true
  if params[:promociones] == "true"
    valor = true
  else
    valor = false
  end
  @user  = User.find_by(email: params[:email])
  if @user == nil
    @user  = User.create(name: params[:nombre], email: params[:email], telephone: params[:telefono], promotions: valor)
  else  
  end
  @order = Order.create(user_id: @user.id, name: params[:nombre], email: params[:email], telephone: params[:telefono], date: params[:fecha])
  @cake  = Cake.create(order_id: @order.id, flavor: params[:flavor], size: params[:tamano], instructions: params[:instrucciones])
  erb :pedidofinal, layout: false
end

get '/order/finalizar/:order_id' do
  @order = Order.find(params[:order_id])
  @order.status = true
  @order.save
  @pendingorders   = Order.where(status: false)
  @completedorders = Order.where(status: true)
  redirect '/adminpanel'
end

get '/order/eliminar/:order_id' do
  @order = Order.find(params[:order_id])
  @order.destroy
  @pendingorders   = Order.where(status: false)
  @completedorders = Order.where(status: true)
  erb :adminpanel
end
