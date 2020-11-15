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
require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
