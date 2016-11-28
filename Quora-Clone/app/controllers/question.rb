#==============================
#== Controlador de Preguntas ==
#==============================
post '/make/question' do 
  if params[:category]!="" && params[:title]!="" && params[:body]!=""
    if Question.create(user_id:session[:user_id],category_id:params[:category].to_i,title:params[:title],body:params[:body],likes:0)
    return "yes"
    else
    return nil
    end 
  else
    return nil
  end
end

get '/question/like/:id' do
  if session[:user_id]
    question=Question.find(params[:id])
    if question
      question.likes += 1
      question.save
    end
    redirect request.env['HTTP_REFERER']
  else
    redirect  '/'
  end
end

get '/category/questions/:id' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @questions = Category.find(params[:id]).questions
    if @questions
      erb :questions, layout: true
    else
      redirect  '/'
    end
  else
    redirect  '/'
  end
end

get '/questions/user' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @questions = @user.questions
    if @questions
      erb :questions, layout: true
    else
      redirect  '/'
    end
  else
    redirect  '/'
  end  
end



#==============================
#== Controlador de Preguntas ==
#==============================