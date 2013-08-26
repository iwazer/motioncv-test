class Canny
  def convert srcMat, dstMat
    Cv::canny(srcMat, dstMat, 20, 120, 3)
  end
end
