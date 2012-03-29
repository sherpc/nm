class << Math
  def sum(from,to,&block)
    (from..to).reduce(0) { |sum, i| sum + yield(i) }
  end

  def mul(from,to,&block)
    (from..to).reduce(1) { |mul, i| mul * yield(i) }
  end
end
