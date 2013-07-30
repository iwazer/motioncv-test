class TableViewController < UITableViewController
  def viewDidLoad
    @rows = [
      "Grey Scale",
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
    cell.textLabel.text = @rows[indexPath.row]
    cell
  end

  def tableView tableView, didSelectRowAtIndexPath:indexPath
    self.performSegueWithIdentifier(@rows[indexPath.row], sender:self)
  end
end
