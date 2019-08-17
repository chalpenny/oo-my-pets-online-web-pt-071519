require'pry'

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @species = "human"
    @name = name
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat_by_string)
    new_cat = Cat.new(cat_by_string, self)
  end

  def buy_dog(dog_by_string)
    new_dog = Dog.new(dog_by_string, self)
  end

  def walk_dogs
    self.dogs.each {|x| x.mood = "happy"}
  end


end
