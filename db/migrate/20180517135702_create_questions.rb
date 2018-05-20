class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :question_groups do |t|
      t.string :title
      t.string :subtitle
    end

    create_table :questions do |t|
      t.text :text
      t.references :group, index: true
    end
  end
end
