shared_context :time_is_frozen do
  let(:current_time) { Time.new(2018, 8, 14, 14, 0, 0, "+03:00").in_time_zone("Moscow") }

  before { Timecop.freeze(current_time) }

  after { Timecop.return }
end
