angular
    .module('stockXchange', [
        'ngAnimate',
	'ngRoute',
        'ui.router',
        'templates'
    ])
    .config(function ($routeProvider,$locationProvider) {
    	$routeProvider
    .when('/', {
      templateUrl: 'home.html',
      controller: 'IndexCtrl'
    });

  
$locationProvider.html5Mode(true);
    });





