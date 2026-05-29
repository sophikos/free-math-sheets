// URL State - serialize/deserialize the worksheet selections to the query string
// so a worksheet setup can be bookmarked, shared, and restored.
//
// The query keys are internal to this module. They only need to round-trip
// (encode then decode); they intentionally do not have to match the option
// strings used inside the selector components.
//
// NOTE: when a new grade config variant is added, extend the matching
// `*ToValue` / `valueTo*` pair below so it survives a round-trip.

// Defaults mirror the initial worksheet state in App.res. Values equal to a
// default are omitted from the URL to keep it short.
let defaultProblemCount = 10
let defaultTitle = "Math Practice"
let defaultShowNameDate = true

// --- URLSearchParams bindings -----------------------------------------------

type searchParams
@new external newSearchParams: unit => searchParams = "URLSearchParams"
@new external parseSearchParams: string => searchParams = "URLSearchParams"
@send external appendParam: (searchParams, string, string) => unit = "append"
@send @return(nullable) external getParam: (searchParams, string) => option<string> = "get"
@send external paramsToString: searchParams => string = "toString"

let buildQueryString = (pairs: array<(string, string)>): string => {
  let sp = newSearchParams()
  pairs->Array.forEach(((k, v)) => sp->appendParam(k, v))
  sp->paramsToString
}

// --- Course -----------------------------------------------------------------

let courseToValue = (course: Problem.course): string => {
  switch course {
  | Problem.KindergartenGrade => "kindergarten"
  | Problem.FirstGrade => "first"
  | Problem.SecondGrade => "second"
  | Problem.ThirdGrade => "third"
  | Problem.FourthGrade => "fourth"
  | Problem.FifthGrade => "fifth"
  | Problem.TrigonometryGrade => "trigonometry"
  }
}

let valueToCourse = (value: string): option<Problem.course> => {
  switch value {
  | "kindergarten" => Some(Problem.KindergartenGrade)
  | "first" => Some(Problem.FirstGrade)
  | "second" => Some(Problem.SecondGrade)
  | "third" => Some(Problem.ThirdGrade)
  | "fourth" => Some(Problem.FourthGrade)
  | "fifth" => Some(Problem.FifthGrade)
  | "trigonometry" => Some(Problem.TrigonometryGrade)
  | _ => None
  }
}

// --- Operation (course-aware) -----------------------------------------------

let valueToOperation = (course: Problem.course, value: string): option<Problem.operation> => {
  switch course {
  | Problem.KindergartenGrade => OperationSelector.valueToKindergartenOperation(value)
  | Problem.FirstGrade => OperationSelector.valueToFirstGradeOperation(value)
  | Problem.SecondGrade => OperationSelector.valueToSecondGradeOperation(value)
  | Problem.ThirdGrade => OperationSelector.valueToThirdGradeOperation(value)
  | Problem.FourthGrade => OperationSelector.valueToFourthGradeOperation(value)
  | Problem.FifthGrade => OperationSelector.valueToFifthGradeOperation(value)
  | Problem.TrigonometryGrade => OperationSelector.valueToTrigonometryOperation(value)
  }
}

// --- Config value mappings --------------------------------------------------

module Config = {
  // Kindergarten
  let kCountingToValue = (c: Kindergarten.countingConfig): string =>
    switch c {
    | Kindergarten.CountToTen => "ten"
    | Kindergarten.CountToTwenty => "twenty"
    | Kindergarten.MixedCounting => "mixed"
    }
  let valueToKCounting = (v: string): option<Kindergarten.countingConfig> =>
    switch v {
    | "ten" => Some(Kindergarten.CountToTen)
    | "twenty" => Some(Kindergarten.CountToTwenty)
    | "mixed" => Some(Kindergarten.MixedCounting)
    | _ => None
    }

  // First Grade
  let fAdditionToValue = (c: FirstGrade.additionConfig): string =>
    switch c {
    | FirstGrade.WithinTen => "ten"
    | FirstGrade.WithinTwenty => "twenty"
    | FirstGrade.MixedAddition => "mixed"
    }
  let valueToFAddition = (v: string): option<FirstGrade.additionConfig> =>
    switch v {
    | "ten" => Some(FirstGrade.WithinTen)
    | "twenty" => Some(FirstGrade.WithinTwenty)
    | "mixed" => Some(FirstGrade.MixedAddition)
    | _ => None
    }

