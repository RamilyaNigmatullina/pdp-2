class Hotels::Destroy
  include Interactor

  delegate :record, :record_params, to: :context

  def call
    record.destroy || context.fail!
  end
end
