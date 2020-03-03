class Monster < ApplicationRecord
    has_many :dm_monsters
    has_many :dms, through: :dm_monsters
    validates :name, presence: true#, uniqueness: {case_sensitive: false}
    validates :size, presence: true
    validates :category, presence: true
    validates :alignment, presence: true
    validates :ac, presence: true
    validates :hp, presence: true
    validates :speed, presence: true
    validates :strength, presence: true
    validates :dexterity, presence: true
    validates :constitution, presence: true
    validates :intelligence, presence: true
    validates :wisdom, presence: true
    validates :charisma, presence: true
    validates :cr, presence: true
end
