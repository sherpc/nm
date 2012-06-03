require 'gnuplot'
class Plot
  def initialize x, y
    @x, @y = x, y
  end

  def render
    Gnuplot.open do |gp|
      Gnuplot::Plot.new( gp ) do |plot|
  
      plot.title  "Array Plot Example"
      plot.ylabel "x"
      plot.xlabel "y"
      
      plot.data << Gnuplot::DataSet.new( [@x, @y] ) do |ds|
        ds.with = "linespoints"
        ds.notitle
      end
    end
  end
  end
end
