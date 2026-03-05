// Shared header/toolbar component

@react.component
let make = (~leftExtra: React.element=React.null, ~rightExtra: React.element=React.null) => {
  <header className="toolbar">
    <div className="toolbar-left">
      <a
        href="/"
        className="toolbar-home-link"
        onClick={e => {
          ReactEvent.Mouse.preventDefault(e)
          RescriptReactRouter.push("/")
        }}>
        <img src="/logo-icon.svg" alt="Free Math Sheets" className="toolbar-icon" />
        <span className="toolbar-title">
          {React.string("Free Math Sheets")}
        </span>
      </a>
      <span className="toolbar-by">
        {React.string("by")}
      </span>
      <a href="https://www.numerikos.com" className="toolbar-logo-link">
        <img src="/numerikos-logo.png" alt="Numerikos" className="toolbar-logo-img" />
        <span className="toolbar-logo-text">
          {React.string("Numerikos")}
        </span>
      </a>
      {leftExtra}
    </div>
    <div className="toolbar-center" />
    <div className="toolbar-right">
      {rightExtra}
    </div>
  </header>
}
