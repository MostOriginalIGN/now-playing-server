// Importing the required modules
const WebSocketServer = require('ws');
const http = require('http');
const cors = require('cors');

const obj = {}
// Creating a new websocket server
const wss = new WebSocketServer.Server({ port: 8974 })

function splitKeyValue(str) {
        const parts = str.split(/(?<!s):/);
        const key = parts[0];  // the key is the first part
        const value = parts[1];  // the value is the second part
        if (parts[2] != null) {
                const mins = parts[2];
                return [key, `${value}:${mins}`];
        }
        return [key, value];
}


// Creating connection using websocket
wss.on("connection", ws => {
        console.log("new client connected");
        // sending message
        ws.on("message", data => {
                console.log(splitKeyValue(data.toString()))
                const [key, value] = splitKeyValue(data.toString());  // destructure the tuple into separate variables
                obj[key] = value;  // add the key and value to the object
        });
        // handling what to do when clients disconnects from server
        ws.on("close", () => {
                console.log("the client has connected");
        });
        // handling client connection error
        ws.onerror = function () {
                console.log("Some Error occurred")
        }
});
const server = http.createServer((req, res) => {
        cors()(req, res, () => {
                res.writeHead(200, { 'Content-Type': 'application/json' });
                res.end(JSON.stringify(obj));
        });
});

console.log("The WebSocket server is running on port 8974");

server.listen(8975, () => {
        console.log('Server listening on port 8975');
});
