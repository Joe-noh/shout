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
end
