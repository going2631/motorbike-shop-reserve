FactoryBot.define do

  factory :reservation do
    service_id               {"1"}
    customer_id              {"1"}
    manufacturer             {"neko"}
    name                     {"neko"}
    displacement             {"1"}
    extra                    {"neko"}
    start_time               {"2021-07-10 15:00:00"}
    finish_time              {"2021-07-10 16:00:00"}
  end

end



