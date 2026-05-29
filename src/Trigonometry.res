// Trigonometry worksheet skills and problem generation
// Focused on no-calculator skills that fit on a printed sheet:
// exact special-angle values, angle reasoning, and right-triangle work
// based on Pythagorean triples.

// Categories available in Trigonometry
type category =
  | SpecialAngles
  | Angles
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
  // Right triangle (Pythagorean triples -> whole-number/exact answers)
  | PythagoreanHypotenuse // Find the hypotenuse from two legs
  | PythagoreanLeg        // Find a missing leg from hypotenuse and a leg
  | TrigRatioFromSides    // Find sin/cos/tan as a fraction from labeled sides

// What type of config an operation needs
type configType =
  | NoConfig

// String conversions
let categoryToString = (category: category): string => {
  switch category {
  | SpecialAngles => "Special Angles"
  | Angles => "Angles"
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
  | PythagoreanHypotenuse => "Find the Hypotenuse"
  | PythagoreanLeg => "Find a Missing Leg"
  | TrigRatioFromSides => "Trig Ratios from Sides"
  }
}

// Get all categories
let getCategories = (): array<category> => {
  [SpecialAngles, Angles, RightTriangle]
}

// Get operations for a category
let getOperationsForCategory = (category: category): array<operation> => {
  switch category {
  | SpecialAngles => [SineSpecial, CosineSpecial, TangentSpecial, MixedSpecial]
  | Angles => [ReferenceAngle, CoterminalAngle, QuadrantIdentify, DegreesToRadians, RadiansToDegrees]
  | RightTriangle => [PythagoreanHypotenuse, PythagoreanLeg, TrigRatioFromSides]
  }
}

// Get config type for an operation (all trig skills are self-contained)
let getConfigType = (_operation: operation): configType => {
  NoConfig
}
