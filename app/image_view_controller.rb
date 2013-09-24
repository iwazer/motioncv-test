class ImageViewController < UIViewController
  extend IB
  outlet :imageView, UIImageView

  attr_accessor :data, :selected_image

  def viewDidLoad
    super
    self.title = @data[:title]
    image = @selected_image || UIImage.imageNamed("sato.jpg")
    srcMat = Cv::MotionMatFromUIImage(image)
    dstMat = MotionMat.new
    @data[:converter].convert(srcMat, dstMat)
    @imageView.image = Cv::UIImageFromMotionMat(dstMat)
  end
end
