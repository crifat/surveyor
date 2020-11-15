# == Schema Information
#
# Table name: answers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Answer < ApplicationRecord
  has_many :question_answers
  has_one :question, through: :question_answers

  accepts_nested_attributes_for :question_answers, reject_if: :all_blank

  def serialized_data
    {
        id: self.id,
        answer_text: self.answer_text
    }
  end

  def answer_text
    self.question_answers.map(&:answer_text).join(' | ')
  end
end
