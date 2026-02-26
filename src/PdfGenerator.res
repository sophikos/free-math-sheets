// PDF Generator for Math Worksheets - LaTeX-inspired style

type worksheet = {
  problems: array<Problem.problem>,
  title: string,
  showNameDate: bool,
}

// Helper: Draw a stacked fraction at position (x, y) centered horizontally
// Returns the width of the fraction for layout purposes
let drawFraction = (pdf: JsPdf.t, num: int, denom: int, x: float, y: float): float => {
  let numStr = Int.toString(num)
  let denomStr = Int.toString(denom)
  let maxLen = max(String.length(numStr), String.length(denomStr))
  let width = Float.fromInt(maxLen) *. 3.5 +. 4.0

  // Numerator (centered above line)
  let _ = pdf->JsPdf.textWithOptions(numStr, x +. width /. 2.0, y -. 2.0, {align: #center})
  // Fraction line
  let _ = pdf->JsPdf.setLineWidth(0.3)
  let _ = pdf->JsPdf.line(x, y +. 1.0, x +. width, y +. 1.0)
  // Denominator (centered below line)
  let _ = pdf->JsPdf.textWithOptions(denomStr, x +. width /. 2.0, y +. 6.0, {align: #center})

  width
}

// Helper: Draw a mixed number (whole + fraction)
let drawMixedNumber = (pdf: JsPdf.t, whole: int, num: int, denom: int, x: float, y: float): float => {
  let wholeStr = Int.toString(whole)
  let wholeWidth = Float.fromInt(String.length(wholeStr)) *. 3.5 +. 2.0

  // Whole number
  let _ = pdf->JsPdf.text(wholeStr, x, y +. 2.0)

  // Fraction part (slightly smaller positioning)
  let fracWidth = drawFraction(pdf, num, denom, x +. wholeWidth, y)

  wholeWidth +. fracWidth
}

// Helper: Draw a fraction operand (simple fraction, mixed number, or whole)
let drawOperand = (pdf: JsPdf.t, operand: Problem.fractionOperand, x: float, y: float): float => {
  switch operand {
  | SimpleFraction({numerator, denominator}) => drawFraction(pdf, numerator, denominator, x, y)
  | MixedFraction({whole, num, denom}) => drawMixedNumber(pdf, whole, num, denom, x, y)
  | WholeNumber(n) => {
      let str = Int.toString(n)
      let _ = pdf->JsPdf.text(str, x, y +. 2.0)
      Float.fromInt(String.length(str)) *. 3.5 +. 2.0
    }
  }
}

// Internal: Build worksheet PDF (returns the PDF object)
let buildWorksheetPdf = (worksheet: worksheet): JsPdf.t => {
  let pdf = JsPdf.make({
    orientation: #portrait,
    unit: #mm,
    format: #letter,
  })

  // Set document metadata (title appears as filename in some PDF viewers)
  let filename = worksheet.title->String.replaceAll(" ", "_") ++ ".pdf"
  let _ = pdf->JsPdf.setDocumentProperties({
    title: filename,
    subject: worksheet.title,
    creator: "Numerikos",
  })

  let (pageWidth, pageHeight) = JsPdf.getPageSize(pdf)
  let margin = 25.0 // Wider margins like LaTeX
  let contentWidth = pageWidth -. margin *. 2.0

  // Title - centered, larger, bold serif
  let _ = pdf->JsPdf.setFontSize(18)
  let _ = pdf->JsPdf.setFont("times", "bold")
  let _ = pdf->JsPdf.textWithOptions(worksheet.title, pageWidth /. 2.0, 25.0, {align: #center})

  // Name and Date fields (optional)
  let startY = if worksheet.showNameDate {
    let _ = pdf->JsPdf.setFontSize(11)
    let _ = pdf->JsPdf.setFont("times", "normal")
    let _ = pdf->JsPdf.text("Name:", margin, 42.0)
    let _ = pdf->JsPdf.line(margin +. 15.0, 42.0, margin +. 80.0, 42.0)
    let _ = pdf->JsPdf.text("Date:", pageWidth -. margin -. 60.0, 42.0)
    let _ = pdf->JsPdf.line(pageWidth -. margin -. 45.0, 42.0, pageWidth -. margin, 42.0)
    55.0
  } else {
    38.0
  }

  // Problems section
  let problemsPerRow = 2  // Fewer problems per row for more workspace
  let columnWidth = contentWidth /. Float.fromInt(problemsPerRow)
  let rowHeight = 55.0  // More vertical space for student work

  // Track current page for page breaks
  let currentPage = ref(1)

  worksheet.problems->Array.forEachWithIndex((problem, idx) => {
    let col = mod(idx, problemsPerRow)
    let xBase = margin +. Float.fromInt(col) *. columnWidth

    // Calculate actual Y position accounting for page breaks
    let problemsPerPage = 8  // 2 columns × 4 rows per page
    let pageNum = idx / problemsPerPage + 1
    let rowOnPage = mod(idx / problemsPerRow, 4)
    let actualY = startY +. Float.fromInt(rowOnPage) *. rowHeight

    // Add new page if needed
    if pageNum > currentPage.contents {
      let _ = pdf->JsPdf.addPage
      currentPage := pageNum
    }

    // Problem number - bold
    let _ = pdf->JsPdf.setFontSize(12)
    let _ = pdf->JsPdf.setFont("times", "bold")
    let _ = pdf->JsPdf.text(`${Int.toString(idx + 1)}.`, xBase, actualY)

    // Problem content - use Courier for numbers (monospace)
    let _ = pdf->JsPdf.setFontSize(16)
    let _ = pdf->JsPdf.setFont("courier", "normal")

    if problem.isVertical {
      let xRight = xBase +. 50.0

      // Top number (right-aligned) - aligned with problem number
      let _ = pdf->JsPdf.textWithOptions(problem.topNumber, xRight, actualY, {align: #right})

      // Operator and bottom number
      let _ = pdf->JsPdf.text(problem.operator, xBase +. 18.0, actualY +. 8.0)
      let _ = pdf->JsPdf.textWithOptions(problem.bottomNumber, xRight, actualY +. 8.0, {align: #right})

      // Clean line under the problem
      let _ = pdf->JsPdf.setLineWidth(0.5)
      let _ = pdf->JsPdf.line(xBase +. 15.0, actualY +. 12.0, xRight +. 3.0, actualY +. 12.0)
    } else {
      // Check if we have structured fraction data for stacked rendering
      switch problem.fractionData {
      | Some(fracData) => {
          let _ = pdf->JsPdf.setFontSize(12)
          let _ = pdf->JsPdf.setFont("times", "normal")

          let startX = xBase +. 12.0
          // Position fraction so it aligns with problem number (accounting for numerator offset)
          let fracY = actualY +. 2.0

          // Draw left operand
          let leftWidth = drawOperand(pdf, fracData.left, startX, fracY)

          // Draw operator
          let opX = startX +. leftWidth +. 4.0
          let _ = pdf->JsPdf.text(fracData.op, opX, fracY +. 2.0)
          let opWidth = 8.0

          // Draw right operand
          let rightX = opX +. opWidth
          let rightWidth = drawOperand(pdf, fracData.right, rightX, fracY)

          // Draw equals and blank (or blank for comparison)
          if fracData.showBlank {
            let eqX = rightX +. rightWidth +. 4.0
            let _ = pdf->JsPdf.text("=", eqX, fracY +. 2.0)
            let _ = pdf->JsPdf.text("____", eqX +. 8.0, fracY +. 2.0)
          } else {
            // Comparison - operator is placeholder, draw blank between operands
            // Redraw with blank in the middle
            let _ = pdf->JsPdf.text("____", opX -. 2.0, fracY +. 2.0)
          }
        }
      | None => {
          // Fallback to horizontal display string with text wrapping
          let _ = pdf->JsPdf.setFontSize(12)
          let _ = pdf->JsPdf.setFont("times", "normal")
          switch problem.horizontalDisplay {
          | Some(display) => {
              // Wrap text to fit within column (leaving margin for problem number)
              let maxWidth = columnWidth -. 15.0
              let lines = pdf->JsPdf.splitTextToSize(display, maxWidth)
              lines->Array.forEachWithIndex((line, lineIdx) => {
                // First line aligns with problem number, subsequent lines below
                let lineY = actualY +. Float.fromInt(lineIdx) *. 5.0
                let _ = pdf->JsPdf.text(line, xBase +. 10.0, lineY)
              })
            }
          | None => ()
          }
        }
      }
    }
  })

  // Add footer with logo to each page
  let totalPages = pdf->JsPdf.getNumberOfPages
  let numerikosUrl = "https://www.numerikos.com"
  for pageNum in 1 to totalPages {
    let _ = pdf->JsPdf.setPage(pageNum)

    // Add Numerikos logo (6mm x 6mm)
    let logoSize = 6.0
    let logoX = margin
    let logoY = pageHeight -. 14.0
    let _ = pdf->JsPdf.addImage(Logo.dataUrl, "JPEG", logoX, logoY, logoSize, logoSize)

    // Add "Numerikos" title next to logo
    let _ = pdf->JsPdf.setFontSize(10)
    let _ = pdf->JsPdf.setFont("helvetica", "bold")
    let textX = margin +. logoSize +. 2.0
    let _ = pdf->JsPdf.text("Numerikos", textX, pageHeight -. 9.5)

    // Add clickable link covering logo and text
    let linkWidth = logoSize +. 2.0 +. 25.0 // logo + gap + approximate text width
    let _ = pdf->JsPdf.link(logoX, logoY, linkWidth, logoSize, {url: numerikosUrl})
  }

  pdf
}

// Internal: Build answer key PDF (returns the PDF object)
let buildAnswerKeyPdf = (worksheet: worksheet): JsPdf.t => {
  let pdf = JsPdf.make({
    orientation: #portrait,
    unit: #mm,
    format: #letter,
  })

  // Set document metadata
  let filename = worksheet.title->String.replaceAll(" ", "_") ++ "_Answer_Key.pdf"
  let _ = pdf->JsPdf.setDocumentProperties({
    title: filename,
    subject: worksheet.title ++ " - Answer Key",
    creator: "Numerikos",
  })

  let (pageWidth, pageHeight) = JsPdf.getPageSize(pdf)
  let margin = 25.0
  let contentWidth = pageWidth -. margin *. 2.0

  // Answer Key title
  let _ = pdf->JsPdf.setFontSize(18)
  let _ = pdf->JsPdf.setFont("times", "bold")
  let _ = pdf->JsPdf.textWithOptions("Answer Key", pageWidth /. 2.0, 25.0, {align: #center})

  // Worksheet title as subtitle
  let _ = pdf->JsPdf.setFontSize(12)
  let _ = pdf->JsPdf.setFont("times", "italic")
  let _ = pdf->JsPdf.textWithOptions(worksheet.title, pageWidth /. 2.0, 33.0, {align: #center})

  let _ = pdf->JsPdf.setFontSize(11)
  let _ = pdf->JsPdf.setFont("times", "normal")

  let answersPerRow = 5
  let answerColWidth = contentWidth /. Float.fromInt(answersPerRow)
  let answerRowHeight = 10.0
  let answerStartY = 50.0

  worksheet.problems->Array.forEachWithIndex((problem, idx) => {
    let col = mod(idx, answersPerRow)
    let row = idx / answersPerRow
    let xPos = margin +. Float.fromInt(col) *. answerColWidth
    let yPos = answerStartY +. Float.fromInt(row) *. answerRowHeight

    let _ = pdf->JsPdf.setFont("times", "bold")
    let _ = pdf->JsPdf.text(`${Int.toString(idx + 1)}.`, xPos, yPos)
    let _ = pdf->JsPdf.setFont("times", "normal")
    let _ = pdf->JsPdf.text(problem.answer, xPos +. 8.0, yPos)
  })

  // Add footer with logo to each page
  let totalPages = pdf->JsPdf.getNumberOfPages
  let numerikosUrl = "https://www.numerikos.com"
  for pageNum in 1 to totalPages {
    let _ = pdf->JsPdf.setPage(pageNum)

    // Add Numerikos logo (6mm x 6mm)
    let logoSize = 6.0
    let logoX = margin
    let logoY = pageHeight -. 14.0
    let _ = pdf->JsPdf.addImage(Logo.dataUrl, "JPEG", logoX, logoY, logoSize, logoSize)

    // Add "Numerikos" title next to logo
    let _ = pdf->JsPdf.setFontSize(10)
    let _ = pdf->JsPdf.setFont("helvetica", "bold")
    let textX = margin +. logoSize +. 2.0
    let _ = pdf->JsPdf.text("Numerikos", textX, pageHeight -. 9.5)

    // Add clickable link covering logo and text
    let linkWidth = logoSize +. 2.0 +. 25.0 // logo + gap + approximate text width
    let _ = pdf->JsPdf.link(logoX, logoY, linkWidth, logoSize, {url: numerikosUrl})
  }

  pdf
}

// Get blob URL for worksheet PDF (for iframe embedding)
let getWorksheetBlobUrl = (worksheet: worksheet): option<string> => {
  let pdf = buildWorksheetPdf(worksheet)
  JsPdf.getBlobUrl(pdf)->Nullable.toOption
}

// Preview worksheet PDF in new tab
let previewWorksheet = (worksheet: worksheet): unit => {
  let pdf = buildWorksheetPdf(worksheet)
  JsPdf.preview(pdf, worksheet.title)
}

// Preview answer key PDF in new tab
let previewAnswerKey = (worksheet: worksheet): unit => {
  let pdf = buildAnswerKeyPdf(worksheet)
  JsPdf.preview(pdf, worksheet.title ++ " - Answer Key")
}

// Download worksheet PDF
let generateWorksheet = (worksheet: worksheet): unit => {
  let pdf = buildWorksheetPdf(worksheet)
  let filename = worksheet.title->String.replaceAll(" ", "_")
  JsPdf.save(pdf, `${filename}.pdf`)
}

// Download answer key PDF
let generateAnswerKey = (worksheet: worksheet): unit => {
  let pdf = buildAnswerKeyPdf(worksheet)
  let filename = worksheet.title->String.replaceAll(" ", "_")
  JsPdf.save(pdf, `${filename}_Answer_Key.pdf`)
}

// Legacy function for backwards compatibility
let generate = (worksheet: worksheet, includeAnswerKey: bool): unit => {
  generateWorksheet(worksheet)
  if includeAnswerKey {
    generateAnswerKey(worksheet)
  }
}
