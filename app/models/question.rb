class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  after_initialize :init
  validates_presence_of :title, :description


  scope :latest, ->{ select(:id, :title, :description, :status).order(updated_at: :desc) }
  scope :pending_first, -> { order(status: :asc , updated_at: :desc) }
  scope :needing_help, -> { where(status: :false).left_joins(:answers).group(:id).order('COUNT(answers.id) ASC')}
  

  def init
  	self.status = false if self.status.nil?
  end

end
