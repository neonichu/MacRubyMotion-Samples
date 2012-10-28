class Tweet
  attr_reader :from_user_name, :text, :profile_image_url
  attr_accessor :profile_image

  def initialize(dict)
    @from_user_name = dict['from_user_name']
    @text = dict['text']
    @profile_image_url = dict['profile_image_url']
    @profile_image = nil
  end
end
