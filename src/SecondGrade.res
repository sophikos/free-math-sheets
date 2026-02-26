// Second Grade worksheet skills and problem generation
// Aligned with Common Core State Standards for Grade 2

// Categories available in Second Grade
type category =
  | Addition
  | Subtraction
  | PlaceValue
  | Money
  | Time
  | Patterns

// Operations within each category
type operation =
  // Addition (2.NBT)
  | AddTwoDigit         // Two-digit + one-digit
  | AddTwoDigitTwo      // Two-digit + two-digit
  | AddWithRegrouping   // Addition with regrouping
  | AddThreeNumbers     // Add three numbers
  // Subtraction (2.NBT)
  | SubtractTwoDigit    // Two-digit - one-digit
  | SubtractTwoDigitTwo // Two-digit - two-digit
  | SubtractRegrouping  // Subtraction with regrouping
  // Place Value (2.NBT)
  | HundredsTensOnes    // Identify hundreds, tens, ones
  | ExpandedForm        // Write in expanded form
  | CompareThreeDigit   // Compare three-digit numbers
  | SkipCountByTwos     // Skip count by 2s
  | SkipCountByFives    // Skip count by 5s
  | SkipCountByTens     // Skip count by 10s
  | SkipCountByHundreds // Skip count by 100s
  // Money (2.MD.8)
  | CountCoins          // Count coins
  | MakeChange          // Simple making change
  | CompareMoney        // Compare amounts
  // Time (2.MD.7)
  | TellTimeFiveMin     // Tell time to 5 minutes
  // Patterns (2.OA)
  | NumberPatterns      // Continue number patterns
  | OddEven             // Identify odd/even

// Configuration options
type additionConfig =
  | NoRegrouping        // Without regrouping
  | WithRegrouping      // With regrouping
  | MixedAddition

type placeValueConfig =
  | TwoDigit            // 10-99
  | ThreeDigit          // 100-999
  | MixedPlaceValue

type moneyConfig =
  | CoinsOnly           // Pennies, nickels, dimes, quarters
  | WithDollars         // Include dollar bills
  | MixedMoney

// What type of config an operation needs
type configType =
  | AdditionType
  | PlaceValueType
  | MoneyType
  | NoConfig

// String conversions
let categoryToString = (category: category): string => {
  switch category {
  | Addition => "Addition"
  | Subtraction => "Subtraction"
  | PlaceValue => "Place Value"
  | Money => "Money"
  | Time => "Time"
  | Patterns => "Patterns"
  }
}

let operationToString = (operation: operation): string => {
  switch operation {
  | AddTwoDigit => "Two-digit + One-digit"
  | AddTwoDigitTwo => "Two-digit + Two-digit"
  | AddWithRegrouping => "With Regrouping"
  | AddThreeNumbers => "Add Three Numbers"
  | SubtractTwoDigit => "Two-digit - One-digit"
  | SubtractTwoDigitTwo => "Two-digit - Two-digit"
  | SubtractRegrouping => "With Regrouping"
  | HundredsTensOnes => "Hundreds, Tens, Ones"
  | ExpandedForm => "Expanded Form"
  | CompareThreeDigit => "Compare Numbers"
  | SkipCountByTwos => "Skip Count by 2s"
  | SkipCountByFives => "Skip Count by 5s"
  | SkipCountByTens => "Skip Count by 10s"
  | SkipCountByHundreds => "Skip Count by 100s"
  | CountCoins => "Count Coins"
  | MakeChange => "Make Change"
  | CompareMoney => "Compare Amounts"
  | TellTimeFiveMin => "To 5 Minutes"
  | NumberPatterns => "Number Patterns"
  | OddEven => "Odd or Even"
  }
}

let additionConfigToString = (config: additionConfig): string => {
  switch config {
  | NoRegrouping => "Without regrouping"
  | WithRegrouping => "With regrouping"
  | MixedAddition => "Mixed (variety)"
  }
}

let placeValueConfigToString = (config: placeValueConfig): string => {
  switch config {
  | TwoDigit => "Two-digit (10-99)"
  | ThreeDigit => "Three-digit (100-999)"
  | MixedPlaceValue => "Mixed (variety)"
  }
}

let moneyConfigToString = (config: moneyConfig): string => {
  switch config {
  | CoinsOnly => "Coins only"
  | WithDollars => "With dollar bills"
  | MixedMoney => "Mixed (variety)"
  }
}

// Get all categories
let getCategories = (): array<category> => {
  [Addition, Subtraction, PlaceValue, Money, Time, Patterns]
}

// Get operations for a category
let getOperationsForCategory = (category: category): array<operation> => {
  switch category {
  | Addition => [AddTwoDigit, AddTwoDigitTwo, AddWithRegrouping, AddThreeNumbers]
  | Subtraction => [SubtractTwoDigit, SubtractTwoDigitTwo, SubtractRegrouping]
  | PlaceValue => [HundredsTensOnes, ExpandedForm, CompareThreeDigit, SkipCountByTwos, SkipCountByFives, SkipCountByTens, SkipCountByHundreds]
  | Money => [CountCoins, MakeChange, CompareMoney]
  | Time => [TellTimeFiveMin]
  | Patterns => [NumberPatterns, OddEven]
  }
}

// Get config type for an operation
let getConfigType = (operation: operation): configType => {
  switch operation {
  | AddTwoDigit | AddTwoDigitTwo | AddWithRegrouping | AddThreeNumbers => AdditionType
  | SubtractTwoDigit | SubtractTwoDigitTwo | SubtractRegrouping => AdditionType
  | HundredsTensOnes | ExpandedForm | CompareThreeDigit => PlaceValueType
  | SkipCountByTwos | SkipCountByFives | SkipCountByTens | SkipCountByHundreds => PlaceValueType
  | CountCoins | MakeChange | CompareMoney => MoneyType
  | _ => NoConfig
  }
}

// Get config options
let getAdditionConfigs = (): array<additionConfig> => {
  [NoRegrouping, WithRegrouping, MixedAddition]
}

let getPlaceValueConfigs = (): array<placeValueConfig> => {
  [TwoDigit, ThreeDigit, MixedPlaceValue]
}

let getMoneyConfigs = (): array<moneyConfig> => {
  [CoinsOnly, WithDollars, MixedMoney]
}
