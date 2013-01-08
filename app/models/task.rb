class Task < ActiveRecord::Base
  attr_accessible :expires_on, :is_done, :name, :project_id, :rank
  belongs_to :project
  delegate :user_id, :to => :project
  before_create :set_defaults
  default_scope order('rank DESC')
  validates :name, presence: true
  validates_uniqueness_of :name, scope: [:project_id]

  def tasks_for_rank_change(direction = 0)
    curr_rank = rank || 0
    new_rank = curr_rank + direction
    max_rank = maximum_rank

    return 0 if direction == 0 || new_rank <=0 || (curr_rank + direction) > max_rank

    tasks_curr_rank = Task.where("project_id = ? and rank = ? and id <> ?", project_id, new_rank, id)
  end

  def expired?
    expires_on < Date.today && !is_done
  end

  protected
  def set_defaults
    self.rank = maximum_rank + 1
    self.expires_on = Date.today + 3.days
  end

  def maximum_rank
    Task.where(project_id: project.id).maximum(:rank) || 0
  end
end
