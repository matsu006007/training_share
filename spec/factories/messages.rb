FactoryBot.define do
  factory :message do
    text        {Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4)}
    association :user 
    association :tweet
  end
end
