class HotelsController < ApplicationController
  expose :hotels, -> { Hotel.all }

  def index
  end
end
