require 'rails_helper'

RSpec.describe Answer, type: :model do
  # associations
  it { should have_many(:question_answers) }
  it { should have_one(:question) }
end
