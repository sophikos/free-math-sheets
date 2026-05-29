// Worksheet Generator App

type worksheetState = {
  selection: UrlState.selection,
  problemCount: int,
  title: string,
  showNameDate: bool,
}

type mobileView = Edit | Preview

@react.component
let make = () => {
  // Restore selections from the URL query string on first load.
  let (initialUrlState, _) = React.useState(() =>
    UrlState.decode(RescriptReactRouter.dangerouslyGetInitialUrl().search)
  )

  let (state, setState) = React.useState(() => {
    selection: initialUrlState.selection,
    problemCount: initialUrlState.problemCount->Option.getOr(UrlState.defaultProblemCount),
    title: initialUrlState.title->Option.getOr(UrlState.defaultTitle),
    showNameDate: initialUrlState.showNameDate->Option.getOr(UrlState.defaultShowNameDate),
  })
  let (worksheet, setWorksheet) = React.useState(() => None)
  let (mobileView, setMobileView) = React.useState(() => Edit)

  // The generate-ready config derived from the current selection, if complete.
  let skillConfig =
    UrlState.selectionToRecord(state.selection)->Option.filter(UrlState.isComplete)

  // Keep the URL in sync with the current selections so it can be bookmarked.
  React.useEffect4(() => {
    let query = UrlState.encode(
      ~selection=state.selection,
      ~problemCount=state.problemCount,
      ~title=state.title,
      ~showNameDate=state.showNameDate,
    )
    RescriptReactRouter.replace(query == "" ? "/" : "/?" ++ query)
    None
  }, (state.selection, state.problemCount, state.title, state.showNameDate))

  let handleSelectionChange = (selection: UrlState.selection) => {
    setState(prev => {...prev, selection})
  }

  let handleCountChange = (count: int) => {
    setState(prev => {...prev, problemCount: count})
  }

  let handleTitleChange = (newTitle: string) => {
    setState(prev => {...prev, title: newTitle})
  }

  let handleGenerate = () => {
    switch skillConfig {
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

  let isConfigComplete = switch skillConfig {
  | Some(_) => true
  | None => false
  }

  <div className="app">
    <Header
      leftExtra={
        <>
          <div className="toolbar-divider" />
          <span className="toolbar-document-title">
            {React.string(worksheetTitle)}
          </span>
        </>
      }
      rightExtra={
        switch worksheet {
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
        }
      }
    />

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
            initialSelection={initialUrlState.selection}
            onSelectionChange={handleSelectionChange}
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

    <Footer currentPage={Footer.Home} />
  </div>
}
