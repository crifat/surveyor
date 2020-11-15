require 'rails_helper'

RSpec.describe Survey, type: :model do
  # associations
  it { should have_many(:questions) }

  # validations
  it { should validate_presence_of(:name) }
end
