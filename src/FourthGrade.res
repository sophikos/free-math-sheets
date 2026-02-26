// Fourth Grade worksheet skills and problem generation

// Categories available in Fourth Grade
type category =
  | Arithmetic
  | Fractions
  | Decimals
  | MixedNumbers
  | PlaceValue
  | FactorsMultiples
  | Measurement

// Operations within each category
type operation =
  // Arithmetic
  | Addition
  | Subtraction
  | Multiplication
  | Division
  // Fractions
  | FractionAddition
  | FractionSubtraction
  | FractionMultiplication
  | FractionDivision
  | FractionComparison
  | FractionEquivalence
  // Decimals
  | DecimalAddition
  | DecimalSubtraction
  | DecimalMultiplication
  | DecimalComparison
  // Mixed Numbers
  | MixedNumberAddition
  | MixedNumberSubtraction
  | MixedToImproper
  | ImproperToMixed
  // Place Value
  | PlaceValueIdentify
  | Rounding
  // Factors & Multiples
  | FindFactors
  | GCF
  | LCM
  | PrimeComposite
  // Measurement
  | LengthConversion
  | WeightConversion
  | CapacityConversion
  | TimeConversion

// Configuration options
type arithmeticConfig =
  | SingleSingle
  | DoubleSingle
  | DoubleDouble
  | TripleDouble
  | TripleTriple
  | MixedDigits

type fractionConfig =
  | SameDenominator
  | DifferentDenominator
  | MixedDenominators

type decimalConfig =
  | Tenths
  | Hundredths
  | MixedDecimals

type roundingConfig =
  | RoundToTen
  | RoundToHundred
  | RoundToThousand
  | MixedRounding

type divisionConfig =
  | NoDivisionRemainder
  | WithRemainder
  | MixedDivision

type factorsConfig =
  | SmallNumbers      // 1-50
  | MediumNumbers     // 1-100
  | LargeNumbers      // 1-200

type measurementConfig =
  | CustomaryUnits    // feet/inches, pounds/ounces, etc.
  | MetricUnits       // meters/centimeters, grams/kilograms, etc.
  | MixedUnits        // variety

// What type of config an operation needs
type configType =
  | ArithmeticType
  | FractionType
  | DecimalType
  | RoundingType
  | DivisionType
  | FactorsType
  | MeasurementType
  | NoConfig

// String conversions
let categoryToString = (category: category): string => {
  switch category {
  | Arithmetic => "Arithmetic"
  | Fractions => "Fractions"
  | Decimals => "Decimals"
  | MixedNumbers => "Mixed Numbers"
  | PlaceValue => "Place Value & Rounding"
  | FactorsMultiples => "Factors & Multiples"
  | Measurement => "Measurement"
  }
}

let operationToString = (operation: operation): string => {
  switch operation {
  | Addition => "Addition"
  | Subtraction => "Subtraction"
  | Multiplication => "Multiplication"
  | Division => "Division"
  | FractionAddition => "Addition"
  | FractionSubtraction => "Subtraction"
  | FractionMultiplication => "Multiplication"
  | FractionDivision => "Division"
  | FractionComparison => "Comparison"
  | FractionEquivalence => "Equivalence"
  | DecimalAddition => "Addition"
  | DecimalSubtraction => "Subtraction"
  | DecimalMultiplication => "Multiplication"
  | DecimalComparison => "Comparison"
  | MixedNumberAddition => "Addition"
  | MixedNumberSubtraction => "Subtraction"
  | MixedToImproper => "Mixed to Improper"
  | ImproperToMixed => "Improper to Mixed"
  | PlaceValueIdentify => "Identify Place Value"
  | Rounding => "Rounding"
  | FindFactors => "Find Factors"
  | GCF => "Greatest Common Factor"
  | LCM => "Least Common Multiple"
  | PrimeComposite => "Prime or Composite"
  | LengthConversion => "Length"
  | WeightConversion => "Weight"
  | CapacityConversion => "Capacity"
  | TimeConversion => "Time"
  }
}

let arithmeticConfigToString = (config: arithmeticConfig): string => {
  switch config {
  | SingleSingle => "Single + Single (e.g. 7 + 5)"
  | DoubleSingle => "Double + Single (e.g. 45 + 8)"
  | DoubleDouble => "Double + Double (e.g. 47 + 36)"
  | TripleDouble => "Triple + Double (e.g. 347 + 56)"
  | TripleTriple => "Triple + Triple (e.g. 347 + 256)"
  | MixedDigits => "Mixed (variety)"
  }
}

