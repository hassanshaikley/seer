# Seer

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `seer` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:seer, "~> 0.1.0"}
  ]
end
```

Add Seer to your dependencies above the Router

```elixir
  plug Seer
  plug SeerTestWeb.Router
```

This automatically puts routes into conn.assigns.seer.paths in the order of Jaro Distance.

Then you can do something like take the top 5 and display them to a user whenever a 404 happens.
