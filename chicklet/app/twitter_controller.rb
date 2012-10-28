class TwitterController < UITableViewController
  def viewDidLoad
    @simple_twitter = SimpleTwitter.alloc().init()

    view.dataSource = @simple_twitter
    view.delegate = self
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    TweetCell.heightForTweet(@simple_twitter.tweets[indexPath.row], tableView.frame.size.width)
  end
  
  def reloadRowForTweet(tweet)
    row = @simple_twitter.tweets.index(tweet)
    if row
      view.reloadRowsAtIndexPaths([NSIndexPath.indexPathForRow(row, inSection:0)], withRowAnimation:false)
    end
  end
end