  let fSubtractionToValue = (c: FirstGrade.subtractionConfig): string =>
    switch c {
    | FirstGrade.SingleDigit => "single"
    | FirstGrade.TwoDigitMinusSingle => "twodigit"
    }
  let valueToFSubtraction = (v: string): option<FirstGrade.subtractionConfig> =>
    switch v {
    | "single" => Some(FirstGrade.SingleDigit)
    | "twodigit" => Some(FirstGrade.TwoDigitMinusSingle)
    | _ => None
    }

  let fPlaceValueToValue = (c: FirstGrade.placeValueConfig): string =>
    switch c {
    | FirstGrade.TwoDigit => "twodigit"
    | FirstGrade.MixedPlaceValue => "mixed"
    }
  let valueToFPlaceValue = (v: string): option<FirstGrade.placeValueConfig> =>
    switch v {
    | "twodigit" => Some(FirstGrade.TwoDigit)
    | "mixed" => Some(FirstGrade.MixedPlaceValue)
    | _ => None
    }

  let fTimeToValue = (c: FirstGrade.timeConfig): string =>
    switch c {
    | FirstGrade.ToTheHour => "hour"
    | FirstGrade.ToHalfHour => "halfhour"
    | FirstGrade.MixedTime => "mixed"
    }
  let valueToFTime = (v: string): option<FirstGrade.timeConfig> =>
    switch v {
    | "hour" => Some(FirstGrade.ToTheHour)
    | "halfhour" => Some(FirstGrade.ToHalfHour)
    | "mixed" => Some(FirstGrade.MixedTime)
    | _ => None
    }

  // Second Grade
  let sAdditionToValue = (c: SecondGrade.additionConfig): string =>
    switch c {
    | SecondGrade.NoRegrouping => "noregroup"
    | SecondGrade.WithRegrouping => "regroup"
    | SecondGrade.MixedAddition => "mixed"
    }
  let valueToSAddition = (v: string): option<SecondGrade.additionConfig> =>
    switch v {
    | "noregroup" => Some(SecondGrade.NoRegrouping)
    | "regroup" => Some(SecondGrade.WithRegrouping)
    | "mixed" => Some(SecondGrade.MixedAddition)
    | _ => None
    }

  let sPlaceValueToValue = (c: SecondGrade.placeValueConfig): string =>
    switch c {
    | SecondGrade.TwoDigit => "twodigit"
    | SecondGrade.ThreeDigit => "threedigit"
    | SecondGrade.MixedPlaceValue => "mixed"
    }
  let valueToSPlaceValue = (v: string): option<SecondGrade.placeValueConfig> =>
    switch v {
    | "twodigit" => Some(SecondGrade.TwoDigit)
    | "threedigit" => Some(SecondGrade.ThreeDigit)
    | "mixed" => Some(SecondGrade.MixedPlaceValue)
    | _ => None
    }

  let sMoneyToValue = (c: SecondGrade.moneyConfig): string =>
    switch c {
    | SecondGrade.CoinsOnly => "coins"
    | SecondGrade.WithDollars => "dollars"
    | SecondGrade.MixedMoney => "mixed"
    }
  let valueToSMoney = (v: string): option<SecondGrade.moneyConfig> =>
    switch v {
    | "coins" => Some(SecondGrade.CoinsOnly)
    | "dollars" => Some(SecondGrade.WithDollars)
    | "mixed" => Some(SecondGrade.MixedMoney)
    | _ => None
    }

  // Third Grade
  let tMultiplicationToValue = (c: ThirdGrade.multiplicationConfig): string =>
    switch c {
    | ThirdGrade.FactsToFive => "five"
    | ThirdGrade.FactsToTen => "ten"
    | ThirdGrade.MixedFacts => "mixed"
    }
  let valueToTMultiplication = (v: string): option<ThirdGrade.multiplicationConfig> =>
    switch v {
    | "five" => Some(ThirdGrade.FactsToFive)
    | "ten" => Some(ThirdGrade.FactsToTen)
    | "mixed" => Some(ThirdGrade.MixedFacts)
    | _ => None
    }

