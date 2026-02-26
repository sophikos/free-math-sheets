// Third Grade worksheet skills and problem generation
// Aligned with Common Core State Standards for Grade 3

// Categories available in Third Grade
type category =
  | Addition
  | Subtraction
  | Multiplication
  | Division
  | Fractions
  | PlaceValue
  | Time

// Operations within each category
type operation =
  // Addition (3.NBT)
  | AddThreeDigit       // Three-digit addition
  | AddMultiple         // Add multiple numbers
  // Subtraction (3.NBT)
  | SubtractThreeDigit  // Three-digit subtraction
  | SubtractAcrossZeros // Subtract across zeros
  // Multiplication (3.OA)
  | MultiplicationFacts // Basic facts 0-10
  | MultiplyByTen       // Multiply by 10 (3.NBT.3)
  // Division (3.OA)
  | DivisionFacts       // Basic division facts
  | DivideWithRemainder // Division with remainders (intro)
  // Fractions (3.NF)
  | IdentifyFractions   // Identify fraction from picture
  | CompareFractions    // Compare fractions (same denom)
  | EquivalentFractions // Find equivalent fractions
  | FractionsOnNumberLine // Place fractions on number line
  // Place Value (3.NBT)
  | RoundToTen          // Round to nearest 10
  | RoundToHundred      // Round to nearest 100
  | CompareNumbers      // Compare 3-digit numbers
  | PlaceValueIdentify  // Identify place value
  // Time (3.MD.1)
  | TellTimeMinute      // Tell time to the minute
  | ElapsedTime         // Find elapsed time

// Configuration options
type multiplicationConfig =
  | FactsToFive         // Facts 0-5
  | FactsToTen          // Facts 0-10
  | MixedFacts

type divisionConfig =
  | NoDivisionRemainder
  | WithRemainder
  | MixedDivision

type fractionConfig =
  | UnitFractions       // Fractions with numerator 1
  | SimpleFractions     // Simple fractions
  | MixedFractions

type roundingConfig =
  | RoundToTen
  | RoundToHundred
  | MixedRounding

// What type of config an operation needs
type configType =
  | MultiplicationType
  | DivisionType
  | FractionType
  | RoundingType
  | NoConfig

// String conversions
let categoryToString = (category: category): string => {
  switch category {
  | Addition => "Addition"
  | Subtraction => "Subtraction"
  | Multiplication => "Multiplication"
  | Division => "Division"
  | Fractions => "Fractions"
  | PlaceValue => "Place Value & Rounding"
  | Time => "Time"
  }
}

let operationToString = (operation: operation): string => {
  switch operation {
  | AddThreeDigit => "Three-digit Addition"
  | AddMultiple => "Add Multiple Numbers"
  | SubtractThreeDigit => "Three-digit Subtraction"
  | SubtractAcrossZeros => "Subtract Across Zeros"
  | MultiplicationFacts => "Multiplication Facts"
  | MultiplyByTen => "Multiply by 10"
  | DivisionFacts => "Division Facts"
  | DivideWithRemainder => "With Remainders"
  | IdentifyFractions => "Identify Fractions"
  | CompareFractions => "Compare Fractions"
  | EquivalentFractions => "Equivalent Fractions"
  | FractionsOnNumberLine => "Fractions on Number Line"
  | RoundToTen => "Round to Nearest 10"
  | RoundToHundred => "Round to Nearest 100"
  | CompareNumbers => "Compare Numbers"
  | PlaceValueIdentify => "Identify Place Value"
  | TellTimeMinute => "Tell Time to Minute"
  | ElapsedTime => "Elapsed Time"
  }
}

let multiplicationConfigToString = (config: multiplicationConfig): string => {
  switch config {
  | FactsToFive => "Facts 0-5"
  | FactsToTen => "Facts 0-10"
  | MixedFacts => "Mixed (variety)"
  }
}

let divisionConfigToString = (config: divisionConfig): string => {
  switch config {
  | NoDivisionRemainder => "No remainders"
  | WithRemainder => "With remainders"
  | MixedDivision => "Mixed (variety)"
  }
}

let fractionConfigToString = (config: fractionConfig): string => {
  switch config {
  | UnitFractions => "Unit fractions (1/2, 1/3, 1/4)"
  | SimpleFractions => "Simple fractions"
  | MixedFractions => "Mixed (variety)"
  }
}

let roundingConfigToString = (config: roundingConfig): string => {
  switch config {
  | RoundToTen => "Round to nearest 10"
  | RoundToHundred => "Round to nearest 100"
  | MixedRounding => "Mixed (variety)"
  }
}

// Get all categories
let getCategories = (): array<category> => {
  [Addition, Subtraction, Multiplication, Division, Fractions, PlaceValue, Time]
}

// Get operations for a category
let getOperationsForCategory = (category: category): array<operation> => {
  switch category {
  | Addition => [AddThreeDigit, AddMultiple]
  | Subtraction => [SubtractThreeDigit, SubtractAcrossZeros]
  | Multiplication => [MultiplicationFacts, MultiplyByTen]
  | Division => [DivisionFacts, DivideWithRemainder]
  | Fractions => [IdentifyFractions, CompareFractions, EquivalentFractions, FractionsOnNumberLine]
  | PlaceValue => [RoundToTen, RoundToHundred, CompareNumbers, PlaceValueIdentify]
  | Time => [TellTimeMinute, ElapsedTime]
  }
}

// Get config type for an operation
let getConfigType = (operation: operation): configType => {
  switch operation {
  | MultiplicationFacts | MultiplyByTen => MultiplicationType
  | DivisionFacts | DivideWithRemainder => DivisionType
  | IdentifyFractions | CompareFractions | EquivalentFractions | FractionsOnNumberLine => FractionType
  | RoundToTen | RoundToHundred => RoundingType
  | _ => NoConfig
  }
}

// Get config options
let getMultiplicationConfigs = (): array<multiplicationConfig> => {
  [FactsToFive, FactsToTen, MixedFacts]
}

let getDivisionConfigs = (): array<divisionConfig> => {
  [NoDivisionRemainder, WithRemainder, MixedDivision]
}

let getFractionConfigs = (): array<fractionConfig> => {
  [UnitFractions, SimpleFractions, MixedFractions]
}

let getRoundingConfigs = (): array<roundingConfig> => {
  [RoundToTen, RoundToHundred, MixedRounding]
}
