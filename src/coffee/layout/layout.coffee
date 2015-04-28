Tyto.module 'Layout', (Layout, App, Backbone) ->
  Layout.Root = Backbone.Marionette.LayoutView.extend
    el: '#tyto-app',
    regions:
      menu:   '#tyto-menu'
      content: '#tyto-content'
  ###
    this.collection will be the board list.
  ###
  Layout.Menu = Backbone.Marionette.ItemView.extend
    template: tytoTmpl.menu
    ui:
      add: '#add-board'
      boardSelector: '#board-selector'
    events:
      'click @ui.add': 'addBoard',
      'change @ui.boardSelector': 'showBoard'
    collectionEvents:
      'all': 'render'
    addBoard: ->
      this.collection.create
        title: 'MY NEW BOARD'
      return
    showBoard: ->
      App.navigate 'boards/' + this.ui.boardSelector.val(),
        trigger: true
      return


  Layout.Board = Backbone.Marionette.ItemView.extend
    template: tytoTmpl.board
    ui:
      addColumn: '#add-column'
    events:
      'click @ui.addColumn': 'addColumn'
    addColumn: ->
      console.log 'adding column', new Date()
      this.model.get('columns').add()
      this.model.save()
      return
