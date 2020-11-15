class CreateAnswerOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_options do |t|
      t.bigint :question_id
      t.bigint :next_question_id
      t.string :option_text
      t.string :option_value
      t.integer :order, default: 1

      t.timestamps
    end
    add_index :answer_options, :question_id
    add_index :answer_options, :next_question_id
    add_index :answer_options, :order
    add_index :answer_options, :updated_at
    add_index :answer_options, [:order, :updated_at]
  end
end
