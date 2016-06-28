require_relative 'spec_helper'

# All units can attack and receive damage, so that logic should actually be on the Unit class, not the Peasant class
# This way, you don't have to add damage and attack methods on all types of units

# After making the tests pass, consider what modifications you can make to the Peasant and Footman classes to take advantage of this inheritence

describe SiegeEngine do

  before :each do
    @siegeengine = SiegeEngine.new
  end

  describe "#damage" do
    it "should reduce the unit's health_points by the attack_power specified" do
      @siegeengine.damage(12)
      #initial_health = @siegeengine.health_points
      expect(@siegeengine.health_points).to eq(400-12) # HP started at 400 but just got hit by 12 (see subject)
    end
  end

  describe "#attack! on a unit, not a siegeengine" do
    it "should deal no damage to a regular enemy unit" do
      enemy_unit = Unit.new(40, 5)
      expect(enemy_unit.health_points).to eq(40)
      @siegeengine.attack!(enemy_unit)
    end
  end

  describe "#attack! on a siegeengine" do
    it "should deal the appropriate (attack power based) damage to the enemy siegeengine" do
      enemy_unit = SiegeEngine.new
      expect(enemy_unit.health_points).to eq(350)
      @siegeengine.attack!(enemy_unit)
    end
  end

  describe "#attack! on a Barracks" do
    it "should deal the appropriate (attack power based) damage to the enemy Barracks" do
      enemy_building = Barracks.new()
      expect(enemy_building).to receive(:damage).with(120)
      @siegeengine.attack!(enemy_building)
    end
  end

end
