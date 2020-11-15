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
require 'test_helper'

class AnswerOptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
