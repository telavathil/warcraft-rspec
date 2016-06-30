class Unit

  attr_reader :attack_power, :building_attack_mod, :unit_attack_mod, :health_points
  attr_accessor

  def initialize(health_points,attack_power)
    @health_points = health_points
    @attack_power = attack_power
    @building_attack_mod = 0.5
    @unit_attack_mod = 1
  end

  # def health_points=(a)
  #   @health_points = a
  # end

  def damage(attack_power)
    @health_points -= attack_power unless dead?
  end

  def attack!(enemy)
    #binding.pry
    case (enemy.class)

    when [Unit,Footman,SiegeEngine].include?(enemy.class)
        enemy.damage((@attack_power*@unit_attack_mod).ceil) unless dead?
      when Barracks
        enemy.damage((@attack_power*@building_attack_mod).ceil) unless dead?
    end
  end

  def dead?
    health_points <= 0
  end
end
