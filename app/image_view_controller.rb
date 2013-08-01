class ImageViewController < UIViewController
  extend IB
  outlet :imageView, UIImageView

  attr_accessor :data

  def viewDidLoad
    super
    self.title = @data[:title]
    srcMat = MotionCV.MotionMatFromUIImage(UIImage.imageNamed("sato.jpg"))
    dstMat = MotionMat.new
    @data[:converter].convert(srcMat, dstMat)
    @imageView.image = MotionCV.UIImageFromMotionMat(dstMat)
  end
end
