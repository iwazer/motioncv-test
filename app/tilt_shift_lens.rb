class TiltShiftLens
  def convert src, dst
    Cv::GaussianBlur(src, dst, [11,11], 15, 15)
  end
end
