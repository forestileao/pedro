Code.require_file("./lib/pedro/support/example_router.ex")
Code.require_file("./lib/pedro/support/example_controller.ex")

opts = [plug: Pedro.ExampleRouter, port: 4040, options: []]
%{start: {mod, fun, args}} = Plug.Pedro.HttpServer.child_spec(opts)
apply(mod, fun, args)
