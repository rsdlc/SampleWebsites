#================================
#== Controlador  de Respuestas ==
#================================

get '/answers/:question_id' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @question = Question.find(params[:question_id])
    @answers = @question.answers  
    erb :answers
  else
    redirect  '/'
  end
end

post '/answers/:question_id/new' do
  @question = Question.find(params[:question_id])
  @user = User.find(session[:user_id])
  @answer = @question.answers.create(title: params[:title],body: params[:respuesta],likes: 0)
  @answer = @answer.update!(user_id: @user.id)
  redirect request.env['HTTP_REFERER']
end

get '/answer/like/:id' do 
  if session[:user_id]
    answer = Answer.find(params[:id])
    if answer
      answer.likes += 1
      answer.save
      redirect request.env['HTTP_REFERER']
    end
  else
    redirect  '/'
  end
end

#================================
#== Controlador  de Respuestas ==
#================================