var http = require('http')
var url = require('url')

// Overload console.log to write to file and stdout.
var fs = require('fs');
var util = require('util');
var log_file = fs.createWriteStream(
  '/mnt/web/app.log',
  {flags : 'w'}
);
var log_stdout = process.stdout;
console.log = function(d) { //
  m = (new Date).toISOString() + ' ' + util.format(d) + '\n'
  log_file.write(m);
  log_stdout.write(m);
};

http.createServer(onRequest).listen(8888);
console.log('Server has started');

function onRequest(req, response){
  const baseURL =  req.protocol + '://' + req.headers.host + '/';
  const reqUrl = new URL(req.url, baseURL);
  const pathName = reqUrl.pathname
  console.log('path="' + pathName + '"');
  response.writeHead(200);
  response.write("The time is " + (new Date) + ".\n")
  response.write("You have requested '" + pathName + "'.\n");
  response.end();
}
