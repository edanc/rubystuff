require 'socket'               # Get sockets from stdlib

server = TCPServer.open(3000)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  client.puts(Time.now.ctime)  # Send the time to the client
  client.puts "is it your birthday?"
  answer = client.recv_nonblock(20)
  puts answer
  client.close                 # Disconnect from the client
}
