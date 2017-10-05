class Station

  attr_reader :name, :zone

  def initialize(info)
    @name = info[:name]
    @zone = info[:zone]
  end

  def to_s
    "[#{name}:#{zone}]"
  end

end