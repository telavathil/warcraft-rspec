class Unit

  attr_reader :health_points, :attack_power, :building_attack_mod, :unit_attack_mod

  def initialize(health_points,attack_power)
    @health_points = health_points
    @attack_power = attack_power
    @building_attack_mod = 0.5
    @unit_attack_mod = 1
  end

  def damage(attack_power)
    @health_points -= attack_power unless dead?
  end

  def attack!(enemy)
    case (enemy.class.class)
      when Unit
        enemy.damage((@attack_power*@unit_attack_mod).ceil) unless dead?
      when Barracks
        enemy.damage((@attack_power*@building_attack_mod).ceil) unless dead?
    end
  end

  def dead?
    @health_points <= 0
  end
end
