// Worksheet Preview Component - Displays actual PDF in iframe

type worksheet = {
  problems: array<Problem.problem>,
  title: string,
  showNameDate: bool,
}

// Binding for URL.revokeObjectURL
@val @scope("URL")
external revokeObjectURL: string => unit = "revokeObjectURL"

@react.component
let make = (~worksheet: option<worksheet>) => {
  let (pdfUrl, setPdfUrl) = React.useState(() => None)

  // Generate PDF blob URL when worksheet changes
  React.useEffect1(() => {
    switch worksheet {
    | Some(ws) => {
        // Revoke old URL if exists
        switch pdfUrl {
        | Some(oldUrl) => revokeObjectURL(oldUrl)
        | None => ()
        }
        // Generate new PDF blob URL
        let url = PdfGenerator.getWorksheetBlobUrl({
          PdfGenerator.problems: ws.problems,
          title: ws.title,
          showNameDate: ws.showNameDate,
        })
        setPdfUrl(_ => url)
      }
    | None => {
        switch pdfUrl {
        | Some(oldUrl) => revokeObjectURL(oldUrl)
        | None => ()
        }
        setPdfUrl(_ => None)
      }
    }
    None
  }, [worksheet])

  // Cleanup on unmount
  React.useEffect0(() => {
    Some(() => {
      switch pdfUrl {
      | Some(url) => revokeObjectURL(url)
      | None => ()
      }
    })
  })

  <div className="preview-content">
    {switch pdfUrl {
    | None =>
      <div className="preview-empty">
        <div className="preview-empty-icon">
          {React.string("📄")}
        </div>
        <div className="preview-empty-text">
          {React.string("No worksheet generated yet")}
        </div>
        <div className="preview-empty-hint">
          {React.string("Select a math skill and click Generate to create your worksheet")}
        </div>
      </div>

    | Some(url) =>
      <iframe
        className="pdf-preview-iframe"
        src={url}
      />
    }}
  </div>
}
