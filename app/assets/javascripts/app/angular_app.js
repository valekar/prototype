<!-- app/assets/javascripts/angular_app.js -->
var myapp = angular.module('myapp', ['ui.router'])
    .config(["$httpProvider", function(provider) {
        provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    }])

//debugger
myapp.run(function($rootScope, $state, $stateParams){
    // You can turn this off on production.
    $rootScope.$debugMode = "on" // "off"

    // Capture current state and stateParams, this variable can be showed
  // in browser for debug purpose.
    $rootScope.$state = $state
    $rootScope.$stateParams = $stateParams

});


//this is for removing # from the URL
myapp.config(function($locationProvider){
$locationProvider.html5Mode=true
});

//to handle UTF-8 requests
myapp.config(function($httpProvider){
    $httpProvider.defaults.transformRequest.push(function(data, headersGetter){
        utf8_data = data
        if(!angular.isUndefined(data)){
            d = angular.fromJson(data);
            d["_utf8"] = "☃";
            utf8_data = angular.toJson(d) ;
         }
      return utf8_data;
    });
});

