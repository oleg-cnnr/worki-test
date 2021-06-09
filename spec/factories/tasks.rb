FactoryBot.define do
  factory :task do
    addresses { build_list :address, 3 }
  end
end
