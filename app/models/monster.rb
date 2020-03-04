class Monster < ApplicationRecord
    has_many :dm_monsters
    has_many :dms, through: :dm_monsters
    has_many :actions
    has_many :abilities
    validates :name, presence: true
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
