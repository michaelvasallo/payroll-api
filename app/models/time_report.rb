class TimeReport < ApplicationRecord
  has_many :time_entries, dependent: :destroy
  accepts_nested_attributes_for :time_entries
end
