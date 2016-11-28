class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :answers, dependent: :destroy
  after_create :one_more

  private
  def one_more
    cat_id = self.category_id
    if cat_id
      cat = Category.find(cat_id)
      if cat
        cat.n_questions=cat.n_questions+1
        cat.save
      end
    end
  end
end
