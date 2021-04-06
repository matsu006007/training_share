FactoryBot.define do
  factory :user do
    nickname       {Faker::Name.first_name }
    email          {Faker::Internet.free_email}
    password       {Faker::Internet.password(min_length: 6)}
    password_confirmation     {password}
    image          {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png'))}
    target         {Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4)}
    comment        {Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4)}
    prefecture_id         {2}
    training_frequency_id    {2}
  end
end
