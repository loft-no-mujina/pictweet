FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    # email                 {"kkk@gmail.com"}
    # 上記の記述が下の記述と重複していた
    password              {"00000000"}
    password_confirmation {"00000000"}
    sequence(:email) {Faker::Internet.email}
    # ランダムなメールを指する。
  end
end
