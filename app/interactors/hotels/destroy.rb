class Hotels::Destroy
  include Interactor

  delegate :record, to: :context

  def call
    record.destroy || context.fail!
  end
end
