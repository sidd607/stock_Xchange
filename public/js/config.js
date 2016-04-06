stockXchange
    .config(function ($stateProvider, $urlRouterProvider, AuthProvider){
        $urlRouterProvider.otherwise("/home");
<<<<<<< HEAD
        AuthProvider.loginPath('/users/sign_in.json');
        // $httpProvider.interceptors.unshift('csrfInterceptor');
=======
        // AuthProvider.loginPath('/users/sign_in.json');
>>>>>>> d053abac2cd4fc6c6d82e3ada0a7360e82a22b9c
        // AuthProvider.loginMethod('GET');
        // AuthProvider.resourceName('user');
        $stateProvider

            //------------------------------
            // HOME
            //------------------------------

            .state ('home', {
                url: '/home',
                templateUrl: 'views/home.html',
                resolve: {
                    loadPlugin: function($ocLazyLoad) {
                        return $ocLazyLoad.load ([
                            {
                                name: 'css',
                                insertBefore: '#app-level',
                                files: [
                                    'vendors/bower_components/fullcalendar/dist/fullcalendar.min.css',
                                ]
                            },
                            {
                                name: 'vendors',
                                insertBefore: '#app-level-js',
                                files: [
                                    'vendors/sparklines/jquery.sparkline.min.js',
                                    'vendors/bower_components/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js',
                                    'vendors/bower_components/simpleWeather/jquery.simpleWeather.min.js'
                                ]
                            }
                        ])
                    }
                }
            })

<<<<<<< HEAD
            .state('login', {
                url: '/login',
                templateUrl: 'views/login.html',
                controller: 'loginCtrl'
            })

=======
>>>>>>> d053abac2cd4fc6c6d82e3ada0a7360e82a22b9c
            .state ('stocks', {
                url: '/stocks',
                templateUrl: 'views/common.html'
            })
            .state ('stocks.nse', {
                url: '/nse',
                templateUrl: 'views/stocks.html',
                controller: 'nseStocks'
            })
            .state ('stocks.nasdaq', {
                url: '/nasdaq',
                templateUrl: 'views/stocks.html',
                controller: 'nasdaqStocks'
            })

    });
