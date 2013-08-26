class CannyNot
  def convert srcMat, dstMat
    Cv::canny(srcMat, dstMat, 35, 125, 3)
    Cv::not(dstMat, dstMat)
  end
end
