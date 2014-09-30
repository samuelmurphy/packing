

class Boxes

  def initialize
    @boxes_original_order = {}
    @boxes = {}
  end


  def load

    f = File.open("test/test1", "r")
    f.each_line{ |line|
      line.strip!
      dat = line.split(",")
      k = dat.shift
      dat.map!{|x| x.to_f}
      @boxes_original_order[k] = Marshal.load(Marshal.dump(dat))

      dat.sort!{|a,b| b <=> a}
      @boxes[k] = dat
    }
    f.close
  end

  def dbg
    p @boxes_original_order
    p @boxes

    @boxes.values.sort{|a,b| b <=> a}.each{|z| p z} 

  end



end

bb = Boxes.new

bb.load

bb.dbg

