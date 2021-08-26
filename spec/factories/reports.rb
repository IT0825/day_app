FactoryBot.define do
  factory :report do
    title              { 'テスト' }
    text               { '確認テスト' }
    association :user
  end
end
