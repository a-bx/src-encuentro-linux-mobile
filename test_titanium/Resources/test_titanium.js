(function() {
  Test_titanium.App = {
    init: function() {
      Ti.UI.setBackgroundColor('#000');
      Ti.UI.iPhone.statusBarStyle = Ti.UI.iPhone.StatusBar.OPAQUE_BLACK;
      return Test_titanium.App.initTabGroup();
    },
    initTabGroup: function() {
      var sampleWindow;
      Test_titanium.App.tabGroup = Ti.UI.createTabGroup();
      sampleWindow = Test_titanium.Views.Sample.createMainWindow({
        title: 'Sample',
        id: 'sampleWindow',
        orientationModes: Test_titanium.Helpers.Application.createOrientiationModes
      });
      Test_titanium.App.sampleWindow = Ti.UI.createTab({
        id: 'sampleTab',
        className: 'tabElement',
        title: 'Sample',
        window: sampleWindow
      });
      Test_titanium.App.tabGroup.addTab(Test_titanium.App.sampleWindow);
      Test_titanium.App.tabGroup.addEventListener('focus', function(e) {
        Test_titanium.App.currentTab = e.tab;
        return Ti.API.info(Test_titanium.App.currentTab);
      });
      return Test_titanium.App.tabGroup.open();
    }
  };
  Test_titanium.Helpers.Application = {
    createOrientiationModes: function() {
      var modes;
      modes = [Titanium.UI.PORTRAIT, Titanium.UI.UPSIDE_PORTRAIT, Titanium.UI.LANDSCAPE_LEFT, Titanium.UI.LANDSCAPE_RIGHT];
      return modes;
    }
  };
  Test_titanium.Views.Sample.createMainWindow = function(options) {
    var window;
    window = Ti.UI.createWindow(options);
    return window;
  };
}).call(this);
