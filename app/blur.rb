class Blur
  def convert srcMat, dstMat
    Cv::blur(srcMat, dstMat, [50,50], [0,0], MCV_BORDER_DEFAULT)
  end
end
