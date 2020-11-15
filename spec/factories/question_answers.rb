FactoryBot.define do
  factory :question_answer do
    question_id { nil }
    answer_id { nil }
    answer_text { Faker::Lorem.word }
  end
end