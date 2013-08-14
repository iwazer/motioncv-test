# -*- coding: utf-8 -*-
class TableViewController < UITableViewController
  extend IB

  def viewDidLoad
    self.navigationController.toolbarHidden = false
    @rows = [
      {title: "Blur", converter: Blur.new},
      {title: "cvtColor", converter: CvtColor.new},
      {title: "Canny", converter: Canny.new},
      {title: "Not", converter: Not.new},
      {title: "Canny+Not", converter: CannyNot.new},
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

  def take_phot sender
    if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceTypeCamera))
      picker = UIImagePickerController.alloc.init
      picker.delegate = self
      picker.allowsEditing = true
      picker.sourceType = UIImagePickerControllerSourceTypeCamera

      self.presentViewController(picker, animated:true, completion:nil)
    else
      App.alert("カメラを使用できません")
    end
  end

  def select_photo sender
    picker = UIImagePickerController.alloc.init
    picker.delegate = self
    picker.allowsEditing = true
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary

    self.presentViewController(picker, animated:true, completion:nil)
  end

  def imagePickerController picker, didFinishPickingMediaWithInfo:info
    @selected_image = info[UIImagePickerControllerEditedImage]

    picker.dismissViewControllerAnimated(true, completion:nil)
  end

  def imagePickerControllerDidCancel picker
    @selected_image = nil
    picker.dismissViewControllerAnimated(true, completion:nil)
  end
end


