import {Socket} from "phoenix"

let socket = new Socket("/ws")
socket.connect()

let chan = socket.chan("topic:general", {})
chan.join().receive("ok", chan => {
    console.log("joined")
})
