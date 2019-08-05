# frozen_string_literal: true

module V1
  class MacroCategorySerializer
    include FastJsonapi::ObjectSerializer

    attributes :name
  end
end
