FactoryBot.define do
  factory :tweet do
    title       {Faker::Book.title}
    genre_id    {2}
    content     {Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4)}
    association :user 
  end
end
