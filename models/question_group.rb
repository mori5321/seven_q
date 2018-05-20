class QuestionGroup < ActiveRecord::Base
  has_many :questions, foreign_key: :group_id
end