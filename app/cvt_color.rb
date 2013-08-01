class CvtColor
  def convert srcMat, dstMat
    MotionCV.cvtColor(srcMat, dst:dstMat, code:CV_RGB2GRAY)
  end
end
