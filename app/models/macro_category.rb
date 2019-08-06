# == Schema Information
#
# Table name: macro_categories
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MacroCategory < ActiveRecord::Base

  has_one :macro
end
