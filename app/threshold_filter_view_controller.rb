class ThresholdFilterViewController < UIViewController
  extend IB
  outlet :imageView, UIImageView

  def viewDidLoad
    super
    srcMat = MotionCV.MotionMatFromUIImage(UIImage.imageNamed("sato.jpg"))
    blurMat = MotionMat.new
    MotionCV.GaussianBlur(srcMat, dst:blurMat, sizeWidth:9, sizeHeight:9, sigmaX:10, sigmaY:10)
    greyMat = MotionMat.new
    MotionCV.cvtColorInput(blurMat, output:greyMat, code:CV_RGB2GRAY)
    atMat = MotionMat.new
    MotionCV.adaptiveThreshold(greyMat, dst:atMat, maxValue:255, adaptiveMethod:CV_ADAPTIVE_THRESH_GAUSSIAN_C, thresholdType:CV_THRESH_BINARY, blockSize:19, C:3)
    @imageView.image = MotionCV.UIImageFromMotionMat(atMat)
  end
end
