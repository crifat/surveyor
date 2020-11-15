class CreateQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_answers do |t|
      t.bigint :question_id
      t.bigint :answer_id
      t.string :answer_text

      t.timestamps
    end
    add_index :question_answers, :question_id
    add_index :question_answers, :answer_id
  end
end
