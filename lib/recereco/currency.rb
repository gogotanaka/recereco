module Recereco
  class Currency < Recereco::Base
    attr_reader :currency_code, :unit, :point, :name
  end
end