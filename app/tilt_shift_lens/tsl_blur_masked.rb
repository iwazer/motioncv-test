class TslBlurMasked
  def convert src, dst
    mask_src = MotionMat.new
    TslDrawCircle.new.convert(src, mask_src)
    blur_src = MotionMat.new
    TslGaussianBlur.new.convert(src, blur_src)
    divided = []
    Cv::split(mask_src, divided)
    mask = divided[0]
    Cv::bitwise_not(mask, mask)
    Cv::bitwise_and(blur_src, blur_src, dst, mask)
  end
end
