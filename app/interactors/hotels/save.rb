class Hotels::Save
  include Interactor

  delegate :record, to: :context

  def call
    record.save || context.fail!
  end
end
