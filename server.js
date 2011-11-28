require('coffee-script');
var fs = require('fs');

fs.readdir('./src/controllers', function(err, controllers) {
  controllers.forEach(function(controller) {
    var i = controller.indexOf(".coffee");
    require('./src/controllers/' + controller.substr(0, i));
  });
});
