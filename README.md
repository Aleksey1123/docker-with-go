# Hot-reload docker app with Go and [Air](https://github.com/air-verse/air)

If you are having trouble with setting up your air with docker for windows - you are in the right place! 

## Windows .air.toml

```
[build]
  cmd = "go build -o app-bin ."
  bin = "app-bin"
  dir = "."
  include_ext = ["go"]
  exclude_dir = ["vendor"]
  run_after_build = "chmod +x app-bin"

  // this row is essential for windows
  poll = true

[log]
  level = "debug"
```

You are good to go!