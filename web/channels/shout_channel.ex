defmodule Shout.ShoutChannel do
  use Phoenix.Channel

  def join("topic:general", _, socket) do
    IO.puts "joined"
    {:ok, socket}
  end

  def handle_in("new:msg", message, socket) do
    broadcast! socket, "bc:msg", message
    {:noreply, socket}
  end

  def handle_out("bc:msg", %{"body" => body}, socket) do
    body = body <> "!!!!"
    push socket, "bc:msg", %{"body" => body}
    {:noreply, socket}
  end
end
