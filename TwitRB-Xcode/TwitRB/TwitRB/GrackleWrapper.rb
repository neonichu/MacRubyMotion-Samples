#
#  GrackleWrapper.rb
#  TwitRB
#
#  Created by Boris Bügling on 27.10.12.
#  Copyright 2012 __MyCompanyName__. All rights reserved.
#


class SimpleTwitter
    attr_reader :tweets

    def init
        require 'rubygems'
        require 'grackle'

        client = Grackle::Client.new
        data = client[:search].search? :q=>'macoun'

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
    
end