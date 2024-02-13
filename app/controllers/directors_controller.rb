class DirectorsController < ApplicationController
  def index
    render ({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")
    matching_records = Director.where ({ :id => the_id })
    @the_director = matching_records.at(0)
      render({ :template => "director_templates/details" })
  end

  def youngest
      matching_records = Director.where.not({ :dob =>  nil}).all.order({ :dob => :asc})
      the_director = matching_records.last
      @director_name = the_director.name
      @director_dob = the_director.dob.strftime ('%B %e %Y')
      @id = the_director.id
      render({ :template => "director_templates/youngest"})
  end

  def eldest
    matching_records = Director.where.not({ :dob =>  nil}).all.order({ :dob => :desc})
    the_director = matching_records.last
    @director_name = the_director.name
    @director_dob = the_director.dob.strftime ('%B %e %Y')
    @id = the_director.id
    render ({ :template => "director_templates/eldest"})
  end 
end
