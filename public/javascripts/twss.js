$(function(){

  window.Twss = Backbone.Model.extend({
    url: function() {
      return this.id ? '/twss/' + this.id : '/twss';
    },

    defaults: { twss: {
      query: "",
      result: ""
    }},

    initialize: function(){

    }
  });

  window.TwssCollection = Backbone.Collection.extend({
    model: Twss,
    url: '/twss'
  });

  window.Twsses = new TwssCollection;

  window.TwssView = Backbone.View.extend({

    render: function(){
      var twss = this.model.toJSON();
      $(this.el).html(ich.twss_template(twss));
      return this;
    }
  });

  window.AppView = Backbone.View.extend({

    el: $("#twss_app"),

    events: {
      "submit form#twss_form": "createTwss"
    },

    initialize: function() {
      _.bindAll(this, "createTwss");

      Twsses.bind('add', this.addOne);
    },

    addOne: function(twss){
      var view = new TwssView({model: twss});
      $("#result").html(view.render().el);
    },

    newAttributes: function(event) {
      var new_twss_form = $(event.currentTarget).serializeObject();
      return { twss:{
        query: new_twss_form["twss[query]"]
      }}
    },

    createTwss: function(e){
      e.preventDefault();
      var params = this.newAttributes(e);
      Twsses.create(params);
    }
  });

  window.App = new AppView;
});

