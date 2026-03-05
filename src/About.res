// About page

@react.component
let make = () => {
  <div className="about-page">
    <header className="toolbar">
      <div className="toolbar-left">
        <img src="/logo-icon.svg" alt="Free Math Sheets" className="toolbar-icon" />
        <a
          href="/"
          className="toolbar-title"
          onClick={e => {
            ReactEvent.Mouse.preventDefault(e)
            RescriptReactRouter.push("/")
          }}>
          {React.string("Free Math Sheets")}
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
      </div>
      <div className="toolbar-center" />
      <div className="toolbar-right" />
    </header>

    <main className="about-content">
      <div className="about-card">
        <h1 className="about-heading"> {React.string("About Free Math Sheets")} </h1>

        <p className="about-text">
          {React.string("Free Math Sheets is a free, open-source math worksheet generator for students in Kindergarten through 5th grade (more in the future). It is released under the ")}
          <a href="https://www.gnu.org/licenses/agpl-3.0.txt">{React.string("AGPL-3.0 license")}</a>
          {React.string(". It creates printable PDF worksheets with randomized problems and answer keys, covering skills aligned with Common Core standards.")}
        </p>

        <p className="about-text">
          {React.string("Teachers, parents and students can customize worksheets by grade level, skill category, and difficulty. Every worksheet is generated instantly in the browser. No account is required. No data collection is performed. There is no backend server.")}
        </p>

        <h2 className="about-subheading"> {React.string("Numerikos")} </h2>
        <p className="about-text">
          {React.string("Free Math Sheets is built by ")}
          <a href="https://www.numerikos.com" className="about-link">
            {React.string("Numerikos")}
          </a>
          {React.string(", a project dedicated to math practice and mastery.")}
        </p>

        <h2 className="about-subheading"> {React.string("Open Source")} </h2>
        <p className="about-text">
          {React.string("This project is open source. Contributions, bug reports, and feature requests are welcome.")}
        </p>
        <ul className="about-links">
          <li>
            <a href="https://github.com/sophikos/free-math-sheets" className="about-link">
              {React.string("Project Repository")}
            </a>
            {React.string(": source code on GitHub")}
          </li>
          <li>
            <a href="https://github.com/mchaver" className="about-link">
              {React.string("mchaver")}
            </a>
            {React.string(": The project maintainer on GitHub")}
          </li>
        </ul>

        <h2 className="about-subheading"> {React.string("Technology")} </h2>
        <p className="about-text">
          {React.string("Built with ")}
          <a href="https://rescript-lang.org/">{React.string("ReScript")}</a>
          {React.string(", ")}
          <a href="https://react.dev/">{React.string("React")}</a>
          {React.string(", and ")}
          <a href="https://artskydj.github.io/jsPDF/docs/jsPDF.html">{React.string("jsPDF")}</a>
          {React.string(". Worksheets are generated directly in your browser. No data is collected.")}
        </p>
      </div>
    </main>

    <Footer currentPage={Footer.About} />
  </div>
}
