class CannyNot
  def convert srcMat, dstMat
    MotionCV.canny(srcMat, dst:dstMat, threshold1:35, threshold2:125, size:3);
    MotionCV.not(dstMat, dst:dstMat)
  end
end
