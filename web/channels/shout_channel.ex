defmodule Shout.ShoutChannel do
  use Phoenix.Channel

  def join("topic:general", _, socket) do
    IO.puts "joined"
    {:ok, socket}
  end
end
