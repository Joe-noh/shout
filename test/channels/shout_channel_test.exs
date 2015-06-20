defmodule ShoutChanneltest do
  use Shout.ChannelCase
  alias Shout.ShoutChannel

  test "join" do
    {:ok, _, _socket} = subscribe_and_join(ShoutChannel, "topic:general", %{})
  end
end
