class TslDrawWhite
  def convert src, dst
    black_and_white = MotionMat.new
    TslBlackImage.new.convert(src, black_and_white)
    radius = ([src.width, src.height].min.to_f / 2.0).to_i
    Cv::circle(black_and_white,
               [src.width/2,src.height/2], radius,
               [255,255,255], # white
               MCV_FILLED)
    Cv::circle(black_and_white,
               [src.width/2,src.height/2], radius,
               [255,255,255], # white
               MCV_FILLED)
    dst.set(black_and_white)
  end
end
