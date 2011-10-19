Test_titanium.App =

  init: ->
    Ti.UI.setBackgroundColor '#000'
    Ti.UI.iPhone.statusBarStyle = Ti.UI.iPhone.StatusBar.OPAQUE_BLACK
    Test_titanium.App.initTabGroup()
    
  initTabGroup: ->
    Test_titanium.App.tabGroup = Ti.UI.createTabGroup()

    sampleWindow = Test_titanium.Views.Sample.createMainWindow
      title:            'Sample'
      id:               'sampleWindow'
      orientationModes: Test_titanium.Helpers.Application.createOrientiationModes

    Test_titanium.App.sampleWindow = Ti.UI.createTab
      id:               'sampleTab'
      className:        'tabElement'
      title:            'Tabbar Nativo'
      window:           sampleWindow
    
    
    Test_titanium.App.tabGroup.addTab Test_titanium.App.sampleWindow
    
    Test_titanium.App.tabGroup.addEventListener 'focus', (e) ->
      Test_titanium.App.currentTab = e.tab
      Ti.API.info(Test_titanium.App.currentTab)
    
    Test_titanium.App.tabGroup.open()