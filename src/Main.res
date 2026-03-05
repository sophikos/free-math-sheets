// Worksheet Generator Entry Point

module Router = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()
    switch url.path {
    | list{"about"} => <About />
    | _ => <App />
    }
  }
}

switch ReactDOM.querySelector("#root") {
| Some(rootElement) => {
    let root = ReactDOM.Client.createRoot(rootElement)
    ReactDOM.Client.Root.render(root, <Router />)
  }
| None => Console.error("Root element not found")
}
