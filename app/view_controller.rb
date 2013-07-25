class ViewController < UIViewController
  extend IB
  outlet :imageView, UIImageView

  CV_BGR2GRAY = 6 # defined opencv2/imgproc/types_c.h

  def viewDidLoad
    super
    srcMat = MotionCV.MotionMatFromUIImage(UIImage.imageNamed("rubymotion_tokyo.png"))
    greyMat = MotionMat.new
    MotionCV.cvtColorInput(srcMat, output:greyMat, code:CV_BGR2GRAY)
    @imageView.image = MotionCV.UIImageFromMotionMat(greyMat)
  end
end
