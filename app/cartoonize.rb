class Cartoonize
  def convert srcMat, dstMat
    pre_process(srcMat, srcMat)

    outline_image = MotionMat.new
    detect_outline(srcMat, outline_image)

    black_part = MotionMat.new
    make_black_part(srcMat, black_part)

    toned_part = MotionMat.new
    make_toned_part(srcMat, toned_part)

    MotionCV.subtract(black_part, src:outline_image, dst:srcMat)
    MotionCV.subtract(srcMat, src:toned_part, dst:srcMat)

    MotionCV.cvtColor(srcMat, dst:dstMat, code:CV_GRAY2BGR)
  end

  def pre_process src, dst
    scale = if src.size.width > src.size.height
              640.0 / src.size.width
            else
              640.0 / src.size.height
            end
    MotionCV.resize(src, dst:dst, dsize:[0,0],
                    fx:scale, fy:scale, interpolation:CV_INTER_LANCZOS4)
    MotionCV.cvtColor(dst, dst:dst, code:CV_RGB2GRAY)
    MotionCV.equalizeHist(dst, dst:dst)
  end

  def detect_outline src, dst
    MotionCV.GaussianBlur(src, dst:dst, size:[5, 5], sigmaX:1.5, sigmaY:1.5)
    MotionCV.Canny(dst, dst:dst, threshold1:1.0, threshold2:100.0)
  end

  def make_black_part src, dst
    MotionCV.threshold(src, dst:dst,
                       thresh:40.0, maxVal:255.0, thresholdType:CV_THRESH_BINARY)
  end

  def make_toned_part src, dst
    medium_part = MotionMat.new
    darken_part = MotionMat.new
    make_black_part(src, darken_part)
    MotionCV.threshold(src, dst:medium_part,
                       thresh:140.0, maxVal:255.0, thresholdType:CV_THRESH_BINARY)
    MotionCV.bitwise_xor(medium_part, src:darken_part, dst:dst);

    tone = MotionCV.MotionMatFromUIImage(UIImage.imageNamed("tone01.png"))
    MotionCV.cvtColor(tone, dst:tone, code:CV_RGB2GRAY)
    width = dst.size.width.to_f / tone.size.width.to_f
    height = dst.size.height.to_f / tone.size.height.to_f
    MotionCV.resize(tone, dst:tone, dsize:[0, 0], fx:width, fy:height)
    MotionCV.min(dst, src:tone, dst:dst)
  end
end
