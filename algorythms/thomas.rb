class Thomas < Solution
  attr_reader :answer, :P, :Q, :answer

  def initialize data=nil
    super data
    @matrix[0] = [0] + @matrix[0]
    @matrix[2] << 0
    @n = d.length - 1
  end
  
  def direct
    @P = Array.new(@n+1,0)
    @Q = Array.new(@n+1,0)

    for i in 0..@n
      @P[i] = -c[i] / (b[i] + a[i] * @P[i-1])
      @Q[i] = (d[i] - a[i] * @Q[i-1]) / (b[i] + a[i] * @P[i-1])
    end
  end

  def solve
    direct if @P.nil?
    @answer = Array.new(@n+1)
    @answer[@n] = @Q[@n]
    (@n-1).downto(0).each { |i| @answer[i] = @P[i] * @answer[i+1] + @Q[i] }
  end

  def print_results
    puts "Thomas algorythm for triangular matrix. Start matrix:"
    print Matrix.new(@matrix)
    puts "Solution:\n"
    p @answer
  end

  private

  def a; @matrix[0]; end
  def b; @matrix[1]; end
  def c; @matrix[2]; end
  def d; @matrix[3]; end

end
