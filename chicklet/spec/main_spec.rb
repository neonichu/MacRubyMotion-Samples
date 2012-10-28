describe "Application 'chicklet'" do
  before do
    @app = UIApplication.sharedApplication
    @tweets_view = UIWindow.keyWindow.rootViewController.tableView
  end

  it "has one window" do
    @app.windows.size.should == 1
  end
end
