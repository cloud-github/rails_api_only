# frozen_string_literal: true

module V1
  class MacroSerializer
    include FastJsonapi::ObjectSerializer
    belongs_to :macro_category
    attributes :macro_type, :name, :subject, :body, :created_at, :updated_at, :macro_category_id
  end
end
