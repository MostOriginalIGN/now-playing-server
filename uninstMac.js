var Service = require('node-mac').Service;

// Create a new service object
var svc = new Service({
  name:'now-playing-server',
  description: 'Now Playing server for Minimalistic Desktop',
  script: require('path').join(__dirname,'nowplaying.js')
});

// Listen for the "uninstall" event so we know when it's done.
svc.on('uninstall',function(){
  console.log('Uninstall complete.');
  console.log('The service exists: ',svc.exists);
});

// Uninstall the service.
svc.uninstall();