  let tDivisionToValue = (c: ThirdGrade.divisionConfig): string =>
    switch c {
    | ThirdGrade.NoDivisionRemainder => "noremainder"
    | ThirdGrade.WithRemainder => "remainder"
    | ThirdGrade.MixedDivision => "mixed"
    }
  let valueToTDivision = (v: string): option<ThirdGrade.divisionConfig> =>
    switch v {
    | "noremainder" => Some(ThirdGrade.NoDivisionRemainder)
    | "remainder" => Some(ThirdGrade.WithRemainder)
    | "mixed" => Some(ThirdGrade.MixedDivision)
    | _ => None
    }

  let tFractionToValue = (c: ThirdGrade.fractionConfig): string =>
    switch c {
    | ThirdGrade.UnitFractions => "unit"
    | ThirdGrade.SimpleFractions => "simple"
    | ThirdGrade.MixedFractions => "mixed"
    }
  let valueToTFraction = (v: string): option<ThirdGrade.fractionConfig> =>
    switch v {
    | "unit" => Some(ThirdGrade.UnitFractions)
    | "simple" => Some(ThirdGrade.SimpleFractions)
    | "mixed" => Some(ThirdGrade.MixedFractions)
    | _ => None
    }

  let tRoundingToValue = (c: ThirdGrade.roundingConfig): string =>
    switch c {
    | ThirdGrade.RoundToTen => "ten"
    | ThirdGrade.RoundToHundred => "hundred"
    | ThirdGrade.MixedRounding => "mixed"
    }
  let valueToTRounding = (v: string): option<ThirdGrade.roundingConfig> =>
    switch v {
    | "ten" => Some(ThirdGrade.RoundToTen)
    | "hundred" => Some(ThirdGrade.RoundToHundred)
    | "mixed" => Some(ThirdGrade.MixedRounding)
    | _ => None
    }

  // Shared digit-arithmetic mapping (Fourth & Fifth share the same variants)
  let fourthArithmeticToValue = (c: FourthGrade.arithmeticConfig): string =>
    switch c {
    | FourthGrade.SingleSingle => "ss"
    | FourthGrade.DoubleSingle => "ds"
    | FourthGrade.DoubleDouble => "dd"
    | FourthGrade.TripleDouble => "td"
    | FourthGrade.TripleTriple => "tt"
    | FourthGrade.MixedDigits => "mixed"
    }
  let valueToFourthArithmetic = (v: string): option<FourthGrade.arithmeticConfig> =>
    switch v {
    | "ss" => Some(FourthGrade.SingleSingle)
    | "ds" => Some(FourthGrade.DoubleSingle)
    | "dd" => Some(FourthGrade.DoubleDouble)
    | "td" => Some(FourthGrade.TripleDouble)
    | "tt" => Some(FourthGrade.TripleTriple)
    | "mixed" => Some(FourthGrade.MixedDigits)
    | _ => None
    }

  let fourthFractionToValue = (c: FourthGrade.fractionConfig): string =>
    switch c {
    | FourthGrade.SameDenominator => "same"
    | FourthGrade.DifferentDenominator => "different"
    | FourthGrade.MixedDenominators => "mixed"
    }
  let valueToFourthFraction = (v: string): option<FourthGrade.fractionConfig> =>
    switch v {
    | "same" => Some(FourthGrade.SameDenominator)
    | "different" => Some(FourthGrade.DifferentDenominator)
    | "mixed" => Some(FourthGrade.MixedDenominators)
    | _ => None
    }

  let fourthDecimalToValue = (c: FourthGrade.decimalConfig): string =>
    switch c {
    | FourthGrade.Tenths => "tenths"
    | FourthGrade.Hundredths => "hundredths"
    | FourthGrade.MixedDecimals => "mixed"
    }
  let valueToFourthDecimal = (v: string): option<FourthGrade.decimalConfig> =>
    switch v {
    | "tenths" => Some(FourthGrade.Tenths)
    | "hundredths" => Some(FourthGrade.Hundredths)
    | "mixed" => Some(FourthGrade.MixedDecimals)
    | _ => None
    }

