class Post < ActiveRecord::Base
  belongs_to :person
  has_many :comments

  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :person
  
  accepts_nested_attributes_for :person
  attr_accessible :body, :name, :title, :person_attributes

  after_create :vote_the_fucker

  private

  def vote_the_fucker
    Person.increment_counter(:votes, person.id)
  end

end
