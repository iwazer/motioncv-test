class TslDistanceTransform
  def convert src, dst
    mask = MotionMat.new
    TslDrawWhite.new.convert(src, mask)
    Cv::cvtColor(mask, mask, CV_RGB2GRAY)
    Cv::distanceTransform(mask, dst, CV_DIST_L2, 3)
  end
end
