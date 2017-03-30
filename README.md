in rooms_controller => protect_from_forgery except: :create<br>
$ curl -XPOST 'http://localhost:3000/rooms?id=2&content=aabbcc' # send message to room
