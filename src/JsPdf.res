// ReScript bindings for jsPDF

type t

type orientation = [#portrait | #landscape]
type unit_ = [#mm | #\"in" | #px | #pt]
type format = [#a4 | #letter]

type options = {
  orientation?: orientation,
  unit?: unit_,
  format?: format,
}

type textOptions = {
  align?: [#left | #center | #right],
}

// Use wrapper to create PDF
@module("/src/jspdfWrapper.js")
external make: options => t = "createPdf"

@module("/src/jspdfWrapper.js")
external save: (t, string) => unit = "savePdf"

@module("/src/jspdfWrapper.js")
external preview: (t, string) => unit = "previewPdf"

@module("/src/jspdfWrapper.js")
external getBlobUrl: t => Nullable.t<string> = "getBlobUrl"

@send external text: (t, string, float, float) => t = "text"
@send external textWithOptions: (t, string, float, float, textOptions) => t = "text"
@send external setFontSize: (t, int) => t = "setFontSize"
@send external setFont: (t, string, string) => t = "setFont"
@send external addPage: t => t = "addPage"
@send external line: (t, float, float, float, float) => t = "line"
@send external setDrawColor: (t, int, int, int) => t = "setDrawColor"
@send external setLineWidth: (t, float) => t = "setLineWidth"
@send external splitTextToSize: (t, string, float) => array<string> = "splitTextToSize"
@send external addImage: (t, string, string, float, float, float, float) => t = "addImage"
@send external setPage: (t, int) => t = "setPage"
@send external getNumberOfPages: t => int = "getNumberOfPages"

// Link support
type linkOptions = {url: string}
@send external link: (t, float, float, float, float, linkOptions) => t = "link"

// Document properties/metadata
type documentProperties = {
  title?: string,
  subject?: string,
  author?: string,
  keywords?: string,
  creator?: string,
}
@send external setDocumentProperties: (t, documentProperties) => t = "setDocumentProperties"

// Internal object access
type internal
type pageSize

@get external internal: t => internal = "internal"
@get external pageSizeObj: internal => pageSize = "pageSize"
@send external getWidth: pageSize => float = "getWidth"
@send external getHeight: pageSize => float = "getHeight"

let getPageSize = (pdf: t): (float, float) => {
  let ps = pdf->internal->pageSizeObj
  (ps->getWidth, ps->getHeight)
}
