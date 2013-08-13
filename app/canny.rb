class Canny
  def convert srcMat, dstMat
    MotionCV.canny(srcMat, dst:dstMat, threshold1:20, threshold2:120, size:3);
  end
end
