class TslDrawCircle
  def convert src, dst
    black_and_white = MotionMat.new
    TslBlackImage.new.convert(src, black_and_white)
    r = [src.width, src.height].max.to_f / 2.0
    Cv::circle(black_and_white,
               [src.width/2,src.height/2],
               (r/2).to_i,
               [255,255,255],
               MCV_FILLED)
    dst.set(black_and_white)
  end
end
