$ ->
  window.Twss = Backbone.Model.extend
    url: -> 
      if @id? 
        '/twss/' + @id 
      else 
        '/twss'
    
    defaults: 
      twss: 
        query: ""
        result: ""

    initialize: ->

  window.TwssCollection = Backbone.Collection.extend
    model: Twss
    url: '/twss'

  window.Twsses = new TwssCollection;

  window.TwssView = Backbone.View.extend
    render: ->
      twss = @model.toJSON()
      console.log @model
      $(@el).html(ich.twss_template(twss))
      @
    
  window.AppView = Backbone.View.extend

    el: $("#twss_app")

    events: 
      "submit form#twss_form": "createTwss"

    initialize: ->
      _.bindAll(@, "createTwss")
      Twsses.bind('add', @addOne)
      return

    addOne: (twss) ->
      view = new TwssView model: twss
      $("#result").html(view.render().el)
      return

    newAttributes: (event) ->
      new_twss_form = $(event.currentTarget).serializeObject()
      twss:
        query: new_twss_form["twss[query]"]

    createTwss: (e) ->
      e.preventDefault()
      params = @newAttributes e
      Twsses.create params
      return

  window.App = new AppView
