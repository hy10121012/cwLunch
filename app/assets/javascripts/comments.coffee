window.client = new Faye.Client('/faye')

client.addExtension {
  outgoing: (message, callback) ->
    message.ext = message.ext || {}
    message.ext.csrfToken = $('meta[name=csrf-token]').attr('content')
    callback(message)
}

jQuery ->
  d = $('#dialog');
  d.scrollTop(d.prop("scrollHeight"));

  $('#new_comment').submit ->
    $(this).find("input[type='submit']").val('Sending...').prop('disabled', true)

  try
    client.unsubscribe '/comments'
  catch
    console?.log "Can't unsubscribe."

  client.subscribe '/comments', (payload) ->
    if payload.message
      $('#comments').find('.media-list').append(payload.message)
      d = $('#dialog');
      d.scrollTop(d.prop("scrollHeight"));
