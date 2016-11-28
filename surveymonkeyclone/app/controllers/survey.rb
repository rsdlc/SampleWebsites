#===============================
#== Controlador de encuestras ==
#===============================
get '/surveys/all' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @surveys = Survey.all
    erb :surveys, layout: true
  else
    erb :error, layout: false
  end
end
#==============================================================================
get '/surveys/:survey_id' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @survey = Survey.find(params[:survey_id])
    erb :survey, layout: true
  else
    erb :error, layout: false
  end
end
#==============================================================================
post '/survey/submit' do
  p "*" * 50
  p params
  p params.count
  p "*" * 50
  @user = User.find(session[:user_id])
  @survey = Survey.find(params[:survey])
  @participation = Participation.create(user_id: @user.id,survey_id: @survey.id)
  response = Response.create(participation_id: @participation.id)
  params[:question].each do |x,y|
    Relation.create(option_id: y,response_id: response.id)
  end
  erb :mainpage, layout: true
end
#==============================================================================
post '/make/survey/' do 
  p survey = Survey.create(title:params[:title],user_id: session[:user_id])
  resp = "Success"
  if survey
    count = 0
    params[:questions].each do |q|
     p question = Question.create(survey_id: survey.id,question:q)
      if question
        params[:options][count.to_s].each do |op|
       p option = Option.create(question_id:question.id,option:op)
        end
        count += 1
      else
        resp = "Problem in options"
      end
    end
  else
    resp = "Problem in questions"
  end
  return resp
end
#===============================
#== Controlador de encuestras ==
#===============================