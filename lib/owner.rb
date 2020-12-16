require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def all_owners_cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def all_owners_dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def walk_dogs
    all_owners_dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    all_owners_cats.map {|cat| cat.mood = "happy"}
  end

  def sell_pets
    all_owners_dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    all_owners_cats.map do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    return "I have #{all_owners_dogs.count} dog(s), and #{all_owners_cats.count} cat(s)."
  end





end