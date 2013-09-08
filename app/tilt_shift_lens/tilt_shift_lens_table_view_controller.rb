class TiltShiftLensTableViewController < UITableViewController
  extend IB

  attr_accessor :selected_image

  def viewDidLoad
    @rows = [
      {title: "Create black image for mask", converter: TslBlackImage.new},
      {title: " & Draw circle", converter: TslDrawCircle.new},
      {title: "Original", converter: TslOriginal.new},
      {title: "GaussianBlur", converter: TslGaussianBlur.new},
      {title: "Original masked", converter: TslOriginalMasked.new},
      {title: " & Blur masked", converter: TslBlurMasked.new},
      {title: " & Result", converter: TslResult.new},
    ]
  end

  def tableView tableView, numberOfRowsInSection:section
    @rows.count
  end

  def tableView tableView, cellForRowAtIndexPath:indexPath
    cell = tableView.dequeueReusableCellWithIdentifier("Cell")
    unless cell
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:"Cell")
    end
    cell.textLabel.text = @rows[indexPath.row][:title]
    cell
  end

  def tableView tableView, didSelectRowAtIndexPath:indexPath
    @data = @rows[indexPath.row]
    self.performSegueWithIdentifier("ImageView", sender:self)
  end

  def prepareForSegue segue, sender:sender
    if segue.identifier == "ImageView"
      controller = segue.destinationViewController
      controller.data = @data
      controller.selected_image = @selected_image
    end
  end
end
