#App.room =App.cable.subscriptions.create { channel: "RoomChannel", room: "Best Room" }, # send message in ONE channel
App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']
    id = $('#room_id').val()
    inc_msg_counter(id)

  speak: (message, room_id) ->
    @perform 'speak', message: message, room_id: room_id

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13
    id = $('#room_id').val()
    App.room.speak event.target.value, id
    event.target.value = ''
    event.preventDefault()

inc_msg_counter = (id) ->
  msg_count_selector = '#room_'+id+'_msg_count';
  msg_count = $(msg_count_selector).text();
  old_val = parseInt(msg_count);
  new_val = old_val + 1;
  $(msg_count_selector).text(new_val);