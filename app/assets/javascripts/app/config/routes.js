myapp.config(function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise("/");
    return $stateProvider.state("default", {
        abstract: true,
        views: {
            "": {
                controller: "ApplicationController",
                templateUrl: "/assets/layouts/default.html.erb"
            }
        }
    }).state("new", {
            parent: "tasks",
            url: "/new",
            views: {
                "@default": {
                    controller: "MicropostsController",
                    templateUrl: "/assets/tasks/new.html.erb"
                }
            }
        }) ;
});
