class CvtColor
  def convert srcMat, dstMat
    Cv::cvtColor(srcMat, dstMat, CV_RGB2GRAY)
  end
end
