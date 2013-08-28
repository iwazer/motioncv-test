class BitwiseAndnotorxor
  def convert src, dst
    width = src.size.width
    height = src.size.height
    wl = width / 2
    wr = width - wl
    ht = height / 2
    hb = height - ht

    tl = src.crop([[0, 0], [wl, ht]])
    tr = src.crop([[wl, 0], [wr, ht]])
    bl = src.crop([[0, ht], [wl, hb]])
    br = src.crop([[wl, ht], [wr, hb]])

    tone = Cv::MotionMatFromUIImage(UIImage.imageNamed("tone01.png"))
    Cv::resize(tone, tone, [wl, ht])

    dtl, dtr, dbl, dbr, dt, db = 6.times.map{|i| MotionMat.new}
    Cv::bitwise_and(tl, tone, dtl)
    Cv::bitwise_not(tr, dtr)
    Cv::bitwise_or(bl, tone, dbl)
    Cv::bitwise_xor(br, tone, dbr)

    Cv::hconcat(dtl, dtr, dt)
    Cv::hconcat(dbl, dbr, db)
    Cv::vconcat(dt, db, dst)
  end
end
