require 'gnuplot'
module Plot
  def self.render x, y
    Gnuplot.open do |gp|
      Gnuplot::Plot.new( gp ) do |plot|
  
      plot.title  "Array Plot Example"
      plot.ylabel "Y"
      plot.xlabel "X"
      
      plot.data << Gnuplot::DataSet.new( [y, x] ) do |ds|
        ds.with = "linespoints"
        ds.notitle
      end
    end
  end
  end
end
