class TslBlackImage
  def convert src, dst
    black = MotionMat.alloc.initWithSize([src.width, src.height], [0, 0, 0])
    dst.set(black)
  end
end
