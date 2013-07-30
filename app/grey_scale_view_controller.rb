class GreyScaleViewController < UIViewController
  extend IB
  outlet :imageView, UIImageView

  def viewDidLoad
    super
    srcMat = MotionCV.MotionMatFromUIImage(UIImage.imageNamed("sato.jpg"))
    greyMat = MotionMat.new
    MotionCV.cvtColorInput(srcMat, output:greyMat, code:CV_BGR2GRAY)
    @imageView.image = MotionCV.UIImageFromMotionMat(greyMat)
  end
end
