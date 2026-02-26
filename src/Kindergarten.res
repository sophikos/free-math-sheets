// Kindergarten worksheet skills and problem generation

// Categories available in Kindergarten
type category =
  | Counting
  | Comparing
  | Addition
  | Subtraction

// Operations within each category
type operation =
  // Counting
  | CountObjects        // Count objects 1-20
  | WriteNumbers        // Write the number
  | NumberSequence      // Fill in missing number
  | CountByOnes         // Count forward/backward
  // Comparing
  | MoreOrLess          // Which group has more/less
  | CompareNumbers      // Compare two numbers (<, >, =)
  | OrderNumbers        // Put numbers in order
  // Addition
  | AddWithinFive       // Addition within 5
  | AddWithinTen        // Addition within 10
  | AddMissing          // Find missing addend (within 10)
  // Subtraction
  | SubtractWithinFive  // Subtraction within 5
  | SubtractWithinTen   // Subtraction within 10

// Configuration options
type countingConfig =
  | CountToTen          // 1-10
  | CountToTwenty       // 1-20
  | MixedCounting

// What type of config an operation needs
type configType =
  | CountingType
  | NoConfig

// String conversions
let categoryToString = (category: category): string => {
  switch category {
  | Counting => "Counting"
  | Comparing => "Comparing Numbers"
  | Addition => "Addition"
  | Subtraction => "Subtraction"
  }
}

let operationToString = (operation: operation): string => {
  switch operation {
  | CountObjects => "Count Objects"
  | WriteNumbers => "Write Numbers"
  | NumberSequence => "Number Sequence"
  | CountByOnes => "Count By Ones"
  | MoreOrLess => "More or Less"
  | CompareNumbers => "Compare Numbers"
  | OrderNumbers => "Order Numbers"
  | AddWithinFive => "Add Within 5"
  | AddWithinTen => "Add Within 10"
  | AddMissing => "Find Missing Number"
  | SubtractWithinFive => "Subtract Within 5"
  | SubtractWithinTen => "Subtract Within 10"
  }
}

let countingConfigToString = (config: countingConfig): string => {
  switch config {
  | CountToTen => "Count to 10"
  | CountToTwenty => "Count to 20"
  | MixedCounting => "Mixed (variety)"
  }
}

// Get all categories
let getCategories = (): array<category> => {
  [Counting, Comparing, Addition, Subtraction]
}

// Get operations for a category
let getOperationsForCategory = (category: category): array<operation> => {
  switch category {
  | Counting => [CountObjects, WriteNumbers, NumberSequence, CountByOnes]
  | Comparing => [MoreOrLess, CompareNumbers, OrderNumbers]
  | Addition => [AddWithinFive, AddWithinTen, AddMissing]
  | Subtraction => [SubtractWithinFive, SubtractWithinTen]
  }
}

// Get config type for an operation
let getConfigType = (operation: operation): configType => {
  switch operation {
  | CountObjects | WriteNumbers | NumberSequence | CountByOnes => CountingType
  | _ => NoConfig
  }
}

// Get all counting configs
let getCountingConfigs = (): array<countingConfig> => {
  [CountToTen, CountToTwenty, MixedCounting]
}
