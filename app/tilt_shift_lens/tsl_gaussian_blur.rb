class TslGaussianBlur
  def convert src, dst
    Cv::GaussianBlur(src, dst, [19,19], 10, 10)
  end
end
