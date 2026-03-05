// Shared footer component

type page = Home | About

@react.component
let make = (~currentPage: page) => {
  let aboutClass = switch currentPage {
  | About => "footer-about-link footer-about-link-active"
  | Home => "footer-about-link"
  }

  <footer className="footer">
    <a href="https://www.numerikos.com" className="footer-promo">
      <img src="/numerikos-logo.png" alt="Numerikos" className="footer-logo" />
      <span className="footer-promo-text">
        {React.string("Numerikos")}
      </span>
      <span className="footer-promo-tagline">
        {React.string("- Math Mastery")}
      </span>
    </a>
    <a
      href="/about"
      className={aboutClass}
      onClick={e => {
        ReactEvent.Mouse.preventDefault(e)
        RescriptReactRouter.push("/about")
      }}>
      {React.string("About")}
    </a>
  </footer>
}
