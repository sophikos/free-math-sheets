// Worksheet Generator App

type worksheetState = {
  skillConfig: option<Problem.skillConfig>,
  problemCount: int,
  title: string,
  showNameDate: bool,
}

type mobileView = Edit | Preview

@react.component
let make = () => {
  let (state, setState) = React.useState(() => {
    skillConfig: None,
    problemCount: 10,
    title: "Math Practice",
    showNameDate: true,
  })
  let (worksheet, setWorksheet) = React.useState(() => None)
  let (mobileView, setMobileView) = React.useState(() => Edit)

  let handleSkillConfigChange = (config: Problem.skillConfig) => {
    setState(prev => {...prev, skillConfig: Some(config)})
  }

  let handleSkillConfigClear = () => {
    setState(prev => {...prev, skillConfig: None})
  }

  let handleCountChange = (count: int) => {
    setState(prev => {...prev, problemCount: count})
  }

  let handleTitleChange = (newTitle: string) => {
    setState(prev => {...prev, title: newTitle})
  }

  let handleGenerate = () => {
    switch state.skillConfig {
    | Some(config) => {
        let problems = Array.make(~length=state.problemCount, ())->Array.map(_ => {
          Problem.generate(config)
        })
        let title = if state.title->String.trim == "" {
          Problem.skillConfigToString(config)
        } else {
          state.title
        }
        setWorksheet(_ => Some({
          WorksheetPreview.problems: problems,
          title: title,
          showNameDate: state.showNameDate,
        }))
        // Auto-switch to Preview on mobile after generating
        setMobileView(_ => Preview)
      }
    | None => ()
    }
  }

  let worksheetTitle = if state.title->String.trim == "" {
    "Untitled Worksheet"
  } else {
    state.title
  }

  let isConfigComplete = switch state.skillConfig {
  | Some(_) => true
  | None => false
  }

  <div className="app">
    // Toolbar
    <header className="toolbar">
      <div className="toolbar-left">
        <span className="toolbar-title">
          {React.string("Free Math Sheets")}
        </span>
        <span className="toolbar-by">
          {React.string("by")}
        </span>
        <a href="https://www.numerikos.com" className="toolbar-logo-link">
          <img src="/numerikos-logo.png" alt="Numerikos" className="toolbar-logo-img" />
          <span className="toolbar-logo-text">
            {React.string("Numerikos")}
          </span>
        </a>
        <div className="toolbar-divider" />
        <span className="toolbar-document-title">
          {React.string(worksheetTitle)}
        </span>
      </div>

      <div className="toolbar-center" />

      <div className="toolbar-right">
        {switch worksheet {
        | Some(ws) =>
          <>
            <button
              className="toolbar-btn toolbar-btn-secondary"
              onClick={_ => {
                PdfGenerator.previewWorksheet(
                  {PdfGenerator.problems: ws.problems, title: ws.title, showNameDate: ws.showNameDate},
                )
              }}>
              {React.string("Worksheet PDF")}
            </button>
            <button
              className="toolbar-btn toolbar-btn-secondary"
              onClick={_ => {
                PdfGenerator.previewAnswerKey(
                  {PdfGenerator.problems: ws.problems, title: ws.title, showNameDate: ws.showNameDate},
                )
              }}>
              {React.string("Answer Key PDF")}
            </button>
          </>
        | None => React.null
        }}
      </div>
    </header>

    // Mobile tab bar
    <div className="mobile-tabs">
      <button
        className={`mobile-tab ${mobileView == Edit ? "active" : ""}`}
        onClick={_ => setMobileView(_ => Edit)}>
        {React.string("Edit")}
      </button>
      <button
        className={`mobile-tab ${mobileView == Preview ? "active" : ""}`}
        onClick={_ => setMobileView(_ => Preview)}>
        {React.string("Preview")}
      </button>
    </div>

    // Main content - split pane
    <main className="main-content">
      // Sidebar - Configuration
      <aside className={`sidebar ${mobileView == Edit ? "" : "mobile-hidden"}`}>
        <div className="sidebar-header">
          <span className="sidebar-header-title">
            {React.string("Worksheet Editor")}
          </span>
        </div>

        <div className="sidebar-content">
          <div className="form-group">
            <label className="form-label">
              {React.string("Worksheet Title")}
            </label>
            <input
              type_="text"
              className="form-input"
              value={state.title}
              onChange={e => {
                let value = ReactEvent.Form.target(e)["value"]
                handleTitleChange(value)
              }}
              placeholder="Enter worksheet title"
            />
          </div>

          <div className="form-group form-group-checkbox">
            <label className="form-checkbox-label">
              <input
                type_="checkbox"
                className="form-checkbox"
                checked={state.showNameDate}
                onChange={_ => {
                  setState(prev => {...prev, showNameDate: !prev.showNameDate})
                }}
              />
              {React.string("Include Name/Date fields")}
            </label>
          </div>

          <SkillSelector
            onConfigChange={handleSkillConfigChange}
            onConfigClear={handleSkillConfigClear}
            currentConfig={state.skillConfig}
          />

          <div className="form-group">
            <label className="form-label">
              {React.string("Number of Problems")}
            </label>
            <select
              className="form-select"
              value={Int.toString(state.problemCount)}
              onChange={e => {
                let value = ReactEvent.Form.target(e)["value"]
                switch Int.fromString(value) {
                | Some(n) => handleCountChange(n)
                | None => ()
                }
              }}>
              <option value="5"> {React.string("5 problems")} </option>
              <option value="10"> {React.string("10 problems")} </option>
              <option value="15"> {React.string("15 problems")} </option>
              <option value="20"> {React.string("20 problems")} </option>
              <option value="25"> {React.string("25 problems")} </option>
              <option value="30"> {React.string("30 problems")} </option>
            </select>
          </div>

          <button
            className="sidebar-generate-btn"
            onClick={_ => handleGenerate()}
            disabled={!isConfigComplete}>
            {React.string("Generate Worksheet")}
          </button>
        </div>
      </aside>

      // Resize handle (visual only for now)
      <div className="resize-handle" />

      // Preview panel
      <section className={`preview-panel ${mobileView == Preview ? "" : "mobile-hidden"}`}>
        // Mobile-only PDF action buttons
        {switch worksheet {
        | Some(ws) =>
          <div className="mobile-preview-actions">
            <button
              className="mobile-preview-btn"
              onClick={_ => {
                PdfGenerator.previewWorksheet(
                  {PdfGenerator.problems: ws.problems, title: ws.title, showNameDate: ws.showNameDate},
                )
              }}>
              {React.string("Worksheet PDF")}
            </button>
            <button
              className="mobile-preview-btn"
              onClick={_ => {
                PdfGenerator.previewAnswerKey(
                  {PdfGenerator.problems: ws.problems, title: ws.title, showNameDate: ws.showNameDate},
                )
              }}>
              {React.string("Answer Key PDF")}
            </button>
          </div>
        | None => React.null
        }}
        <WorksheetPreview worksheet={worksheet} />
      </section>
    </main>

    // Footer
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
    </footer>
  </div>
}
