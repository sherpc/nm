module Plot
  def self.render x_label = "X", y_label = "Y", title = "", filename = nil, data
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
        
        plot.data = data
      end
    end
  end
  
  def self.ds x, y, title=nil, with="linespoints"
    require 'gnuplot'
    Gnuplot::DataSet.new( [x, y] ) do |ds|
      ds.with = with
      ds.notitle unless title
      ds.title = title if title
    end
  end
end
