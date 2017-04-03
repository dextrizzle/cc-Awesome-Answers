#this is our Question model. it inherits from `ApplicationRecord` which inherits
#from `activerecord::base` which is a class that comes from rails
#all the functionalities we're going to be using in our question model come
#from `activerecord::base` which leverages ruby'ys meta programming features
class Question < ApplicationRecord
  has_many :answers

  # has_many :answers adds the following instance methods
  # to this model, Question:
  # answers
  # answers<<(object, ...)
  # answers.delete(object, ...)
  # answers.destroy(object, ...)
  # answers=(objects)
  # answers
  # answers=(ids)
  # answers.clear
  # answers.empty?
  # answers.size
  # answers.find(...)
  # answers.where(...)
  # answers.exists?(...)
  # answers.build(attributes = {}, ...)
  # answers.create(attributes = {})
  # answers.create!(attributes = {})
  # http://guides.rubyonrails.org/association_basics.html#has-many-association-reference


  # validates(:title, { presence: true, uniqueness: true })
  validates(:title, { presence: { message: 'must be present!' },
                      uniqueness: true,
                      exclusion: { in: %w(Apple Microsoft Sony) } })
  validates(:body,{ presence: true, length: { minimum: 5 } })
  validates :view_count, presence: true

  #this is used for custom-validation method, we expect to have a method called
  #`no_monkey` defined, ideally in the private section of the class
  validate :no_monkey

  after_initialize :set_defaults
  before_validation :titleize_title


  # scope :recent_five, lambda { order(created:at: :desc).limit(5) }

  def self.recent_five
    order(created_at: :desc).limit(5)
  end

  private

  def titleize_title
    self.title = title.titleize if title.present?
  end

  def set_defaults
    self.view_count ||= 0
  end

  def no_monkey
    if title.present? && title.downcase.include?('monkey')
      #this will make the record invalid, even if there is error on the record
      #by using errors.add then the record won't save because it won't be valid
      errors.add(:title, 'can\'t include monkey!')
    end
  end

end
