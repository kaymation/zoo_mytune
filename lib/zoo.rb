class Zoo
  attr_reader :name, :season_opening_date, :season_closing_date, :cages, :employees

  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = []
    @employees = []
    10.times do
      @cages << Cage.new
    end
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    date.between?(season_opening_date, season_closing_date)
  end

  def add_animal(animal)
    first_empty_cage = @cages.find{|cage| cage.empty?}
    if first_empty_cage.nil?
      raise ZooAtCapacity
    end
    first_empty_cage.animal = animal
  end

  def visit
    string = ""
    employees.each do |employee|
      string += "#{employee.greet}\n"
    end
    full_cages = @cages.select{|cage| !cage.empty?}
    full_cages.each do |cage|
      string += "#{cage.animal.speak}\n"
    end
    string
  end

end

class ZooAtCapacity < StandardError;

end
