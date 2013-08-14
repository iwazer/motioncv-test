class ImageViewController < UIViewController
  extend IB
  outlet :imageView, UIImageView

  attr_accessor :data, :selected_image

  def viewDidLoad
    super
    self.title = @data[:title]
    image = @selected_image || UIImage.imageNamed("sato.jpg")
    srcMat = MotionCV.MotionMatFromUIImage(image)
    dstMat = MotionMat.new
    @data[:converter].convert(srcMat, dstMat)
    @imageView.image = MotionCV.UIImageFromMotionMat(dstMat)
  end
end