  let fourthRoundingToValue = (c: FourthGrade.roundingConfig): string =>
    switch c {
    | FourthGrade.RoundToTen => "ten"
    | FourthGrade.RoundToHundred => "hundred"
    | FourthGrade.RoundToThousand => "thousand"
    | FourthGrade.MixedRounding => "mixed"
    }
  let valueToFourthRounding = (v: string): option<FourthGrade.roundingConfig> =>
    switch v {
    | "ten" => Some(FourthGrade.RoundToTen)
    | "hundred" => Some(FourthGrade.RoundToHundred)
    | "thousand" => Some(FourthGrade.RoundToThousand)
    | "mixed" => Some(FourthGrade.MixedRounding)
    | _ => None
    }

  let fourthDivisionToValue = (c: FourthGrade.divisionConfig): string =>
    switch c {
    | FourthGrade.NoDivisionRemainder => "noremainder"
    | FourthGrade.WithRemainder => "remainder"
    | FourthGrade.MixedDivision => "mixed"
    }
  let valueToFourthDivision = (v: string): option<FourthGrade.divisionConfig> =>
    switch v {
    | "noremainder" => Some(FourthGrade.NoDivisionRemainder)
    | "remainder" => Some(FourthGrade.WithRemainder)
    | "mixed" => Some(FourthGrade.MixedDivision)
    | _ => None
    }

  let fourthFactorsToValue = (c: FourthGrade.factorsConfig): string =>
    switch c {
    | FourthGrade.SmallNumbers => "small"
    | FourthGrade.MediumNumbers => "medium"
    | FourthGrade.LargeNumbers => "large"
    }
  let valueToFourthFactors = (v: string): option<FourthGrade.factorsConfig> =>
    switch v {
    | "small" => Some(FourthGrade.SmallNumbers)
    | "medium" => Some(FourthGrade.MediumNumbers)
    | "large" => Some(FourthGrade.LargeNumbers)
    | _ => None
    }

  let fourthMeasurementToValue = (c: FourthGrade.measurementConfig): string =>
    switch c {
    | FourthGrade.CustomaryUnits => "customary"
    | FourthGrade.MetricUnits => "metric"
    | FourthGrade.MixedUnits => "mixed"
    }
  let valueToFourthMeasurement = (v: string): option<FourthGrade.measurementConfig> =>
    switch v {
    | "customary" => Some(FourthGrade.CustomaryUnits)
    | "metric" => Some(FourthGrade.MetricUnits)
    | "mixed" => Some(FourthGrade.MixedUnits)
    | _ => None
    }

  // Fifth Grade
  let fifthArithmeticToValue = (c: FifthGrade.arithmeticConfig): string =>
    switch c {
    | FifthGrade.SingleSingle => "ss"
    | FifthGrade.DoubleSingle => "ds"
    | FifthGrade.DoubleDouble => "dd"
    | FifthGrade.TripleDouble => "td"
    | FifthGrade.TripleTriple => "tt"
    | FifthGrade.MixedDigits => "mixed"
    }
  let valueToFifthArithmetic = (v: string): option<FifthGrade.arithmeticConfig> =>
    switch v {
    | "ss" => Some(FifthGrade.SingleSingle)
    | "ds" => Some(FifthGrade.DoubleSingle)
    | "dd" => Some(FifthGrade.DoubleDouble)
    | "td" => Some(FifthGrade.TripleDouble)
    | "tt" => Some(FifthGrade.TripleTriple)
    | "mixed" => Some(FifthGrade.MixedDigits)
    | _ => None
    }

  let fifthFractionToValue = (c: FifthGrade.fractionConfig): string =>
    switch c {
    | FifthGrade.SameDenominator => "same"
    | FifthGrade.DifferentDenominator => "different"
    | FifthGrade.MixedDenominators => "mixed"
    }
  let valueToFifthFraction = (v: string): option<FifthGrade.fractionConfig> =>
    switch v {
    | "same" => Some(FifthGrade.SameDenominator)
    | "different" => Some(FifthGrade.DifferentDenominator)
    | "mixed" => Some(FifthGrade.MixedDenominators)
    | _ => None
    }