let fractionConfigToString = (config: fractionConfig): string => {
  switch config {
  | SameDenominator => "Same denominators"
  | DifferentDenominator => "Different denominators"
  | MixedDenominators => "Mixed (variety)"
  }
}

let decimalConfigToString = (config: decimalConfig): string => {
  switch config {
  | Tenths => "Tenths (1 decimal place)"
  | Hundredths => "Hundredths (2 decimal places)"
  | MixedDecimals => "Mixed (variety)"
  }
}

let roundingConfigToString = (config: roundingConfig): string => {
  switch config {
  | RoundToTen => "Round to nearest 10"
  | RoundToHundred => "Round to nearest 100"
  | RoundToThousand => "Round to nearest 1,000"
  | MixedRounding => "Mixed (variety)"
  }
}

let divisionConfigToString = (config: divisionConfig): string => {
  switch config {
  | NoDivisionRemainder => "No remainders"
  | WithRemainder => "With remainders"
  | MixedDivision => "Mixed (variety)"
  }
}

let factorsConfigToString = (config: factorsConfig): string => {
  switch config {
  | SmallNumbers => "Small (1-50)"
  | MediumNumbers => "Medium (1-100)"
  | LargeNumbers => "Large (1-200)"
  }
}

let measurementConfigToString = (config: measurementConfig): string => {
  switch config {
  | CustomaryUnits => "Customary (feet, pounds, cups)"
  | MetricUnits => "Metric (meters, grams, liters)"
  | MixedUnits => "Mixed (variety)"
  }
}

// Get all categories
let getCategories = (): array<category> => {
  [Arithmetic, Fractions, Decimals, MixedNumbers, PlaceValue, FactorsMultiples, Measurement]
}

// Get operations for a category
let getOperationsForCategory = (category: category): array<operation> => {
  switch category {
  | Arithmetic => [Addition, Subtraction, Multiplication, Division]
  | Fractions => [FractionAddition, FractionSubtraction, FractionMultiplication, FractionDivision, FractionComparison, FractionEquivalence]
  | Decimals => [DecimalAddition, DecimalSubtraction, DecimalMultiplication, DecimalComparison]
  | MixedNumbers => [MixedNumberAddition, MixedNumberSubtraction, MixedToImproper, ImproperToMixed]
  | PlaceValue => [PlaceValueIdentify, Rounding]
  | FactorsMultiples => [FindFactors, GCF, LCM, PrimeComposite]
  | Measurement => [LengthConversion, WeightConversion, CapacityConversion, TimeConversion]
  }
}

// Get config type for an operation
let getConfigType = (operation: operation): configType => {
  switch operation {
  | Addition | Subtraction | Multiplication => ArithmeticType
  | Division => DivisionType
  | FractionAddition | FractionSubtraction | FractionMultiplication | FractionDivision | FractionComparison | FractionEquivalence => FractionType
  | DecimalAddition | DecimalSubtraction | DecimalMultiplication | DecimalComparison => DecimalType
  | MixedNumberAddition | MixedNumberSubtraction => FractionType
  | MixedToImproper | ImproperToMixed => NoConfig
  | PlaceValueIdentify => NoConfig
  | Rounding => RoundingType
  | FindFactors | GCF | LCM => FactorsType
  | PrimeComposite => NoConfig
  | LengthConversion | WeightConversion | CapacityConversion | TimeConversion => MeasurementType
  }
}

// Get all arithmetic configs
let getArithmeticConfigs = (): array<arithmeticConfig> => {
  [SingleSingle, DoubleSingle, DoubleDouble, TripleDouble, TripleTriple, MixedDigits]
}

// Get all fraction configs
let getFractionConfigs = (): array<fractionConfig> => {
  [SameDenominator, DifferentDenominator, MixedDenominators]
}

// Get all decimal configs
let getDecimalConfigs = (): array<decimalConfig> => {
  [Tenths, Hundredths, MixedDecimals]
}

// Get all rounding configs
let getRoundingConfigs = (): array<roundingConfig> => {
  [RoundToTen, RoundToHundred, RoundToThousand, MixedRounding]
}

// Get all division configs
let getDivisionConfigs = (): array<divisionConfig> => {
  [NoDivisionRemainder, WithRemainder, MixedDivision]
}

// Get all factors configs
let getFactorsConfigs = (): array<factorsConfig> => {
  [SmallNumbers, MediumNumbers, LargeNumbers]
}

// Get all measurement configs
let getMeasurementConfigs = (): array<measurementConfig> => {
  [CustomaryUnits, MetricUnits, MixedUnits]
}
