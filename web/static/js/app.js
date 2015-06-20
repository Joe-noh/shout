import {Socket} from "phoenix"

let input  = $("input#word")
let button = $("button#send")

let socket = new Socket("/ws")
socket.connect()

let chan = socket.chan("topic:general", {})

button.on("click", e => {
  chan.push("new:msg", {body: input.val()})
  input.val("")
})

chan.join().receive("ok", chan => {
    console.log("joined")
})
