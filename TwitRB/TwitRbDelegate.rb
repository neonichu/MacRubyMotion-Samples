# TwitRbDelegate.rb
# TwitRB
#
# Created by Boris Bügling on 17.11.09.
# Copyright 2009 - 2012. All rights reserved.

class TwitRbDelegate
	attr_accessor :table_view, :status_label
	attr_accessor :reload_button
  attr_accessor :updates

	def applicationDidFinishLaunching(notification)
		retrieveTweets(nil)
	end

  def initialize
    @updates = []
  end
	
	def retrieveTweets(sender)
    @status_label.stringValue = "Retrieving tweets..."
    @reload_button.enabled = false

    simple_twitter = SimpleTwitter.alloc().init()

    @updates = simple_twitter.tweets.map do |tweet|
      {
        :user => tweet.from_user_name,
        :tweet => tweet.text
      }
    end

    @table_view.reloadData

    @reload_button.enabled = true
    @status_label.stringValue = "Tweets loaded."
	end
end
