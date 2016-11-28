# Este archivo sirve para crear registros de prueba
module Seeds
  def self.user
    User.transaction do
      user1 = User.new(name:'Maximiliano', user_name:'Max Olac', email:'max@max.com',img:'Max.jpg',category:true)
      user1.password = 'max'
      user1.save
      user2 = User.new(name:'Rodrigo', user_name:'Rod', email:'ro@ro.com',img:'rod.jpg',category:false)
      user2.password = 'ro'
      user2.save
      user3 = User.new(name:'Maurio', user_name:'el Mau', email:'mau@mau.com',img:'mau.jpg',category:false)
      user3.password = 'mau'
      user3.save
      user4 = User.new(name:'Karla', user_name:'la Kar', email:'kar@kar.com',img:'karla.jpg',category:false)
      user4.password = 'kar'
      user4.save
      user5 = User.new(name:'Maryel', user_name:'la Mary', email:'mar@mar.com',img:'maryel.jpg',category:false)
      user5.password = 'mar'
      user5.save
      user6 = User.new(name:'Vanessa', user_name:'la Vane', email:'vane@vane.com',img:'vane.jpg',category:false)
      user6.password = 'vane'
      user6.save
      user7 = User.new(name:'Hector', user_name:'el hector', email:'hec@hec.com',img:'hec.jpg',category:false)
      user7.password = 'hec'
      user7.save
    end    
  end
  def self.category
    Category.transaction do
      category1 = Category.create(name:'History',n_questions: 0, n_folowers:0)
      category2 = Category.create(name:'Sports',n_questions: 0, n_folowers:0)
      category3 = Category.create(name:'Food',n_questions: 0, n_folowers:0)
      category4 = Category.create(name:'Travel',n_questions: 0, n_folowers:0)
      category5 = Category.create(name:'Scinece',n_questions: 0, n_folowers:0)
      category6 = Category.create(name:'Films',n_questions: 0, n_folowers:0)
      category7 = Category.create(name:'Music',n_questions: 0, n_folowers:0)
      category8 = Category.create(name:'Politics',n_questions: 0, n_folowers:0)
      category9 = Category.create(name:'Technology',n_questions: 0, n_folowers:0)
      category10 = Category.create(name:'Nature',n_questions: 0, n_folowers:0)
      category11 = Category.create(name:'Books',n_questions: 0, n_folowers:0)
      category12 = Category.create(name:'Fashion',n_questions: 0, n_folowers:0)
     end    
  end
  def self.question
    Question.transaction do
      q1 = Question.create(user_id:1,category_id:1,title:'¿Cómo se creó el mundo?',body:'Hace un tiempo que tengo esta duda y me gustaría saber que piensa la gente sobre esto.',likes:0)
      q2 = Question.create(user_id:2,category_id:5,title:'¿Cómo hacer un blog?',body:'Hace un tiempo que tengo esta duda y me gustaría saber que piensa la gente sobre esto.',likes:0)
      q3 = Question.create(user_id:3,category_id:2,title:'¿Cómo arreglo mi bici?',body:'Hace un tiempo que tengo esta duda y me gustaría saber que piensa la gente sobre esto.',likes:0)
      q4 = Question.create(user_id:4,category_id:5,title:'¿Leñador?¿De leña?',body:'Hace un tiempo que tengo esta duda y me gustaría saber que piensa la gente sobre esto.',likes:0)
      q5 = Question.create(user_id:5,category_id:5,title:'¿Cómo hacer una buena pregunta?',body:'Hace un tiempo que tengo esta duda y me gustaría saber que piensa la gente sobre esto.',likes:0)
      q6 = Question.create(user_id:6,category_id:5,title:'¿Por qué tenemos pesadillas?',body:'Hace un tiempo que tengo esta duda y me gustaría saber que piensa la gente sobre esto.',likes:0)

    end    
  end
  def self.answer
    Answer.transaction do
      a1 = Answer.create(user_id:2,question_id:1,title:'Verdad absoluta',body:'Un día me desperte y lo creé',likes:10)
      a4 = Answer.create(user_id:1,question_id:4,title:'Sí',body:'Sí de leña',likes:10)
    end    
  end
  def self.relation
    Relation.transaction do
      r1 = Relation.create(user_id:1,category_id:1)
      r1 = Relation.create(user_id:1,category_id:2)
      r1 = Relation.create(user_id:1,category_id:5)
      r2 = Relation.create(user_id:2,category_id:5)
    end    
  end
end
Seeds.user
Seeds.category
Seeds.question
Seeds.answer
Seeds.relation