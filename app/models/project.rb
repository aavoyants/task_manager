class Project < ActiveRecord::Base
  attr_accessible :name, :user_id
  belongs_to :user
  has_many :tasks, :dependent => :destroy
  validates :name, presence: true
  validates_uniqueness_of :name, scope: [:user_id]
end
