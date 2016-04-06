stockXchange
    .config(function ($stateProvider, $urlRouterProvider, AuthProvider){
        $urlRouterProvider.otherwise("/home");
        // AuthProvider.loginPath('/users/sign_in.json');
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
