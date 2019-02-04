class Question < ApplicationRecord
   
  belongs_to :user
  has_many :answers, dependent: :destroy
  
  validates_presence_of :title, :description


  scope :latest, ->{ select(:id, :title, :description, :status).order(updated_at: :desc) }
  scope :pending_first, -> { select(:id, :title, :description, :status).order(status: :asc , updated_at: :desc) }
  scope :needing_help, -> { select(:id, :title, :description, :status).where(status: false).left_joins(:answers).group(:id).order('COUNT(answers.id) ASC')} #No encontre otra forma de poner el count, la espero en la correcion
  

  

  def your_answer? (answer_id)
  	self.answer_id == answer_id
  end

  def your_user? (user)
  	self.user == user
  end

  def toggle_true
  	self.status = true
  end


end
