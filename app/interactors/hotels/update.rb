class Hotels::Update
  include Interactor

  delegate :record, :record_params, to: :context

  def call
    record.update(record_params) || context.fail!
  end
end
