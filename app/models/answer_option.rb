# == Schema Information
#
# Table name: answer_options
#
#  id               :bigint           not null, primary key
#  question_id      :bigint
#  next_question_id :bigint
#  option_text      :string
#  option_value     :string
#  order            :integer          default(1)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class AnswerOption < ApplicationRecord
  belongs_to :question
  belongs_to :next_question, class_name: 'Question', foreign_key: :next_question_id, optional: true

  before_save :clear_next_question_id

  validates_presence_of :option_text, :option_value

  def serialized_data
    {
        question_id: self.question_id,
        next_question_id: self.next_question_id,
        option_text: self.option_text,
        option_value: self.option_value,
        order: self.order
    }
  end

  private

  def clear_next_question_id
    return true if self.question.single_choice?

    self.next_question_id = nil
  end
end
