# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit

    attr_reader :damage

    def initialize
        # Need to default the 2 instance variables here
        # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
        # @health_points = 60
        # @attack_power = 10
        super(60, 10)
        @damage = 10
    end

    def attack!(enemy)
      enemy.damage(10)

    end

    def damage(ap)
      @health_points -= ap
    end
end
