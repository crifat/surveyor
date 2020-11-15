# == Schema Information
#
# Table name: question_answers
#
#  id          :bigint           not null, primary key
#  question_id :bigint
#  answer_id   :bigint
#  answer_text :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class QuestionAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :answer

  validates_presence_of :answer_text
end