  let fifthDecimalToValue = (c: FifthGrade.decimalConfig): string =>
    switch c {
    | FifthGrade.Tenths => "tenths"
    | FifthGrade.Hundredths => "hundredths"
    | FifthGrade.Thousandths => "thousandths"
    | FifthGrade.MixedDecimals => "mixed"
    }
  let valueToFifthDecimal = (v: string): option<FifthGrade.decimalConfig> =>
    switch v {
    | "tenths" => Some(FifthGrade.Tenths)
    | "hundredths" => Some(FifthGrade.Hundredths)
    | "thousandths" => Some(FifthGrade.Thousandths)
    | "mixed" => Some(FifthGrade.MixedDecimals)
    | _ => None
    }

  let fifthRoundingToValue = (c: FifthGrade.roundingConfig): string =>
    switch c {
    | FifthGrade.RoundToTen => "ten"
    | FifthGrade.RoundToHundred => "hundred"
    | FifthGrade.RoundToThousand => "thousand"
    | FifthGrade.RoundToTenThousand => "tenthousand"
    | FifthGrade.MixedRounding => "mixed"
    }
  let valueToFifthRounding = (v: string): option<FifthGrade.roundingConfig> =>
    switch v {
    | "ten" => Some(FifthGrade.RoundToTen)
    | "hundred" => Some(FifthGrade.RoundToHundred)
    | "thousand" => Some(FifthGrade.RoundToThousand)
    | "tenthousand" => Some(FifthGrade.RoundToTenThousand)
    | "mixed" => Some(FifthGrade.MixedRounding)
    | _ => None
    }

  let fifthDivisionToValue = (c: FifthGrade.divisionConfig): string =>
    switch c {
    | FifthGrade.NoDivisionRemainder => "noremainder"
    | FifthGrade.WithRemainder => "remainder"
    | FifthGrade.MixedDivision => "mixed"
    }
  let valueToFifthDivision = (v: string): option<FifthGrade.divisionConfig> =>
    switch v {
    | "noremainder" => Some(FifthGrade.NoDivisionRemainder)
    | "remainder" => Some(FifthGrade.WithRemainder)
    | "mixed" => Some(FifthGrade.MixedDivision)
    | _ => None
    }

  let fifthIntegerToValue = (c: FifthGrade.integerConfig): string =>
    switch c {
    | FifthGrade.SmallIntegers => "small"
    | FifthGrade.MediumIntegers => "medium"
    | FifthGrade.LargeIntegers => "large"
    | FifthGrade.MixedIntegers => "mixed"
    }
  let valueToFifthInteger = (v: string): option<FifthGrade.integerConfig> =>
    switch v {
    | "small" => Some(FifthGrade.SmallIntegers)
    | "medium" => Some(FifthGrade.MediumIntegers)
    | "large" => Some(FifthGrade.LargeIntegers)
    | "mixed" => Some(FifthGrade.MixedIntegers)
    | _ => None
    }

  let fifthExponentToValue = (c: FifthGrade.exponentConfig): string =>
    switch c {
    | FifthGrade.SmallBases => "small"
    | FifthGrade.MediumBases => "medium"
    | FifthGrade.MixedExponents => "mixed"
    }
  let valueToFifthExponent = (v: string): option<FifthGrade.exponentConfig> =>
    switch v {
    | "small" => Some(FifthGrade.SmallBases)
    | "medium" => Some(FifthGrade.MediumBases)
    | "mixed" => Some(FifthGrade.MixedExponents)
    | _ => None
    }

  let fifthOrderToValue = (c: FifthGrade.orderOfOperationsConfig): string =>
    switch c {
    | FifthGrade.TwoOperations => "two"
    | FifthGrade.ThreeOperations => "three"
    | FifthGrade.WithParentheses => "parens"
    | FifthGrade.MixedComplexity => "mixed"
    }
  let valueToFifthOrder = (v: string): option<FifthGrade.orderOfOperationsConfig> =>
    switch v {
    | "two" => Some(FifthGrade.TwoOperations)
    | "three" => Some(FifthGrade.ThreeOperations)
    | "parens" => Some(FifthGrade.WithParentheses)
    | "mixed" => Some(FifthGrade.MixedComplexity)
    | _ => None
    }

