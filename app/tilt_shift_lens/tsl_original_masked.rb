class TslOriginalMasked
  def convert src, dst
    mask_src = MotionMat.new
    TslDrawCircle.new.convert(src, mask_src)
    divided = []
    Cv::split(mask_src, divided)
    mask = divided[0]
    Cv::bitwise_and(src, src, dst, mask)
  end
end
