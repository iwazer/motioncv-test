class CopyWithMask
  def convert src, dst
    mask = MotionMat.alloc.initWithRows(src.rows, cols:src.cols, channels:1)
    src.copyTo(dst, mask)
  end
end
