defmodule TwoFerTest do
  use ExUnit.Case

  test "no name given" do
    assert TwoFer.two_fer() == "One for you, one for me."
  end

  @tag task_id: 1
  test "a name given" do
    assert TwoFer.two_fer("Alice") == "One for Alice, one for me."
  end

  @tag task_id: 2
  test "another name given" do
    assert TwoFer.two_fer("Bob") == "One for Bob, one for me."
  end

  @tag task_id: 3
  test "when the argument is a number" do
    assert_raise FunctionClauseError, fn ->
      TwoFer.two_fer(10)
    end
  end

  @tag task_id: 4
  test "when the argument is an atom" do
    assert_raise FunctionClauseError, fn ->
      TwoFer.two_fer(:bob)
    end
  end

  @tag task_id: 5
  test "when the argument is a charlist" do
    assert_raise FunctionClauseError, fn ->
      refute TwoFer.two_fer(~c"Jon Snow")
    end
  end
end
