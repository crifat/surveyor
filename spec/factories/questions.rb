FactoryBot.define do
  factory :question do
    question_text { Faker::Lorem.word }
    survey_id { nil }
    order { 1 }
    question_type { :free_text }
  end
end