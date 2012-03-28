class << Math
  def sum(from,to,&block)
    (from..to).reduce(0) { |sum, i| sum + yield(i) }
  end
end