  let fifthVolumeToValue = (c: FifthGrade.volumeConfig): string =>
    switch c {
    | FifthGrade.SmallDimensions => "small"
    | FifthGrade.MediumDimensions => "medium"
    | FifthGrade.LargeDimensions => "large"
    }
  let valueToFifthVolume = (v: string): option<FifthGrade.volumeConfig> =>
    switch v {
    | "small" => Some(FifthGrade.SmallDimensions)
    | "medium" => Some(FifthGrade.MediumDimensions)
    | "large" => Some(FifthGrade.LargeDimensions)
    | _ => None
    }
}

// Find the single config that is set on a skillConfig and render it as a value.
let configToValue = (c: Problem.skillConfig): option<string> => {
  let candidates = [
    c.kindergartenCountingConfig->Option.map(Config.kCountingToValue),
    c.firstAdditionConfig->Option.map(Config.fAdditionToValue),
    c.firstSubtractionConfig->Option.map(Config.fSubtractionToValue),
    c.firstPlaceValueConfig->Option.map(Config.fPlaceValueToValue),
    c.firstTimeConfig->Option.map(Config.fTimeToValue),
    c.secondAdditionConfig->Option.map(Config.sAdditionToValue),
    c.secondPlaceValueConfig->Option.map(Config.sPlaceValueToValue),
    c.secondMoneyConfig->Option.map(Config.sMoneyToValue),
    c.thirdMultiplicationConfig->Option.map(Config.tMultiplicationToValue),
    c.thirdDivisionConfig->Option.map(Config.tDivisionToValue),
    c.thirdFractionConfig->Option.map(Config.tFractionToValue),
    c.thirdRoundingConfig->Option.map(Config.tRoundingToValue),
    c.fourthArithmeticConfig->Option.map(Config.fourthArithmeticToValue),
    c.fourthFractionConfig->Option.map(Config.fourthFractionToValue),
    c.fourthDecimalConfig->Option.map(Config.fourthDecimalToValue),
    c.fourthRoundingConfig->Option.map(Config.fourthRoundingToValue),
    c.fourthDivisionConfig->Option.map(Config.fourthDivisionToValue),
    c.fourthFactorsConfig->Option.map(Config.fourthFactorsToValue),
    c.fourthMeasurementConfig->Option.map(Config.fourthMeasurementToValue),
    c.fifthArithmeticConfig->Option.map(Config.fifthArithmeticToValue),
    c.fifthFractionConfig->Option.map(Config.fifthFractionToValue),
    c.fifthDecimalConfig->Option.map(Config.fifthDecimalToValue),
    c.fifthRoundingConfig->Option.map(Config.fifthRoundingToValue),
    c.fifthDivisionConfig->Option.map(Config.fifthDivisionToValue),
    c.fifthIntegerConfig->Option.map(Config.fifthIntegerToValue),
    c.fifthExponentConfig->Option.map(Config.fifthExponentToValue),
    c.fifthOrderOfOperationsConfig->Option.map(Config.fifthOrderToValue),
    c.fifthVolumeConfig->Option.map(Config.fifthVolumeToValue),
  ]
  candidates->Array.reduce(None, (acc, x) =>
    switch acc {
    | Some(_) => acc
    | None => x
    }
  )
}

// An all-None skill config for the given course/category/operation.
let emptySkillConfig = (
  course: Problem.course,
  category: Problem.category,
  operation: Problem.operation,
): Problem.skillConfig => {
  course,
  category,
  operation,
  kindergartenCountingConfig: None,
  firstAdditionConfig: None,
  firstSubtractionConfig: None,
  firstPlaceValueConfig: None,
  firstTimeConfig: None,
  secondAdditionConfig: None,
  secondPlaceValueConfig: None,
  secondMoneyConfig: None,
  thirdMultiplicationConfig: None,
  thirdDivisionConfig: None,
  thirdFractionConfig: None,
  thirdRoundingConfig: None,
  fourthArithmeticConfig: None,
  fourthFractionConfig: None,
  fourthDecimalConfig: None,
  fourthRoundingConfig: None,
  fourthDivisionConfig: None,
  fourthFactorsConfig: None,
  fourthMeasurementConfig: None,
  fifthArithmeticConfig: None,
  fifthFractionConfig: None,
  fifthDecimalConfig: None,
  fifthRoundingConfig: None,
  fifthDivisionConfig: None,
  fifthIntegerConfig: None,
  fifthExponentConfig: None,
  fifthOrderOfOperationsConfig: None,
  fifthVolumeConfig: None,
}

