class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
  	@window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    @window.rootViewController = TwitterController.alloc.initWithStyle(UITableViewStylePlain)
    @window.makeKeyAndVisible
  end
end
