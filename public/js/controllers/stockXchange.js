stockXchange
  .controller('nseStocks', function($scope, NSEStock,Auth) {
    $scope.stocks = [];
    $scope.type = ".NS"
    NSEStock.listPromise.then(function(newList) {
      $scope.stocks = newList;
    });
    $scope.$on('updatednseStock', function(ev, newListPromise) {
      newListPromise.then(function(newList) {
        $scope.stocks = newList;
      }, function(error) {
          // Ignored.
      });
    });
    var credentials = {
        email: 'user@name.com',
        password: 'password'
    };
    var config = {
        headers: {
            'X-HTTP-Method-Override': 'POST'
        }
    };

    Auth.login(credentials, config).then(function(user) {
        console.log(user); // => {id: 1, ect: '...'}
    }, function(error) {
        // Authentication failed...
    });
  })
  .controller('nasdaqStocks', function($scope, NASDAQStock) {
    $scope.stocks = [];
    $scope.type = ""
    NASDAQStock.listPromise.then(function(newList) {
      $scope.stocks = newList;
    });
    $scope.$on('updatednasdaqStock', function(ev, newListPromise) {
      newListPromise.then(function(newList) {
        $scope.stocks = newList;
      }, function(error) {
          // Ignored.
      });
    });
  })
  .controller('buyStocks', function($scope, $http){
    // $scope will allow this to pass between controller and view
    $scope.formData = {};
    // process the form
    $scope.processForm = function() {
      $http.post({
            url     : 'process.php',
            data    : $.param($scope.formData),  // pass in data as strings
            headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
        })
            .success(function(data) {
                console.log(data);
                if (!data.success) {
                  // if not successful, bind errors to error variables
                    $scope.errorName = data.errors.name;
                    $scope.errorSuperhero = data.errors.superheroAlias;
                } else {
                  // if successful, bind success message to message
                    $scope.message = data.message;
                                      $scope.errorName = '';
                    $scope.errorSuperhero = '';
                }
            });
    };
  })
