class Unit

  attr_reader :health_points, :attack_power, :building_attack_mod

  def initialize(health_points,attack_power)
    @health_points = health_points
    @attack_power = attack_power
    @building_attack_mod = 2
  end

  def damage(attack_power)
    @health_points -= attack_power
  end

  def attack!(enemy)
      enemy.damage(@attack_power)
  end
end
