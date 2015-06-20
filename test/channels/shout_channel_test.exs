defmodule ShoutChanneltest do
  use Shout.ChannelCase
  alias Shout.ShoutChannel

  test "whole" do
    {:ok, _, socket} = subscribe_and_join(ShoutChannel, "topic:general", %{})

    push socket, "new:msg", %{"body" => "hello"}
    assert_broadcast "bc:msg", %{"body" => "hello"}
  end
end
