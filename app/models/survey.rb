# == Schema Information
#
# Table name: surveys
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Survey < ApplicationRecord
  has_many :questions, -> {order(order: :asc, updated_at: :desc)}

  accepts_nested_attributes_for :questions, reject_if: :all_blank

  validates_presence_of :name

  def serialized_data
    {
        name: self.name,
        description: self.description,
        questions: self.questions.map(&:serialized_data)
    }
  end
end
