class Array
  def each_in_ranges &block
    return nil unless self.all? { |x| x.is_a? Range  }
    self.each { |r| r.each(&block) }
  end
end
