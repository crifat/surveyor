# == Schema Information
#
# Table name: questions
#
#  id            :bigint           not null, primary key
#  survey_id     :bigint
#  question_text :text
#  order         :integer          default(1)
#  question_type :integer          default("free_text")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Question < ApplicationRecord
  belongs_to :survey
  has_many :answer_options, -> {order(order: :asc, updated_at: :desc)}, dependent: :destroy
  has_many :question_answers
  has_many :answers, through: :question_answers, dependent: :destroy

  accepts_nested_attributes_for :answer_options, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :question_text

  enum question_type: {
      free_text: 1,
      single_choice: 2,
      multiple_choice: 3
  }

  enum status: [:inactive, :active]

  def serialized_data
    {
        id: self.id,
        survey_id: self.survey_id,
        question_text: self.question_text,
        order: self.order,
        question_type: self.question_type,
        answer_options: self.answer_options.map(&:serialized_data)
    }
  end

  def serialized_data_with_answer
    {
        id: self.id,
        survey_id: self.survey_id,
        question_text: self.question_text,
        question_type: self.question_type,
        answers: self.answers.includes(:question_answers).distinct.map(&:serialized_data)
    }
  end
end
