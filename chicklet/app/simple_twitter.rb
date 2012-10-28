class SimpleTwitter
  attr_reader :tweets

  def init
    $stderr.puts 'Current Reachability: ' + Reachability.reachabilityForInternetConnection.currentReachabilityString

    error_ptr = Pointer.new(:object)
    data = NSData.alloc.initWithContentsOfURL(
      NSURL.URLWithString("http://search.twitter.com/search.json?q=%23macoun"), 
      options:NSDataReadingUncached, error:error_ptr)

    if not data or not NSString.alloc.initWithData(data, encoding:NSUTF8StringEncoding).hasPrefix('{')
      if error_ptr[0]
        $stderr.puts 'Network error: ' + error_ptr[0].localizedDescription
      end
      data = NSData.dataWithContentsOfFile(NSBundle.mainBundle.pathForResource('twitter', ofType:'json'))
    end

    json = NSJSONSerialization.JSONObjectWithData(data, options:0, error:error_ptr)
    
    if not json
      $stderr.puts 'JSON error: ' + error_ptr[0].localizedDescription
      return
    end

    @tweets = []
    json['results'].each do |dict|
      @tweets << Tweet.new(dict)
    end

    self
  end

  def apply_filter(filter)
    if not @unfiltered_tweets
      @unfiltered_tweets = @tweets
    end

    @tweets = []
    @unfiltered_tweets.each do |tweet|
      @tweets << tweet if Regexp.new(filter).match(tweet.text)
    end
  end
 
  def tableView(tableView, numberOfRowsInSection:section)
    @tweets.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    tweet = @tweets[indexPath.row]
    TweetCell.cellForTweet(tweet, inTableView:tableView)
  end

end
