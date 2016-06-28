require 'pry'
class Barracks

  attr_accessor :gold, :food, :health, :lumber

  def initialize
    @gold =1000
    @food = 80
    @health = 500
    @lumber = 500
  end

  def damage(attack_power)
    @health -= attack_power
  end

  #footman
  def can_train_footman?
    #binding.pry
    self.gold >= 135 && self.food >= 2
  end

  def train_footman
    if can_train_footman?
      @gold -=135
      @food -=2
      footman = Footman.new
    else
      return nil
    end
  end

  #peasant
  def can_train_peasant?
    self.gold >= 90 && self.food >= 5
  end

  def train_peasant
    if can_train_peasant?
      @gold -=90
      @food -=5
      peasant = Peasant.new
    else
      return nil
    end
  end

  #seigeengine
  def can_train_seigeengine?
    #binding.pry
    self.gold >= 200 && self.food >= 3 && self.lumber >= 60
  end

  def train_seigeengine
    if can_train_seigeengine?
      @gold -=200
      @food -=3
      @lumber -= 60
      seigeengine = SiegeEngine.new
    else
      return nil
    end
  end
end