// Set the one config field implied by (course, configType) from a value string.
let setConfig = (
  course: Problem.course,
  configType: Problem.configType,
  value: string,
  base: Problem.skillConfig,
): Problem.skillConfig => {
  switch (course, configType) {
  | (Problem.KindergartenGrade, Problem.CountingType) => {
      ...base,
      kindergartenCountingConfig: Config.valueToKCounting(value),
    }
  | (Problem.FirstGrade, Problem.AdditionType) => {
      ...base,
      firstAdditionConfig: Config.valueToFAddition(value),
    }
  | (Problem.FirstGrade, Problem.SubtractionType) => {
      ...base,
      firstSubtractionConfig: Config.valueToFSubtraction(value),
    }
  | (Problem.FirstGrade, Problem.PlaceValueType) => {
      ...base,
      firstPlaceValueConfig: Config.valueToFPlaceValue(value),
    }
  | (Problem.FirstGrade, Problem.TimeType) => {...base, firstTimeConfig: Config.valueToFTime(value)}
  | (Problem.SecondGrade, Problem.AdditionType) => {
      ...base,
      secondAdditionConfig: Config.valueToSAddition(value),
    }
  | (Problem.SecondGrade, Problem.PlaceValueType) => {
      ...base,
      secondPlaceValueConfig: Config.valueToSPlaceValue(value),
    }
  | (Problem.SecondGrade, Problem.MoneyType) => {
      ...base,
      secondMoneyConfig: Config.valueToSMoney(value),
    }
  | (Problem.ThirdGrade, Problem.MultiplicationType) => {
      ...base,
      thirdMultiplicationConfig: Config.valueToTMultiplication(value),
    }
  | (Problem.ThirdGrade, Problem.DivisionType) => {
      ...base,
      thirdDivisionConfig: Config.valueToTDivision(value),
    }
  | (Problem.ThirdGrade, Problem.FractionType) => {
      ...base,
      thirdFractionConfig: Config.valueToTFraction(value),
    }
  | (Problem.ThirdGrade, Problem.RoundingType) => {
      ...base,
      thirdRoundingConfig: Config.valueToTRounding(value),
    }
  | (Problem.FourthGrade, Problem.ArithmeticType) => {
      ...base,
      fourthArithmeticConfig: Config.valueToFourthArithmetic(value),
    }
  | (Problem.FourthGrade, Problem.FractionType) => {
      ...base,
      fourthFractionConfig: Config.valueToFourthFraction(value),
    }
  | (Problem.FourthGrade, Problem.DecimalType) => {
      ...base,
      fourthDecimalConfig: Config.valueToFourthDecimal(value),
    }
  | (Problem.FourthGrade, Problem.RoundingType) => {
      ...base,
      fourthRoundingConfig: Config.valueToFourthRounding(value),
    }
  | (Problem.FourthGrade, Problem.DivisionType) => {
      ...base,
      fourthDivisionConfig: Config.valueToFourthDivision(value),
    }
  | (Problem.FourthGrade, Problem.FactorsType) => {
      ...base,
      fourthFactorsConfig: Config.valueToFourthFactors(value),
    }
  | (Problem.FourthGrade, Problem.MeasurementType) => {
      ...base,
      fourthMeasurementConfig: Config.valueToFourthMeasurement(value),
    }
  | (Problem.FifthGrade, Problem.ArithmeticType) => {
      ...base,
      fifthArithmeticConfig: Config.valueToFifthArithmetic(value),
    }
  | (Problem.FifthGrade, Problem.FractionType) => {
      ...base,
      fifthFractionConfig: Config.valueToFifthFraction(value),
    }
  | (Problem.FifthGrade, Problem.DecimalType) => {
      ...base,
      fifthDecimalConfig: Config.valueToFifthDecimal(value),
    }
  | (Problem.FifthGrade, Problem.RoundingType) => {
      ...base,
      fifthRoundingConfig: Config.valueToFifthRounding(value),
    }
  | (Problem.FifthGrade, Problem.DivisionType) => {
      ...base,
      fifthDivisionConfig: Config.valueToFifthDivision(value),
    }
  | (Problem.FifthGrade, Problem.IntegerType) => {
      ...base,
      fifthIntegerConfig: Config.valueToFifthInteger(value),
    }
  | (Problem.FifthGrade, Problem.ExponentType) => {
      ...base,
      fifthExponentConfig: Config.valueToFifthExponent(value),
    }
  | (Problem.FifthGrade, Problem.OrderOfOperationsType) => {
      ...base,
      fifthOrderOfOperationsConfig: Config.valueToFifthOrder(value),
    }
  | (Problem.FifthGrade, Problem.VolumeType) => {
      ...base,
      fifthVolumeConfig: Config.valueToFifthVolume(value),
    }
  | (_, _) => base
  }
}

