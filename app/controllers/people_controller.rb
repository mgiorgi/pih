class PeopleController < ApplicationController

  def index
    first, *remaining_text = params[:term].split(' ')
    second = remaining_text.join(' ')
    conditions = generate_conditions(first, second)
    people = Person.where(conditions)
    render :json => people.map { |person| { :value => person.name, :id => person.id } }
  end

  private

  def generate_conditions(first, second = nil)
    return ["UPPER(name) LIKE :first", { :first => "%#{first.upcase}%" }] if second.blank?
    [ "UPPER(name) LIKE :first OR UPPER(name) LIKE :second", { :first => "%#{first.upcase}%", :second => "%#{second.upcase}%" }]
  end
end
