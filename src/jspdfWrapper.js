import { jsPDF } from 'jspdf';

export function createPdf(options) {
  return new jsPDF(options);
}

export function savePdf(pdf, filename) {
  console.log("savePdf called with filename:", filename);
  try {
    // Use blob approach for more reliable downloads
    const blob = pdf.output('blob');
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.download = filename;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(url);
    console.log("PDF download triggered via blob URL");
  } catch (e) {
    console.error("Error in savePdf:", e);
  }
}

export function previewPdf(pdf, title) {
  console.log("previewPdf called with title:", title);
  try {
    const blob = pdf.output('blob');
    const url = URL.createObjectURL(blob);
    window.open(url, '_blank');
    console.log("PDF preview opened in new tab");
  } catch (e) {
    console.error("Error in previewPdf:", e);
  }
}

// Get blob URL for embedding PDF in iframe
export function getBlobUrl(pdf) {
  try {
    const blob = pdf.output('blob');
    return URL.createObjectURL(blob);
  } catch (e) {
    console.error("Error in getBlobUrl:", e);
    return null;
  }
}
