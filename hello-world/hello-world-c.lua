RegisterCommand('hello-world', function(source, args)
    TriggerEvent('chat:addMessage', {
        args = { 'Me', 'Hello World!' }
    })
end, false)