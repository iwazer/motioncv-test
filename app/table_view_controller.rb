class TableViewController < UITableViewController
  def viewDidLoad
    @rows = [
      {title: "blur", converter: Blur.new},
      {title: "cvtColor", converter: CvtColor.new},
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
    end
  end
end
