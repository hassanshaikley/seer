# Seer

Show the closest endpoints to what the user is entering by the Jaro Distance.

For instance if you have have `api/v1/route` and the user enters `api/v2/route` it will put `[`api/v1/route`, other routes]` inside of `conn.assigns.seer.paths`.

Note: It returns all the routes in order of similarity. If you want to limit it to only the first or first few you have to manually limit the results you want to return.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `seer` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:seer, "~> 0.1.1"}
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
