# frozen_string_literal: true
# == Schema Information
#
# Table name: macros
#
#  id                :bigint(8)        not null, primary key
#  name              :string
#  macro_type        :integer
#  subject           :text
#  body              :text
#  macro_category_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_macros_on_macro_category_id         (macro_category_id)
#

class Macro < ApplicationRecord
  enum macro_type:  %i[email sms]

  validates :body, presence: true, if: -> { email? }
  validates :name, :macro_type, :subject, presence: true

  belongs_to :macro_category
end
