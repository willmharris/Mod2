class Monster < ApplicationRecord
    has_many :dm_monsters
    has_many :dms, through: :dm_monsters
end