// A possibly-incomplete set of selections. Each level can be filled in
// independently so that intermediate states (e.g. only a course is picked) can
// still be reflected in the URL.
type selection = {
  course: option<Problem.course>,
  category: option<Problem.category>,
  operation: option<Problem.operation>,
  // The active config rendered as a value token, present only once an
  // operation that needs config has been chosen.
  configValue: option<string>,
}

let emptySelection: selection = {
  course: None,
  category: None,
  operation: None,
  configValue: None,
}

// Build a skill config record from a selection when course, category and
// operation are all present. The config field is filled in when its token
// parses; otherwise it stays None. Returns None while any of the three primary
// levels are missing (a record cannot represent those partial states).
let selectionToRecord = (s: selection): option<Problem.skillConfig> => {
  switch (s.course, s.category, s.operation) {
  | (Some(course), Some(category), Some(operation)) => {
      let base = emptySkillConfig(course, category, operation)
      let record = switch (Problem.getConfigType(operation), s.configValue) {
      | (Problem.NoConfig, _) => base
      | (configType, Some(v)) => setConfig(course, configType, v, base)
      | (_, None) => base
      }
      Some(record)
    }
  | _ => None
  }
}

// A skill config is ready to generate when it needs no config, or its required
// config has been chosen.
let isComplete = (c: Problem.skillConfig): bool => {
  switch Problem.getConfigType(c.operation) {
  | Problem.NoConfig => true
  | _ => configToValue(c)->Option.isSome
  }
}

// --- Public encode / decode -------------------------------------------------

type decoded = {
  selection: selection,
  problemCount: option<int>,
  title: option<string>,
  showNameDate: option<bool>,
}

let encode = (
  ~selection: selection,
  ~problemCount: int,
  ~title: string,
  ~showNameDate: bool,
): string => {
  let selectionPairs = [
    selection.course->Option.map(c => ("course", courseToValue(c))),
    selection.category->Option.map(c => ("category", CategorySelector.categoryToValue(Some(c)))),
    selection.operation->Option.map(o => ("operation", OperationSelector.operationToValue(Some(o)))),
    selection.configValue->Option.map(v => ("config", v)),
  ]
  let settingPairs = [
    problemCount != defaultProblemCount ? Some(("count", Int.toString(problemCount))) : None,
    title->String.trim != "" && title != defaultTitle ? Some(("title", title)) : None,
    showNameDate != defaultShowNameDate ? Some(("namedate", showNameDate ? "1" : "0")) : None,
  ]
  Array.concat(selectionPairs, settingPairs)->Array.filterMap(x => x)->buildQueryString
}

let decode = (search: string): decoded => {
  let sp = parseSearchParams(search)
  let course = sp->getParam("course")->Option.flatMap(valueToCourse)
  let category = switch course {
  | Some(c) => sp->getParam("category")->Option.flatMap(v => CategorySelector.valueToCategory(c, v))
  | None => None
  }
  let operation = switch course {
  | Some(c) => sp->getParam("operation")->Option.flatMap(v => valueToOperation(c, v))
  | None => None
  }
  // Only meaningful once an operation is chosen.
  let configValue = switch operation {
  | Some(_) => sp->getParam("config")
  | None => None
  }
  {
    selection: {course, category, operation, configValue},
    problemCount: sp->getParam("count")->Option.flatMap(v => Int.fromString(v)),
    title: sp->getParam("title"),
    showNameDate: sp->getParam("namedate")->Option.map(v => v == "1"),
  }
}
