class CreateAnswerGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :question_rooms do |t|
      t.string :unique_id
      t.references :question_group, index: true
      t.timestamps
    end

    create_table :answer_groups do |t|
      t.string :name, null: false
      t.references :question_room, index: true
    end

    create_table :answers do |t|
      t.text :text
      t.references :answer_group, index: true
      t.references :question, index: true
    end
  end
end
