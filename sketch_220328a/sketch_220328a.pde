import processing.net.*;

int port = 10002;   
Server server;    

void setup()
{
  size(500, 500);
  background(0);
  strokeWeight(10);
  stroke(255);
  surface.setResizable(true);
  server = new Server(this, port); // Starts a server on port 10002
}

void draw() {
  Client client = server.available();
  if (client == null)
    return;
    
  print("Server got:  ");
  String dataIn = new String(client.readBytesUntil((int)'}'));
  JSONObject json = parseJSONObject(dataIn);
  println(dataIn);
  if (json == null)
  {
    return;
  } 
  
  switch (json.getString("type"))
  {
    case "init":
      surface.setSize(json.getInt("width"), json.getInt("height"));
      break;
    case "line":
       line(json.getInt("x0"),json.getInt("y0"),json.getInt("x1"),json.getInt("y1"));
    break;
    case "color":
      stroke(json.getInt("r"),json.getInt("g"),json.getInt("b"));
      fill(json.getInt("r"),json.getInt("g"),json.getInt("b")); 
    break;
    case "clear":
      background(0);
    break;
    case "fillRect":
      rect(json.getInt("x"),json.getInt("y"),json.getInt("w"),json.getInt("h"));
    break;
  }
}

// ServerEvent message is generated when a new client connects 
// to an existing server.
void serverEvent(Server someServer, Client someClient) {
  println("We have a new client: " + someClient.ip());
}
