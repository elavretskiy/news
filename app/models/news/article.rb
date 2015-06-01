module News
  class Article < ActiveRecord::Base
    validates :title, :annonce, :text, presence: { message: 'Заполните поле.' }
  end
end
