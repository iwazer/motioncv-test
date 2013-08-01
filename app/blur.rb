class Blur
  def convert srcMat, dstMat
    MotionCV.blur(srcMat, dst:dstMat, size:[50,50], anchor:[0,0], borderType:MCV_BORDER_DEFAULT)
  end
end
