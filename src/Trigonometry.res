// Trigonometry worksheet skills and problem generation
// Focused on no-calculator skills that fit on a printed sheet:
// exact special-angle values, angle reasoning, and right-triangle work
// based on Pythagorean triples.

// Categories available in Trigonometry
type category =
  | SpecialAngles
  | Angles
  | SohCahToa
  | RightTriangle

// Operations within each category
type operation =
  // Special Angles (exact values of sin/cos/tan at 0, 30, 45, 60, 90)
  | SineSpecial         // Evaluate sin of a special angle
  | CosineSpecial       // Evaluate cos of a special angle
  | TangentSpecial      // Evaluate tan of a special angle
  | MixedSpecial        // Any of sin/cos/tan of a special angle
  // Angle reasoning (pure arithmetic, no calculator)
  | ReferenceAngle      // Find the reference angle
  | CoterminalAngle     // Find a coterminal angle in [0, 360)
  | QuadrantIdentify    // Identify the quadrant of an angle
  | DegreesToRadians    // Convert special angle degrees to radians
  | RadiansToDegrees    // Convert radians to degrees
  // SOH-CAH-TOA (write a trig ratio as a fraction from labeled sides)
  | SohCahToaSine       // sin = opposite / hypotenuse
  | SohCahToaCosine     // cos = adjacent / hypotenuse
  | SohCahToaTangent    // tan = opposite / adjacent
  | SohCahToaMixed      // any of the three
  | NameTheRatio        // name the ratio matching a sides description
  // Right triangle (Pythagorean triples -> whole-number answers)
  | PythagoreanHypotenuse // Find the hypotenuse from two legs
  | PythagoreanLeg        // Find a missing leg from hypotenuse and a leg

// What type of config an operation needs
type configType =
  | NoConfig

// String conversions
let categoryToString = (category: category): string => {
  switch category {
  | SpecialAngles => "Special Angles"
  | Angles => "Angles"
  | SohCahToa => "SOH-CAH-TOA"
  | RightTriangle => "Right Triangles"
  }
}

let operationToString = (operation: operation): string => {
  switch operation {
  | SineSpecial => "Sine of Special Angles"
  | CosineSpecial => "Cosine of Special Angles"
  | TangentSpecial => "Tangent of Special Angles"
  | MixedSpecial => "Mixed (sin, cos, tan)"
  | ReferenceAngle => "Reference Angles"
  | CoterminalAngle => "Coterminal Angles"
  | QuadrantIdentify => "Identify the Quadrant"
  | DegreesToRadians => "Degrees to Radians"
  | RadiansToDegrees => "Radians to Degrees"
  | SohCahToaSine => "Sine (opposite / hypotenuse)"
  | SohCahToaCosine => "Cosine (adjacent / hypotenuse)"
  | SohCahToaTangent => "Tangent (opposite / adjacent)"
  | SohCahToaMixed => "Mixed Ratios from Sides"
  | NameTheRatio => "Name the Ratio"
  | PythagoreanHypotenuse => "Find the Hypotenuse"
  | PythagoreanLeg => "Find a Missing Leg"
  }
}

// Get all categories
let getCategories = (): array<category> => {
  [SpecialAngles, Angles, SohCahToa, RightTriangle]
}

// Get operations for a category
let getOperationsForCategory = (category: category): array<operation> => {
  switch category {
  | SpecialAngles => [SineSpecial, CosineSpecial, TangentSpecial, MixedSpecial]
  | Angles => [ReferenceAngle, CoterminalAngle, QuadrantIdentify, DegreesToRadians, RadiansToDegrees]
  | SohCahToa => [SohCahToaSine, SohCahToaCosine, SohCahToaTangent, SohCahToaMixed, NameTheRatio]
  | RightTriangle => [PythagoreanHypotenuse, PythagoreanLeg]
  }
}

// Get config type for an operation (all trig skills are self-contained)
let getConfigType = (_operation: operation): configType => {
  NoConfig
}
