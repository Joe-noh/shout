import {Socket} from "phoenix"

let input  = $("input#word")
let button = $("button#send")
let log    = $("ul#log")

let socket = new Socket("/ws")
socket.connect()

let chan = socket.chan("topic:general", {})

button.on("click", e => {
  chan.push("new:msg", {body: input.val()})
  input.val("")
})

chan.on("bc:msg", payload => {
  let row = $('<li />').text(payload.body);
  log.append(row)
})

chan.join().receive("ok", chan => {
  console.log("joined")
})
