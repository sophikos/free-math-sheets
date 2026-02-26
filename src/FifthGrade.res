// Fifth Grade worksheet skills and problem generation

// Categories available in Fifth Grade
type category =
  | Arithmetic
  | Fractions
  | Decimals
  | MixedNumbers
  | PlaceValue
  | Integers
  | Exponents
  | OrderOfOperations
  | Volume

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
  | DecimalDivision
  | DecimalComparison
  // Mixed Numbers
  | MixedNumberAddition
  | MixedNumberSubtraction
  | MixedToImproper
  | ImproperToMixed
  // Place Value
  | PlaceValueIdentify
  | Rounding
  // Integers
  | IntegerAddition
  | IntegerSubtraction
  | IntegerMultiplication
  | IntegerComparison
  // Exponents
  | ExponentEvaluate
  | ExponentMultiply
  // Order of Operations
  | OrderOfOperationsBasic      // Two operations, no parentheses
  | OrderOfOperationsParentheses // With parentheses
  | OrderOfOperationsMixed      // Mixed complexity
  // Volume
  | VolumeRectangularPrism
  | VolumeCube
  | VolumeComposite

// Configuration options (reuse Fourth Grade configs where applicable)
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
  | Thousandths
  | MixedDecimals

type roundingConfig =
  | RoundToTen
  | RoundToHundred
  | RoundToThousand
  | RoundToTenThousand
  | MixedRounding

type divisionConfig =
  | NoDivisionRemainder
  | WithRemainder
  | MixedDivision

type integerConfig =
  | SmallIntegers      // -10 to 10
  | MediumIntegers     // -50 to 50
  | LargeIntegers      // -100 to 100
  | MixedIntegers

type exponentConfig =
  | SmallBases         // bases 2-5
  | MediumBases        // bases 2-10
  | MixedExponents

type orderOfOperationsConfig =
  | TwoOperations      // Simple: 3 + 4 × 2
  | ThreeOperations    // Medium: 3 + 4 × 2 - 1
  | WithParentheses    // With parentheses: (3 + 4) × 2
  | MixedComplexity

type volumeConfig =
  | SmallDimensions    // 1-10
  | MediumDimensions   // 1-20
  | LargeDimensions    // 1-50

// What type of config an operation needs
type configType =
  | ArithmeticType
  | FractionType
  | DecimalType
  | RoundingType
  | DivisionType
  | IntegerType
  | ExponentType
  | OrderOfOperationsType
  | VolumeType
  | NoConfig

// String conversions
let categoryToString = (category: category): string => {
  switch category {
  | Arithmetic => "Arithmetic"
  | Fractions => "Fractions"
  | Decimals => "Decimals"
  | MixedNumbers => "Mixed Numbers"
  | PlaceValue => "Place Value & Rounding"
  | Integers => "Integers"
  | Exponents => "Exponents"
  | OrderOfOperations => "Order of Operations"
  | Volume => "Volume"
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
  | DecimalDivision => "Division"
  | DecimalComparison => "Comparison"
  | MixedNumberAddition => "Addition"
  | MixedNumberSubtraction => "Subtraction"
  | MixedToImproper => "Mixed to Improper"
  | ImproperToMixed => "Improper to Mixed"
  | PlaceValueIdentify => "Identify Place Value"
  | Rounding => "Rounding"
  | IntegerAddition => "Addition"
  | IntegerSubtraction => "Subtraction"
  | IntegerMultiplication => "Multiplication"
  | IntegerComparison => "Comparison"
  | ExponentEvaluate => "Evaluate"
  | ExponentMultiply => "Multiply Powers"
  | OrderOfOperationsBasic => "Basic (PEMDAS)"
  | OrderOfOperationsParentheses => "With Parentheses"
  | OrderOfOperationsMixed => "Mixed Complexity"
  | VolumeRectangularPrism => "Rectangular Prism"
  | VolumeCube => "Cube"
  | VolumeComposite => "Composite Shapes"
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
  | Thousandths => "Thousandths (3 decimal places)"
  | MixedDecimals => "Mixed (variety)"
  }
}

