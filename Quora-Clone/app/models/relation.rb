class Relation < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  after_create :one_more

  private
  def one_more
    cat_id = self.category_id
    if cat_id
      cat = Category.find(cat_id)
      if cat
        cat.n_folowers=cat.n_folowers+1
        cat.save
      end
    end
  end

  # Remember to create a migration!
end
