class TslResult
  def convert src, dst
    mask_src = MotionMat.new
    TslDrawCircle.new.convert(src, mask_src)
    blur_src = MotionMat.new
    TslGaussianBlur.new.convert(src, blur_src)
    divided = []
    Cv::split(mask_src, divided)
    mask = divided[0]
    Cv::bitwise_and(src, src, dst, mask)
    Cv::bitwise_not(mask, mask)
    blur_dst = MotionMat.new
    Cv::bitwise_and(blur_src, blur_src, blur_dst, mask)
    Cv::bitwise_or(dst, blur_dst, dst)
  end
end
