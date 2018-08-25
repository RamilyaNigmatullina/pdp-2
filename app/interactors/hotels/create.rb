class Hotels::Create
  include Interactor

  delegate :record, to: :context

  def call
    record.save || context.fail!
  end
end
