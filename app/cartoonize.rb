class Cartoonize
  def convert srcMat, dstMat
    pre_process(srcMat, srcMat)

    outline_image = MotionMat.new
    detect_outline(srcMat, outline_image)

    black_part = MotionMat.new
    make_black_part(srcMat, black_part)

    toned_part = MotionMat.new
    make_toned_part(srcMat, toned_part)

    Cv::subtract(black_part, outline_image, srcMat)
    Cv::subtract(srcMat, toned_part, srcMat)

    Cv::cvtColor(srcMat, dstMat, CV_GRAY2BGR)
  end

  def pre_process src, dst
    scale = if src.size.width > src.size.height
              640.0 / src.size.width
            else
              640.0 / src.size.height
            end
    Cv::resize(src, dst, [0,0], scale, scale, CV_INTER_LANCZOS4)
    Cv::cvtColor(dst, dst, CV_RGB2GRAY)
    Cv::equalizeHist(dst, dst)
  end

  def detect_outline src, dst
    Cv::GaussianBlur(src, dst, [5, 5], 1.5, 1.5)
    Cv::Canny(dst, dst, 1.0, 100.0)
  end

  def make_black_part src, dst
    Cv::threshold(src, dst, 40.0, 255.0, CV_THRESH_BINARY)
  end

  def make_toned_part src, dst
    medium_part = MotionMat.new
    darken_part = MotionMat.new
    make_black_part(src, darken_part)
    Cv::threshold(src, medium_part, 140.0, 255.0, CV_THRESH_BINARY)
    Cv::bitwise_xor(medium_part, darken_part, dst)

    tone = Cv::MotionMatFromUIImage(UIImage.imageNamed("tone01.png"))
    Cv::cvtColor(tone, tone, CV_RGB2GRAY)
    width = dst.size.width.to_f / tone.size.width.to_f
    height = dst.size.height.to_f / tone.size.height.to_f
    Cv::resize(tone, tone, [0, 0], width, height)
    Cv::min(dst, tone, dst)
  end
end
