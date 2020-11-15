# == Schema Information
#
# Table name: responses
#
#  id              :bigint           not null, primary key
#  survey_id       :bigint
#  responder_name  :string
#  responder_email :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
