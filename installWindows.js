var Service = require('node-windows').Service;

// Create a new service object
var svc = new Service({
  name:'now-playing-server',
  description: 'Now Playing server for Minimalistic Desktop',
  script: './nowplaying.js'
});

svc.on('install',function(){
  svc.start();
});

svc.install();