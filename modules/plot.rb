module Plot
  def self.render x, y, x_label = "X", y_label = "Y", title = "", filename = nil
    require 'gnuplot'
    Gnuplot.open do |gp|
      Gnuplot::Plot.new( gp ) do |plot|
      
      unless filename.nil?
        plot.terminal "png"
        plot.output File.expand_path("../../plots/#{filename}.png", __FILE__)
      end

      plot.title title
      plot.ylabel y_label
      plot.xlabel x_label
      
      plot.data << Gnuplot::DataSet.new( [x, y] ) do |ds|
        ds.with = "linespoints"
        ds.notitle
      end
    end
  end
  end
end