let roundingConfigToString = (config: roundingConfig): string => {
  switch config {
  | RoundToTen => "Round to nearest 10"
  | RoundToHundred => "Round to nearest 100"
  | RoundToThousand => "Round to nearest 1,000"
  | RoundToTenThousand => "Round to nearest 10,000"
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

let integerConfigToString = (config: integerConfig): string => {
  switch config {
  | SmallIntegers => "Small (-10 to 10)"
  | MediumIntegers => "Medium (-50 to 50)"
  | LargeIntegers => "Large (-100 to 100)"
  | MixedIntegers => "Mixed (variety)"
  }
}

let exponentConfigToString = (config: exponentConfig): string => {
  switch config {
  | SmallBases => "Small bases (2-5)"
  | MediumBases => "Medium bases (2-10)"
  | MixedExponents => "Mixed (variety)"
  }
}

let orderOfOperationsConfigToString = (config: orderOfOperationsConfig): string => {
  switch config {
  | TwoOperations => "Two operations (e.g. 3 + 4 × 2)"
  | ThreeOperations => "Three operations"
  | WithParentheses => "With parentheses"
  | MixedComplexity => "Mixed (variety)"
  }
}

let volumeConfigToString = (config: volumeConfig): string => {
  switch config {
  | SmallDimensions => "Small (1-10)"
  | MediumDimensions => "Medium (1-20)"
  | LargeDimensions => "Large (1-50)"
  }
}

// Get all categories
let getCategories = (): array<category> => {
  [Arithmetic, Fractions, Decimals, MixedNumbers, PlaceValue, Integers, Exponents, OrderOfOperations, Volume]
}

// Get operations for a category
let getOperationsForCategory = (category: category): array<operation> => {
  switch category {
  | Arithmetic => [Addition, Subtraction, Multiplication, Division]
  | Fractions => [FractionAddition, FractionSubtraction, FractionMultiplication, FractionDivision, FractionComparison, FractionEquivalence]
  | Decimals => [DecimalAddition, DecimalSubtraction, DecimalMultiplication, DecimalDivision, DecimalComparison]
  | MixedNumbers => [MixedNumberAddition, MixedNumberSubtraction, MixedToImproper, ImproperToMixed]
  | PlaceValue => [PlaceValueIdentify, Rounding]
  | Integers => [IntegerAddition, IntegerSubtraction, IntegerMultiplication, IntegerComparison]
  | Exponents => [ExponentEvaluate, ExponentMultiply]
  | OrderOfOperations => [OrderOfOperationsBasic, OrderOfOperationsParentheses, OrderOfOperationsMixed]
  | Volume => [VolumeRectangularPrism, VolumeCube, VolumeComposite]
  }
}

// Get config type for an operation
let getConfigType = (operation: operation): configType => {
  switch operation {
  | Addition | Subtraction | Multiplication => ArithmeticType
  | Division => DivisionType
  | FractionAddition | FractionSubtraction | FractionMultiplication | FractionDivision | FractionComparison | FractionEquivalence => FractionType
  | DecimalAddition | DecimalSubtraction | DecimalMultiplication | DecimalDivision | DecimalComparison => DecimalType
  | MixedNumberAddition | MixedNumberSubtraction => FractionType
  | MixedToImproper | ImproperToMixed => NoConfig
  | PlaceValueIdentify => NoConfig
  | Rounding => RoundingType
  | IntegerAddition | IntegerSubtraction | IntegerMultiplication | IntegerComparison => IntegerType
  | ExponentEvaluate | ExponentMultiply => ExponentType
  | OrderOfOperationsBasic | OrderOfOperationsParentheses | OrderOfOperationsMixed => OrderOfOperationsType
  | VolumeRectangularPrism | VolumeCube | VolumeComposite => VolumeType
  }
}

// Get all config options
let getArithmeticConfigs = (): array<arithmeticConfig> => {
  [SingleSingle, DoubleSingle, DoubleDouble, TripleDouble, TripleTriple, MixedDigits]
}

let getFractionConfigs = (): array<fractionConfig> => {
  [SameDenominator, DifferentDenominator, MixedDenominators]
}

let getDecimalConfigs = (): array<decimalConfig> => {
  [Tenths, Hundredths, Thousandths, MixedDecimals]
}

let getRoundingConfigs = (): array<roundingConfig> => {
  [RoundToTen, RoundToHundred, RoundToThousand, RoundToTenThousand, MixedRounding]
}

let getDivisionConfigs = (): array<divisionConfig> => {
  [NoDivisionRemainder, WithRemainder, MixedDivision]
}

let getIntegerConfigs = (): array<integerConfig> => {
  [SmallIntegers, MediumIntegers, LargeIntegers, MixedIntegers]
}

let getExponentConfigs = (): array<exponentConfig> => {
  [SmallBases, MediumBases, MixedExponents]
}

let getOrderOfOperationsConfigs = (): array<orderOfOperationsConfig> => {
  [TwoOperations, ThreeOperations, WithParentheses, MixedComplexity]
}

let getVolumeConfigs = (): array<volumeConfig> => {
  [SmallDimensions, MediumDimensions, LargeDimensions]
}
