class Question < ActiveRecord::Base
  belongs_to :question_group, foreign_key: :group_id
end