// First Grade worksheet skills and problem generation
// Aligned with Common Core State Standards for Grade 1

// Categories available in First Grade
type category =
  | Addition
  | Subtraction
  | PlaceValue
  | Comparing
  | Time

// Operations within each category
type operation =
  // Addition (1.OA)
  | AddWithinTen        // Addition within 10
  | AddWithinTwenty     // Addition within 20
  | AddDoubles          // Doubles (3+3, 5+5)
  | AddMissing          // Find missing addend
  | AddThreeNumbers     // Add three single digits
  // Subtraction (1.OA)
  | SubtractWithinTen   // Subtraction within 10
  | SubtractWithinTwenty // Subtraction within 20
  | SubtractMissing     // Find missing number
  | FactFamilies        // Related addition/subtraction facts
  // Place Value (1.NBT)
  | TensAndOnes         // Identify tens and ones
  | ExpandedForm        // Write in expanded form
  | AddTensToNumber     // Add 10 to a two-digit number
  // Comparing (1.NBT)
  | CompareNumbers      // Compare two-digit numbers
  | CompareWithSymbols  // Compare using <, >, =
  | OrderNumbers        // Put numbers in order
  // Time (1.MD.3)
  | TellTimeHour        // Tell time to the hour
  | TellTimeHalfHour    // Tell time to half hour

// Configuration options
type additionConfig =
  | WithinTen           // Sums to 10
  | WithinTwenty        // Sums to 20
  | MixedAddition

type placeValueConfig =
  | TwoDigit            // Numbers 10-99
  | MixedPlaceValue

type timeConfig =
  | ToTheHour           // Hour only
  | ToHalfHour          // Hour and half hour
  | MixedTime

// What type of config an operation needs
type configType =
  | AdditionType
  | PlaceValueType
  | TimeType
  | NoConfig

// String conversions
let categoryToString = (category: category): string => {
  switch category {
  | Addition => "Addition"
  | Subtraction => "Subtraction"
  | PlaceValue => "Place Value"
  | Comparing => "Comparing Numbers"
  | Time => "Time"
  }
}

let operationToString = (operation: operation): string => {
  switch operation {
  | AddWithinTen => "Add Within 10"
  | AddWithinTwenty => "Add Within 20"
  | AddDoubles => "Doubles"
  | AddMissing => "Find Missing Number"
  | AddThreeNumbers => "Add Three Numbers"
  | SubtractWithinTen => "Subtract Within 10"
  | SubtractWithinTwenty => "Subtract Within 20"
  | SubtractMissing => "Find Missing Number"
  | FactFamilies => "Fact Families"
  | TensAndOnes => "Tens and Ones"
  | ExpandedForm => "Expanded Form"
  | AddTensToNumber => "Add 10 to a Number"
  | CompareNumbers => "Compare Numbers"
  | CompareWithSymbols => "Compare (<, >, =)"
  | OrderNumbers => "Order Numbers"
  | TellTimeHour => "To the Hour"
  | TellTimeHalfHour => "To Half Hour"
  }
}

let additionConfigToString = (config: additionConfig): string => {
  switch config {
  | WithinTen => "Within 10"
  | WithinTwenty => "Within 20"
  | MixedAddition => "Mixed (variety)"
  }
}

let placeValueConfigToString = (config: placeValueConfig): string => {
  switch config {
  | TwoDigit => "Two-digit numbers (10-99)"
  | MixedPlaceValue => "Mixed (variety)"
  }
}

let timeConfigToString = (config: timeConfig): string => {
  switch config {
  | ToTheHour => "To the hour"
  | ToHalfHour => "To half hour"
  | MixedTime => "Mixed (variety)"
  }
}

// Get all categories
let getCategories = (): array<category> => {
  [Addition, Subtraction, PlaceValue, Comparing, Time]
}

// Get operations for a category
let getOperationsForCategory = (category: category): array<operation> => {
  switch category {
  | Addition => [AddWithinTen, AddWithinTwenty, AddDoubles, AddMissing, AddThreeNumbers]
  | Subtraction => [SubtractWithinTen, SubtractWithinTwenty, SubtractMissing, FactFamilies]
  | PlaceValue => [TensAndOnes, ExpandedForm, AddTensToNumber]
  | Comparing => [CompareNumbers, CompareWithSymbols, OrderNumbers]
  | Time => [TellTimeHour, TellTimeHalfHour]
  }
}

// Get config type for an operation
let getConfigType = (operation: operation): configType => {
  switch operation {
  | AddWithinTen | AddWithinTwenty | AddDoubles | AddMissing | AddThreeNumbers => AdditionType
  | SubtractWithinTen | SubtractWithinTwenty | SubtractMissing => AdditionType
  | TensAndOnes | ExpandedForm | AddTensToNumber => PlaceValueType
  | TellTimeHour | TellTimeHalfHour => TimeType
  | _ => NoConfig
  }
}

// Get all addition configs
let getAdditionConfigs = (): array<additionConfig> => {
  [WithinTen, WithinTwenty, MixedAddition]
}

// Get all place value configs
let getPlaceValueConfigs = (): array<placeValueConfig> => {
  [TwoDigit, MixedPlaceValue]
}

// Get all time configs
let getTimeConfigs = (): array<timeConfig> => {
  [ToTheHour, ToHalfHour, MixedTime]
}
