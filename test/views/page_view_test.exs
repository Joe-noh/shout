defmodule Shout.PageViewTest do
  use Shout.ConnCase, async: true

  import Phoenix.View

  test "render index page" do
    rendered = render_to_string(Shout.PageView, "index.html", [])

    # 適当。ちゃんとやるならFloki使おう
    assert rendered =~ "word"
    assert rendered =~ "send"
    assert rendered =~ "log"
  end
end
