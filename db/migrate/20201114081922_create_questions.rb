class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.bigint :survey_id
      t.text :question_text
      t.integer :order, default: 1
      t.integer :question_type, default: 1

      t.timestamps
    end
    add_index :questions, :survey_id
    add_index :questions, :order
    add_index :questions, :question_type
    add_index :questions, :updated_at
    add_index :questions, [:order, :updated_at]
  end
end
