# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  title          :string
#  band_id        :integer
#  year           :integer
#  recording_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#


class Album < ApplicationRecord
  validates :title, null: false
  validates :year, null: false, inclusion: 1900..2018
  validates :recording_type, inclusion: { in: %w(live studio),
    message: "not valide recording type" }

  belongs_to :band,
             foreign_key: :band_id,
             class_name: :Band
end
