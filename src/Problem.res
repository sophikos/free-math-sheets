// Problem types and generation - combines all grades

// Grade sum type
type grade =
  | KindergartenGrade
  | FirstGrade
  | SecondGrade
  | ThirdGrade
  | FourthGrade
  | FifthGrade

// Category sum type (wraps grade-specific categories)
type category =
  | KindergartenCategory(Kindergarten.category)
  | FirstGradeCategory(FirstGrade.category)
  | SecondGradeCategory(SecondGrade.category)
  | ThirdGradeCategory(ThirdGrade.category)
  | FourthGradeCategory(FourthGrade.category)
  | FifthGradeCategory(FifthGrade.category)

// Operation sum type (wraps grade-specific operations)
type operation =
  | KindergartenOperation(Kindergarten.operation)
  | FirstGradeOperation(FirstGrade.operation)
  | SecondGradeOperation(SecondGrade.operation)
  | ThirdGradeOperation(ThirdGrade.operation)
  | FourthGradeOperation(FourthGrade.operation)
  | FifthGradeOperation(FifthGrade.operation)

// Config type indicator
type configType =
  | ArithmeticType
  | FractionType
  | DecimalType
  | RoundingType
  | DivisionType
  | FactorsType
  | MeasurementType
  | IntegerType
  | ExponentType
  | OrderOfOperationsType
  | VolumeType
  | CountingType
  | AdditionType
  | PlaceValueType
  | MoneyType
  | TimeType
  | MultiplicationType
  | NoConfig

// Skill configuration
type skillConfig = {
  grade: grade,
  category: category,
  operation: operation,
  // Kindergarten configs
  kindergartenCountingConfig: option<Kindergarten.countingConfig>,
  // First grade configs
  firstAdditionConfig: option<FirstGrade.additionConfig>,
  firstPlaceValueConfig: option<FirstGrade.placeValueConfig>,
  firstTimeConfig: option<FirstGrade.timeConfig>,
  // Second grade configs
  secondAdditionConfig: option<SecondGrade.additionConfig>,
  secondPlaceValueConfig: option<SecondGrade.placeValueConfig>,
  secondMoneyConfig: option<SecondGrade.moneyConfig>,
  // Third grade configs
  thirdMultiplicationConfig: option<ThirdGrade.multiplicationConfig>,
  thirdDivisionConfig: option<ThirdGrade.divisionConfig>,
  thirdFractionConfig: option<ThirdGrade.fractionConfig>,
  thirdRoundingConfig: option<ThirdGrade.roundingConfig>,
  // Fourth grade configs
  fourthArithmeticConfig: option<FourthGrade.arithmeticConfig>,
  fourthFractionConfig: option<FourthGrade.fractionConfig>,
  fourthDecimalConfig: option<FourthGrade.decimalConfig>,
  fourthRoundingConfig: option<FourthGrade.roundingConfig>,
  fourthDivisionConfig: option<FourthGrade.divisionConfig>,
  fourthFactorsConfig: option<FourthGrade.factorsConfig>,
  fourthMeasurementConfig: option<FourthGrade.measurementConfig>,
  // Fifth grade configs
  fifthArithmeticConfig: option<FifthGrade.arithmeticConfig>,
  fifthFractionConfig: option<FifthGrade.fractionConfig>,
  fifthDecimalConfig: option<FifthGrade.decimalConfig>,
  fifthRoundingConfig: option<FifthGrade.roundingConfig>,
  fifthDivisionConfig: option<FifthGrade.divisionConfig>,
  fifthIntegerConfig: option<FifthGrade.integerConfig>,
  fifthExponentConfig: option<FifthGrade.exponentConfig>,
  fifthOrderOfOperationsConfig: option<FifthGrade.orderOfOperationsConfig>,
  fifthVolumeConfig: option<FifthGrade.volumeConfig>,
}

// Fraction representation for stacked display
type fraction = {
  numerator: int,
  denominator: int,
}

type mixedNumber = {
  whole: int,
  num: int,
  denom: int,
}

type fractionOperand =
  | SimpleFraction(fraction)
  | MixedFraction(mixedNumber)
  | WholeNumber(int)

type fractionProblemData = {
  left: fractionOperand,
  op: string,
  right: fractionOperand,
  showBlank: bool, // true = show blank for answer, false = comparison (show blank between operands)
}

// Problem representation
type problem = {
  topNumber: string,
  operator: string,
  bottomNumber: string,
  answer: string,
  isVertical: bool,
  horizontalDisplay: option<string>,
  fractionData: option<fractionProblemData>, // For stacked fraction rendering
}

// String conversions
let gradeToString = (grade: grade): string => {
  switch grade {
  | KindergartenGrade => "Kindergarten"
  | FirstGrade => "First Grade"
  | SecondGrade => "Second Grade"
  | ThirdGrade => "Third Grade"
  | FourthGrade => "Fourth Grade"
  | FifthGrade => "Fifth Grade"
  }
}

let categoryToString = (category: category): string => {
  switch category {
  | KindergartenCategory(cat) => Kindergarten.categoryToString(cat)
  | FirstGradeCategory(cat) => FirstGrade.categoryToString(cat)
  | SecondGradeCategory(cat) => SecondGrade.categoryToString(cat)
  | ThirdGradeCategory(cat) => ThirdGrade.categoryToString(cat)
  | FourthGradeCategory(cat) => FourthGrade.categoryToString(cat)
  | FifthGradeCategory(cat) => FifthGrade.categoryToString(cat)
  }
}

let operationToString = (operation: operation): string => {
  switch operation {
  | KindergartenOperation(op) => Kindergarten.operationToString(op)
  | FirstGradeOperation(op) => FirstGrade.operationToString(op)
  | SecondGradeOperation(op) => SecondGrade.operationToString(op)
  | ThirdGradeOperation(op) => ThirdGrade.operationToString(op)
  | FourthGradeOperation(op) => FourthGrade.operationToString(op)
  | FifthGradeOperation(op) => FifthGrade.operationToString(op)
  }
}

// Get categories for a grade
let getCategoriesForGrade = (grade: grade): array<category> => {
  switch grade {
  | KindergartenGrade => Kindergarten.getCategories()->Array.map(c => KindergartenCategory(c))
  | FirstGrade => FirstGrade.getCategories()->Array.map(c => FirstGradeCategory(c))
  | SecondGrade => SecondGrade.getCategories()->Array.map(c => SecondGradeCategory(c))
  | ThirdGrade => ThirdGrade.getCategories()->Array.map(c => ThirdGradeCategory(c))
  | FourthGrade => FourthGrade.getCategories()->Array.map(c => FourthGradeCategory(c))
  | FifthGrade => FifthGrade.getCategories()->Array.map(c => FifthGradeCategory(c))
  }
}

// Get operations for a category
let getOperationsForCategory = (category: category): array<operation> => {
  switch category {
  | KindergartenCategory(cat) => Kindergarten.getOperationsForCategory(cat)->Array.map(op => KindergartenOperation(op))
  | FirstGradeCategory(cat) => FirstGrade.getOperationsForCategory(cat)->Array.map(op => FirstGradeOperation(op))
  | SecondGradeCategory(cat) => SecondGrade.getOperationsForCategory(cat)->Array.map(op => SecondGradeOperation(op))
  | ThirdGradeCategory(cat) => ThirdGrade.getOperationsForCategory(cat)->Array.map(op => ThirdGradeOperation(op))
  | FourthGradeCategory(cat) => FourthGrade.getOperationsForCategory(cat)->Array.map(op => FourthGradeOperation(op))
  | FifthGradeCategory(cat) => FifthGrade.getOperationsForCategory(cat)->Array.map(op => FifthGradeOperation(op))
  }
}

// Get config type for an operation
let getConfigType = (operation: operation): configType => {
  switch operation {
  | KindergartenOperation(op) =>
    switch Kindergarten.getConfigType(op) {
    | Kindergarten.CountingType => CountingType
    | Kindergarten.NoConfig => NoConfig
    }
  | FirstGradeOperation(op) =>
    switch FirstGrade.getConfigType(op) {
    | FirstGrade.AdditionType => AdditionType
    | FirstGrade.PlaceValueType => PlaceValueType
    | FirstGrade.TimeType => TimeType
    | FirstGrade.NoConfig => NoConfig
    }
  | SecondGradeOperation(op) =>
    switch SecondGrade.getConfigType(op) {
    | SecondGrade.AdditionType => AdditionType
    | SecondGrade.PlaceValueType => PlaceValueType
    | SecondGrade.MoneyType => MoneyType
    | SecondGrade.NoConfig => NoConfig
    }
  | ThirdGradeOperation(op) =>
    switch ThirdGrade.getConfigType(op) {
    | ThirdGrade.MultiplicationType => MultiplicationType
    | ThirdGrade.DivisionType => DivisionType
    | ThirdGrade.FractionType => FractionType
    | ThirdGrade.RoundingType => RoundingType
    | ThirdGrade.NoConfig => NoConfig
    }
  | FourthGradeOperation(op) =>
    switch FourthGrade.getConfigType(op) {
    | FourthGrade.ArithmeticType => ArithmeticType
    | FourthGrade.FractionType => FractionType
    | FourthGrade.DecimalType => DecimalType
    | FourthGrade.RoundingType => RoundingType
    | FourthGrade.DivisionType => DivisionType
    | FourthGrade.FactorsType => FactorsType
    | FourthGrade.MeasurementType => MeasurementType
    | FourthGrade.NoConfig => NoConfig
    }
  | FifthGradeOperation(op) =>
    switch FifthGrade.getConfigType(op) {
    | FifthGrade.ArithmeticType => ArithmeticType
    | FifthGrade.FractionType => FractionType
    | FifthGrade.DecimalType => DecimalType
    | FifthGrade.RoundingType => RoundingType
    | FifthGrade.DivisionType => DivisionType
    | FifthGrade.IntegerType => IntegerType
    | FifthGrade.ExponentType => ExponentType
    | FifthGrade.OrderOfOperationsType => OrderOfOperationsType
    | FifthGrade.VolumeType => VolumeType
    | FifthGrade.NoConfig => NoConfig
    }
  }
}

// Random number helpers
let randomInt = (min: int, max: int): int => {
  min + Int.fromFloat(Math.floor(Math.random() *. Float.fromInt(max - min + 1)))
}

let rec gcd = (a: int, b: int): int => {
  if b == 0 { a } else { gcd(b, mod(a, b)) }
}

// Get digit ranges based on arithmetic config
let rec getFourthGradeDigitRanges = (config: FourthGrade.arithmeticConfig): ((int, int), (int, int)) => {
  switch config {
  | SingleSingle => ((1, 9), (1, 9))
  | DoubleSingle => ((10, 99), (1, 9))
  | DoubleDouble => ((10, 99), (10, 99))
  | TripleDouble => ((100, 999), (10, 99))
  | TripleTriple => ((100, 999), (100, 999))
  | MixedDigits => {
      let configs: array<FourthGrade.arithmeticConfig> = [SingleSingle, DoubleSingle, DoubleDouble, TripleDouble]
      let idx = randomInt(0, Array.length(configs) - 1)
      getFourthGradeDigitRanges(configs->Array.getUnsafe(idx))
    }
  }
}

let rec getFifthGradeDigitRanges = (config: FifthGrade.arithmeticConfig): ((int, int), (int, int)) => {
  switch config {
  | SingleSingle => ((1, 9), (1, 9))
  | DoubleSingle => ((10, 99), (1, 9))
  | DoubleDouble => ((10, 99), (10, 99))
  | TripleDouble => ((100, 999), (10, 99))
  | TripleTriple => ((100, 999), (100, 999))
  | MixedDigits => {
      let configs: array<FifthGrade.arithmeticConfig> = [SingleSingle, DoubleSingle, DoubleDouble, TripleDouble]
      let idx = randomInt(0, Array.length(configs) - 1)
      getFifthGradeDigitRanges(configs->Array.getUnsafe(idx))
    }
  }
}

// Problem generators for Kindergarten
let generateKindergartenProblem = (op: Kindergarten.operation, config: skillConfig): problem => {
  switch op {
  | CountObjects => {
      let countCfg = config.kindergartenCountingConfig->Option.getOr(Kindergarten.CountToTen)
      let maxNum = switch countCfg {
      | CountToTen => 10
      | CountToTwenty => 20
      | MixedCounting => if Math.random() > 0.5 { 10 } else { 20 }
      }
      let num = randomInt(1, maxNum)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(num),
        isVertical: false,
        horizontalDisplay: Some(`Count the objects: ${"*"->String.repeat(num)} = ____`),
        fractionData: None,
      }
    }

  | WriteNumbers => {
      let countCfg = config.kindergartenCountingConfig->Option.getOr(Kindergarten.CountToTen)
      let maxNum = switch countCfg {
      | CountToTen => 10
      | CountToTwenty => 20
      | MixedCounting => if Math.random() > 0.5 { 10 } else { 20 }
      }
      let num = randomInt(0, maxNum)
      let words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
                   "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty"]
      let word = words->Array.get(num)->Option.getOr("?")
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(num),
        isVertical: false,
        horizontalDisplay: Some(`Write the number: ${word} = ____`),
        fractionData: None,
      }
    }

  | NumberSequence => {
      let countCfg = config.kindergartenCountingConfig->Option.getOr(Kindergarten.CountToTen)
      let maxNum = switch countCfg {
      | CountToTen => 8
      | CountToTwenty => 18
      | MixedCounting => if Math.random() > 0.5 { 8 } else { 18 }
      }
      let start = randomInt(1, maxNum)
      let missing = randomInt(0, 2) // which position is missing
      let seq = [start, start + 1, start + 2]
      let answer = seq->Array.get(missing)->Option.getOr(0)
      let display = seq->Array.mapWithIndex((i, n) =>
        if i == missing { "____" } else { Int.toString(n) }
      )->Array.join(", ")
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(answer),
        isVertical: false,
        horizontalDisplay: Some(`Fill in the missing number: ${display}`),
        fractionData: None,
      }
    }

  | CountByOnes => {
      let countCfg = config.kindergartenCountingConfig->Option.getOr(Kindergarten.CountToTen)
      let maxNum = switch countCfg {
      | CountToTen => 7
      | CountToTwenty => 17
      | MixedCounting => if Math.random() > 0.5 { 7 } else { 17 }
      }
      let start = randomInt(1, maxNum)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(start + 1)}, ${Int.toString(start + 2)}, ${Int.toString(start + 3)}`,
        isVertical: false,
        horizontalDisplay: Some(`Count forward: ${Int.toString(start)}, ____, ____, ____`),
        fractionData: None,
      }
    }

  | MoreOrLess => {
      let a = randomInt(1, 10)
      let b = randomInt(1, 10)
      let answer = if a > b { "more" } else if a < b { "less" } else { "same" }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: answer,
        isVertical: false,
        horizontalDisplay: Some(`${"*"->String.repeat(a)} has ____ than ${"*"->String.repeat(b)} (more/less/same)`),
        fractionData: None,
      }
    }

  | CompareNumbers => {
      let a = randomInt(1, 20)
      let b = randomInt(1, 20)
      let symbol = if a > b { ">" } else if a < b { "<" } else { "=" }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: symbol,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(a)}  ____  ${Int.toString(b)}`),
        fractionData: None,
      }
    }

  | OrderNumbers => {
      let a = randomInt(1, 10)
      let b = randomInt(1, 10)
      let c = randomInt(1, 10)
      let sorted = [a, b, c]->Array.toSorted((x, y) => Float.fromInt(x - y))
      let answer = sorted->Array.map(n => Int.toString(n))->Array.join(", ")
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: answer,
        isVertical: false,
        horizontalDisplay: Some(`Order from smallest to largest: ${Int.toString(a)}, ${Int.toString(b)}, ${Int.toString(c)} = ____`),
        fractionData: None,
      }
    }

  | AddWithinFive => {
      let a = randomInt(0, 5)
      let b = randomInt(0, 5 - a)
      {
        topNumber: Int.toString(a),
        operator: "+",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a + b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | AddWithinTen => {
      let a = randomInt(0, 10)
      let b = randomInt(0, 10 - a)
      {
        topNumber: Int.toString(a),
        operator: "+",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a + b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | AddMissing => {
      let sum = randomInt(2, 10)
      let a = randomInt(1, sum - 1)
      let b = sum - a
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(b),
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(a)} + ____ = ${Int.toString(sum)}`),
        fractionData: None,
      }
    }

  | SubtractWithinFive => {
      let a = randomInt(1, 5)
      let b = randomInt(0, a)
      {
        topNumber: Int.toString(a),
        operator: "-",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a - b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | SubtractWithinTen => {
      let a = randomInt(1, 10)
      let b = randomInt(0, a)
      {
        topNumber: Int.toString(a),
        operator: "-",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a - b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }
  }
}

// Problem generators for First Grade
let generateFirstGradeProblem = (op: FirstGrade.operation, _config: skillConfig): problem => {
  switch op {
  | AddWithinTen => {
      let a = randomInt(0, 10)
      let b = randomInt(0, 10 - a)
      {
        topNumber: Int.toString(a),
        operator: "+",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a + b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | AddWithinTwenty => {
      let a = randomInt(0, 20)
      let b = randomInt(0, 20 - a)
      {
        topNumber: Int.toString(a),
        operator: "+",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a + b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | AddDoubles => {
      let a = randomInt(1, 10)
      {
        topNumber: Int.toString(a),
        operator: "+",
        bottomNumber: Int.toString(a),
        answer: Int.toString(a + a),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | AddMissing => {
      let sum = randomInt(5, 20)
      let a = randomInt(1, sum - 1)
      let b = sum - a
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(b),
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(a)} + ____ = ${Int.toString(sum)}`),
        fractionData: None,
      }
    }

  | AddThreeNumbers => {
      let a = randomInt(1, 6)
      let b = randomInt(1, 6)
      let c = randomInt(1, 6)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(a + b + c),
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(a)} + ${Int.toString(b)} + ${Int.toString(c)} = ____`),
        fractionData: None,
      }
    }

  | SubtractWithinTen => {
      let a = randomInt(1, 10)
      let b = randomInt(0, a)
      {
        topNumber: Int.toString(a),
        operator: "-",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a - b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | SubtractWithinTwenty => {
      let a = randomInt(1, 20)
      let b = randomInt(0, a)
      {
        topNumber: Int.toString(a),
        operator: "-",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a - b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | SubtractMissing => {
      let a = randomInt(5, 20)
      let diff = randomInt(1, a - 1)
      let b = a - diff
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(b),
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(a)} - ____ = ${Int.toString(diff)}`),
        fractionData: None,
      }
    }

  | FactFamilies => {
      let a = randomInt(1, 9)
      let b = randomInt(1, 9)
      let c = a + b
      let factType = randomInt(0, 3)
      switch factType {
      | 0 => {
          topNumber: Int.toString(a),
          operator: "+",
          bottomNumber: Int.toString(b),
          answer: Int.toString(c),
          isVertical: true,
          horizontalDisplay: None,
          fractionData: None,
        }
      | 1 => {
          topNumber: Int.toString(b),
          operator: "+",
          bottomNumber: Int.toString(a),
          answer: Int.toString(c),
          isVertical: true,
          horizontalDisplay: None,
          fractionData: None,
        }
      | 2 => {
          topNumber: Int.toString(c),
          operator: "-",
          bottomNumber: Int.toString(a),
          answer: Int.toString(b),
          isVertical: true,
          horizontalDisplay: None,
          fractionData: None,
        }
      | _ => {
          topNumber: Int.toString(c),
          operator: "-",
          bottomNumber: Int.toString(b),
          answer: Int.toString(a),
          isVertical: true,
          horizontalDisplay: None,
          fractionData: None,
        }
      }
    }

  | TensAndOnes => {
      let num = randomInt(10, 99)
      let tens = num / 10
      let ones = mod(num, 10)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(tens)} tens, ${Int.toString(ones)} ones`,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(num)} = ____ tens and ____ ones`),
        fractionData: None,
      }
    }

  | ExpandedForm => {
      let num = randomInt(10, 99)
      let tens = num / 10
      let ones = mod(num, 10)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(tens * 10)} + ${Int.toString(ones)}`,
        isVertical: false,
        horizontalDisplay: Some(`Write ${Int.toString(num)} in expanded form: ____`),
        fractionData: None,
      }
    }

  | CompareWithSymbols => {
      let a = randomInt(10, 99)
      let b = randomInt(10, 99)
      let symbol = if a > b { ">" } else if a < b { "<" } else { "=" }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: symbol,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(a)}  ____  ${Int.toString(b)}`),
        fractionData: None,
      }
    }

  | CompareNumbers => {
      let a = randomInt(10, 99)
      let b = randomInt(10, 99)
      let symbol = if a > b { ">" } else if a < b { "<" } else { "=" }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: symbol,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(a)}  ____  ${Int.toString(b)}`),
        fractionData: None,
      }
    }

  | OrderNumbers => {
      let a = randomInt(10, 99)
      let b = randomInt(10, 99)
      let c = randomInt(10, 99)
      let sorted = [a, b, c]->Array.toSorted((x, y) => Float.fromInt(x - y))
      let answer = sorted->Array.map(n => Int.toString(n))->Array.join(", ")
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: answer,
        isVertical: false,
        horizontalDisplay: Some(`Order from smallest: ${Int.toString(a)}, ${Int.toString(b)}, ${Int.toString(c)} = ____`),
        fractionData: None,
      }
    }

  | AddTensToNumber => {
      let num = randomInt(10, 79)
      {
        topNumber: Int.toString(num),
        operator: "+",
        bottomNumber: "10",
        answer: Int.toString(num + 10),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | TellTimeHour => {
      let hour = randomInt(1, 12)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(hour)}:00`,
        isVertical: false,
        horizontalDisplay: Some(`The hour hand points to ${Int.toString(hour)}, minute hand points to 12. Time: ____`),
        fractionData: None,
      }
    }

  | TellTimeHalfHour => {
      let hour = randomInt(1, 12)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(hour)}:30`,
        isVertical: false,
        horizontalDisplay: Some(`The hour hand is between ${Int.toString(hour)} and ${Int.toString(mod(hour, 12) + 1)}, minute hand points to 6. Time: ____`),
        fractionData: None,
      }
    }
  }
}

// Problem generators for Second Grade
let generateSecondGradeProblem = (op: SecondGrade.operation, config: skillConfig): problem => {
  switch op {
  | AddTwoDigit => {
      let a = randomInt(10, 99)
      let b = randomInt(1, 9)
      {
        topNumber: Int.toString(a),
        operator: "+",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a + b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | AddTwoDigitTwo => {
      let addCfg = config.secondAdditionConfig->Option.getOr(SecondGrade.NoRegrouping)
      let (a, b) = switch addCfg {
      | NoRegrouping => {
          let a = randomInt(10, 49)
          let ones_a = mod(a, 10)
          let b = randomInt(10, 49 - ones_a)
          (a, b)
        }
      | WithRegrouping | MixedAddition => {
          let a = randomInt(10, 89)
          let b = randomInt(10, 99 - a)
          (a, b)
        }
      }
      {
        topNumber: Int.toString(a),
        operator: "+",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a + b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | AddWithRegrouping => {
      let a = randomInt(15, 89)
      let b = randomInt(15, 99 - a)
      {
        topNumber: Int.toString(a),
        operator: "+",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a + b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | AddThreeNumbers => {
      let a = randomInt(10, 30)
      let b = randomInt(10, 30)
      let c = randomInt(10, 30)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(a + b + c),
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(a)} + ${Int.toString(b)} + ${Int.toString(c)} = ____`),
        fractionData: None,
      }
    }

  | SubtractTwoDigit => {
      let a = randomInt(10, 99)
      let b = randomInt(1, 9)
      let b = if b > a { a - 1 } else { b }
      {
        topNumber: Int.toString(a),
        operator: "-",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a - b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | SubtractTwoDigitTwo => {
      let a = randomInt(20, 99)
      let b = randomInt(10, a - 1)
      {
        topNumber: Int.toString(a),
        operator: "-",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a - b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | SubtractRegrouping => {
      let a = randomInt(30, 99)
      let ones_a = mod(a, 10)
      let b = randomInt(10 + ones_a + 1, a - 1)
      let b = if b > a { a - 5 } else { b }
      {
        topNumber: Int.toString(a),
        operator: "-",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a - b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | HundredsTensOnes => {
      let num = randomInt(100, 999)
      let hundreds = num / 100
      let tens = mod(num / 10, 10)
      let ones = mod(num, 10)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(hundreds)}, ${Int.toString(tens)}, ${Int.toString(ones)}`,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(num)} = ____ hundreds, ____ tens, ____ ones`),
        fractionData: None,
      }
    }

  | ExpandedForm => {
      let num = randomInt(100, 999)
      let hundreds = num / 100
      let tens = mod(num / 10, 10)
      let ones = mod(num, 10)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(hundreds * 100)} + ${Int.toString(tens * 10)} + ${Int.toString(ones)}`,
        isVertical: false,
        horizontalDisplay: Some(`Write ${Int.toString(num)} in expanded form: ____`),
        fractionData: None,
      }
    }

  | CompareThreeDigit => {
      let a = randomInt(100, 999)
      let b = randomInt(100, 999)
      let symbol = if a > b { ">" } else if a < b { "<" } else { "=" }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: symbol,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(a)}  ____  ${Int.toString(b)}`),
        fractionData: None,
      }
    }

  | SkipCountByTwos => {
      let start = randomInt(0, 5) * 2
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(start + 2)}, ${Int.toString(start + 4)}, ${Int.toString(start + 6)}`,
        isVertical: false,
        horizontalDisplay: Some(`Count by 2s: ${Int.toString(start)}, ____, ____, ____`),
        fractionData: None,
      }
    }

  | SkipCountByFives => {
      let start = randomInt(0, 5) * 5
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(start + 5)}, ${Int.toString(start + 10)}, ${Int.toString(start + 15)}`,
        isVertical: false,
        horizontalDisplay: Some(`Count by 5s: ${Int.toString(start)}, ____, ____, ____`),
        fractionData: None,
      }
    }

  | SkipCountByTens => {
      let start = randomInt(0, 5) * 10
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(start + 10)}, ${Int.toString(start + 20)}, ${Int.toString(start + 30)}`,
        isVertical: false,
        horizontalDisplay: Some(`Count by 10s: ${Int.toString(start)}, ____, ____, ____`),
        fractionData: None,
      }
    }

  | SkipCountByHundreds => {
      let start = randomInt(0, 5) * 100
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(start + 100)}, ${Int.toString(start + 200)}, ${Int.toString(start + 300)}`,
        isVertical: false,
        horizontalDisplay: Some(`Count by 100s: ${Int.toString(start)}, ____, ____, ____`),
        fractionData: None,
      }
    }

  | CountCoins => {
      let _moneyCfg = config.secondMoneyConfig->Option.getOr(SecondGrade.CoinsOnly)
      let pennies = randomInt(0, 4)
      let nickels = randomInt(0, 3)
      let dimes = randomInt(0, 3)
      let quarters = randomInt(0, 2)
      let total = pennies + nickels * 5 + dimes * 10 + quarters * 25
      let coinList = []
      for _ in 1 to quarters { let _ = coinList->Array.push("Q") }
      for _ in 1 to dimes { let _ = coinList->Array.push("D") }
      for _ in 1 to nickels { let _ = coinList->Array.push("N") }
      for _ in 1 to pennies { let _ = coinList->Array.push("P") }
      let coinStr = coinList->Array.join(" ")
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(total)} cents`,
        isVertical: false,
        horizontalDisplay: Some(`Count the coins: ${coinStr} = ____ cents`),
        fractionData: None,
      }
    }

  | MakeChange => {
      let price = randomInt(10, 90)
      let paid = 100
      let change = paid - price
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(change)} cents`,
        isVertical: false,
        horizontalDisplay: Some(`You pay $1.00 for something that costs ${Int.toString(price)} cents. Change: ____ cents`),
        fractionData: None,
      }
    }

  | CompareMoney => {
      let a = randomInt(10, 99)
      let b = randomInt(10, 99)
      let symbol = if a > b { ">" } else if a < b { "<" } else { "=" }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: symbol,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(a)} cents ____ ${Int.toString(b)} cents`),
        fractionData: None,
      }
    }

  | TellTimeFiveMin => {
      let hour = randomInt(1, 12)
      let fiveMin = randomInt(0, 11)
      let minutes = fiveMin * 5
      let minStr = if minutes < 10 { `0${Int.toString(minutes)}` } else { Int.toString(minutes) }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(hour)}:${minStr}`,
        isVertical: false,
        horizontalDisplay: Some(`Hour hand near ${Int.toString(hour)}, minute hand at ${Int.toString(fiveMin)}. Time: ____`),
        fractionData: None,
      }
    }

  | NumberPatterns => {
      let patternType = randomInt(0, 2)
      switch patternType {
      | 0 => {
          let start = randomInt(1, 50)
          let step = randomInt(2, 5)
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: `${Int.toString(start + step * 3)}, ${Int.toString(start + step * 4)}`,
            isVertical: false,
            horizontalDisplay: Some(`Continue: ${Int.toString(start)}, ${Int.toString(start + step)}, ${Int.toString(start + step * 2)}, ____, ____`),
            fractionData: None,
          }
        }
      | _ => {
          let start = randomInt(50, 100)
          let step = randomInt(2, 5)
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: `${Int.toString(start - step * 3)}, ${Int.toString(start - step * 4)}`,
            isVertical: false,
            horizontalDisplay: Some(`Continue: ${Int.toString(start)}, ${Int.toString(start - step)}, ${Int.toString(start - step * 2)}, ____, ____`),
            fractionData: None,
          }
        }
      }
    }

  | OddEven => {
      let num = randomInt(1, 100)
      let answer = if mod(num, 2) == 0 { "even" } else { "odd" }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: answer,
        isVertical: false,
        horizontalDisplay: Some(`Is ${Int.toString(num)} odd or even? ____`),
        fractionData: None,
      }
    }
  }
}

// Problem generators for Third Grade
let generateThirdGradeProblem = (op: ThirdGrade.operation, config: skillConfig): problem => {
  switch op {
  | AddThreeDigit => {
      let a = randomInt(100, 499)
      let b = randomInt(100, 499)
      {
        topNumber: Int.toString(a),
        operator: "+",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a + b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | AddMultiple => {
      let a = randomInt(100, 300)
      let b = randomInt(100, 300)
      let c = randomInt(100, 300)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(a + b + c),
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(a)} + ${Int.toString(b)} + ${Int.toString(c)} = ____`),
        fractionData: None,
      }
    }

  | SubtractThreeDigit => {
      let a = randomInt(200, 999)
      let b = randomInt(100, a - 1)
      {
        topNumber: Int.toString(a),
        operator: "-",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a - b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | SubtractAcrossZeros => {
      let hundreds = randomInt(2, 9)
      let a = hundreds * 100 // e.g., 300, 400, 500
      let b = randomInt(50, a - 50)
      {
        topNumber: Int.toString(a),
        operator: "-",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a - b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | MultiplyByTen => {
      let a = randomInt(1, 99)
      let multiplier = if Math.random() > 0.5 { 10 } else { 100 }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(a * multiplier),
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(a)} x ${Int.toString(multiplier)} = ____`),
        fractionData: None,
      }
    }

  | MultiplicationFacts => {
      let multCfg = config.thirdMultiplicationConfig->Option.getOr(ThirdGrade.FactsToTen)
      let maxFact = switch multCfg {
      | FactsToFive => 5
      | FactsToTen | MixedFacts => 10
      }
      let a = randomInt(0, maxFact)
      let b = randomInt(0, maxFact)
      {
        topNumber: Int.toString(a),
        operator: "x",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a * b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | DivisionFacts => {
      let _divCfg = config.thirdDivisionConfig->Option.getOr(ThirdGrade.NoDivisionRemainder)
      let divisor = randomInt(2, 12)
      let quotient = randomInt(1, 12)
      let dividend = divisor * quotient
      {
        topNumber: Int.toString(dividend),
        operator: "÷",
        bottomNumber: Int.toString(divisor),
        answer: Int.toString(quotient),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | DivideWithRemainder => {
      let divisor = randomInt(2, 9)
      let quotient = randomInt(2, 12)
      let remainder = randomInt(1, divisor - 1)
      let dividend = divisor * quotient + remainder
      {
        topNumber: Int.toString(dividend),
        operator: "÷",
        bottomNumber: Int.toString(divisor),
        answer: `${Int.toString(quotient)} R${Int.toString(remainder)}`,
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | IdentifyFractions => {
      let denom = [2, 3, 4, 6, 8]->Array.get(randomInt(0, 4))->Option.getOr(4)
      let numer = randomInt(1, denom - 1)
      let shaded = String.repeat("*", numer)
      let unshaded = String.repeat("o", denom - numer)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(numer)}/${Int.toString(denom)}`,
        isVertical: false,
        horizontalDisplay: Some(`What fraction is shaded? [${shaded}${unshaded}] = ____`),
        fractionData: None,
      }
    }

  | CompareFractions => {
      let denom = [2, 3, 4, 6, 8]->Array.get(randomInt(0, 4))->Option.getOr(4)
      let n1 = randomInt(1, denom - 1)
      let n2 = randomInt(1, denom - 1)
      let symbol = if n1 > n2 { ">" } else if n1 < n2 { "<" } else { "=" }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: symbol,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(n1)}/${Int.toString(denom)}  ____  ${Int.toString(n2)}/${Int.toString(denom)}`),
        fractionData: Some({
          left: SimpleFraction({numerator: n1, denominator: denom}),
          op: "?",
          right: SimpleFraction({numerator: n2, denominator: denom}),
          showBlank: false,
        }),
      }
    }

  | EquivalentFractions => {
      let d1 = [2, 3, 4]->Array.get(randomInt(0, 2))->Option.getOr(2)
      let n1 = randomInt(1, d1 - 1)
      let multiplier = randomInt(2, 4)
      let d2 = d1 * multiplier
      let n2 = n1 * multiplier
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(n2),
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(n1)}/${Int.toString(d1)} = ____/${Int.toString(d2)}`),
        fractionData: None,
      }
    }

  | FractionsOnNumberLine => {
      let denom = [2, 4, 8]->Array.get(randomInt(0, 2))->Option.getOr(4)
      let numer = randomInt(1, denom - 1)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(numer)}/${Int.toString(denom)}`,
        isVertical: false,
        horizontalDisplay: Some(`Place on number line (0 to 1, divided into ${Int.toString(denom)} parts): Point at mark ${Int.toString(numer)} = ____`),
        fractionData: None,
      }
    }

  | RoundToTen => {
      let num = randomInt(10, 999)
      let rounded = (num + 5) / 10 * 10
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(rounded),
        isVertical: false,
        horizontalDisplay: Some(`Round ${Int.toString(num)} to the nearest 10: ____`),
        fractionData: None,
      }
    }

  | RoundToHundred => {
      let num = randomInt(100, 999)
      let rounded = (num + 50) / 100 * 100
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(rounded),
        isVertical: false,
        horizontalDisplay: Some(`Round ${Int.toString(num)} to the nearest 100: ____`),
        fractionData: None,
      }
    }

  | CompareNumbers => {
      let a = randomInt(100, 999)
      let b = randomInt(100, 999)
      let symbol = if a > b { ">" } else if a < b { "<" } else { "=" }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: symbol,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(a)}  ____  ${Int.toString(b)}`),
        fractionData: None,
      }
    }

  | PlaceValueIdentify => {
      let num = randomInt(100, 999)
      let places = ["ones", "tens", "hundreds"]
      let placeIdx = randomInt(0, 2)
      let place = places->Array.get(placeIdx)->Option.getOr("ones")
      let divisor = Int.fromFloat(Math.pow(10.0, ~exp=Float.fromInt(placeIdx)))
      let digit = mod(num / divisor, 10)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(digit),
        isVertical: false,
        horizontalDisplay: Some(`What digit is in the ${place} place of ${Int.toString(num)}? ____`),
        fractionData: None,
      }
    }

  | TellTimeMinute => {
      let hour = randomInt(1, 12)
      let minutes = randomInt(0, 59)
      let minStr = if minutes < 10 { `0${Int.toString(minutes)}` } else { Int.toString(minutes) }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(hour)}:${minStr}`,
        isVertical: false,
        horizontalDisplay: Some(`Hour hand near ${Int.toString(hour)}, minute hand at ${Int.toString(minutes)} minutes. Time: ____`),
        fractionData: None,
      }
    }

  | ElapsedTime => {
      let startHour = randomInt(1, 10)
      let startMin = randomInt(0, 3) * 15
      let elapsedMin = randomInt(1, 4) * 15
      let endMin = startMin + elapsedMin
      let endHour = startHour + endMin / 60
      let endMinFinal = mod(endMin, 60)
      let startMinStr = if startMin < 10 { `0${Int.toString(startMin)}` } else { Int.toString(startMin) }
      let endMinStr = if endMinFinal < 10 { `0${Int.toString(endMinFinal)}` } else { Int.toString(endMinFinal) }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(endHour)}:${endMinStr}`,
        isVertical: false,
        horizontalDisplay: Some(`Start: ${Int.toString(startHour)}:${startMinStr}, ${Int.toString(elapsedMin)} minutes later = ____`),
        fractionData: None,
      }
    }
  }
}

// Problem generators for Fourth Grade
let generateFourthGradeProblem = (op: FourthGrade.operation, config: skillConfig): problem => {
  switch op {
  | Addition => {
      let arithmeticCfg = config.fourthArithmeticConfig->Option.getOr(FourthGrade.DoubleDouble)
      let ((min1, max1), (min2, max2)) = getFourthGradeDigitRanges(arithmeticCfg)
      let a = randomInt(min1, max1)
      let b = randomInt(min2, max2)
      {
        topNumber: Int.toString(a),
        operator: "+",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a + b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | Subtraction => {
      let arithmeticCfg = config.fourthArithmeticConfig->Option.getOr(FourthGrade.DoubleDouble)
      let ((min1, max1), (min2, max2)) = getFourthGradeDigitRanges(arithmeticCfg)
      let a = randomInt(min1, max1)
      let bMax = min(max2, a - 1)
      let b = if bMax >= min2 { randomInt(min2, bMax) } else { randomInt(1, a - 1) }
      {
        topNumber: Int.toString(a),
        operator: "-",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a - b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | Multiplication => {
      let arithmeticCfg = config.fourthArithmeticConfig->Option.getOr(FourthGrade.SingleSingle)
      let ((min1, max1), (min2, max2)) = switch arithmeticCfg {
      | SingleSingle => ((2, 12), (2, 12))
      | DoubleSingle => ((10, 99), (2, 9))
      | DoubleDouble => ((10, 50), (10, 50))
      | TripleDouble => ((100, 500), (10, 50))
      | TripleTriple => ((100, 300), (100, 300))
      | MixedDigits => {
          let r = randomInt(0, 2)
          switch r {
          | 0 => ((2, 12), (2, 12))
          | 1 => ((10, 99), (2, 9))
          | _ => ((10, 50), (10, 50))
          }
        }
      }
      let a = randomInt(min1, max1)
      let b = randomInt(min2, max2)
      {
        topNumber: Int.toString(a),
        operator: "×",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a * b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | Division => {
      let divCfg = config.fourthDivisionConfig->Option.getOr(FourthGrade.NoDivisionRemainder)
      let divisor = randomInt(2, 12)
      let (quotient, remainder) = switch divCfg {
      | NoDivisionRemainder => (randomInt(2, 12), 0)
      | WithRemainder => (randomInt(2, 12), randomInt(1, divisor - 1))
      | MixedDivision => {
          if Math.random() > 0.5 {
            (randomInt(2, 12), randomInt(1, divisor - 1))
          } else {
            (randomInt(2, 12), 0)
          }
        }
      }
      let dividend = divisor * quotient + remainder
      let answerStr = if remainder == 0 {
        Int.toString(quotient)
      } else {
        `${Int.toString(quotient)} R${Int.toString(remainder)}`
      }
      {
        topNumber: Int.toString(dividend),
        operator: "÷",
        bottomNumber: Int.toString(divisor),
        answer: answerStr,
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | FractionAddition => {
      let fracCfg = config.fourthFractionConfig->Option.getOr(FourthGrade.SameDenominator)
      let (d1, d2) = switch fracCfg {
      | SameDenominator => {
          let d = randomInt(2, 12)
          (d, d)
        }
      | DifferentDenominator => {
          let d1 = randomInt(2, 8)
          let d2 = randomInt(2, 8)
          if d1 == d2 { (d1, d2 + 1) } else { (d1, d2) }
        }
      | MixedDenominators => {
          if Math.random() > 0.5 {
            let d = randomInt(2, 12)
            (d, d)
          } else {
            (randomInt(2, 8), randomInt(2, 8))
          }
        }
      }
      let n1 = randomInt(1, d1 - 1)
      let n2 = randomInt(1, d2 - 1)
      let lcd = d1 * d2 / gcd(d1, d2)
      let resultNum = n1 * (lcd / d1) + n2 * (lcd / d2)
      let g = gcd(resultNum, lcd)
      let simplified = if resultNum >= lcd {
        let whole = resultNum / lcd
        let rem = mod(resultNum, lcd)
        if rem == 0 {
          Int.toString(whole)
        } else {
          let g2 = gcd(rem, lcd)
          `${Int.toString(whole)} ${Int.toString(rem / g2)}/${Int.toString(lcd / g2)}`
        }
      } else {
        `${Int.toString(resultNum / g)}/${Int.toString(lcd / g)}`
      }
      {
        topNumber: "",
        operator: "+",
        bottomNumber: "",
        answer: simplified,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(n1)}/${Int.toString(d1)} + ${Int.toString(n2)}/${Int.toString(d2)} = ____`),
        fractionData: Some({
          left: SimpleFraction({numerator: n1, denominator: d1}),
          op: "+",
          right: SimpleFraction({numerator: n2, denominator: d2}),
          showBlank: true,
        }),
      }
    }

  | FractionSubtraction => {
      let d = randomInt(3, 12)
      let n1 = randomInt(2, d - 1)
      let n2 = randomInt(1, n1 - 1)
      let resultNum = n1 - n2
      let g = gcd(resultNum, d)
      {
        topNumber: "",
        operator: "-",
        bottomNumber: "",
        answer: `${Int.toString(resultNum / g)}/${Int.toString(d / g)}`,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(n1)}/${Int.toString(d)} - ${Int.toString(n2)}/${Int.toString(d)} = ____`),
        fractionData: Some({
          left: SimpleFraction({numerator: n1, denominator: d}),
          op: "-",
          right: SimpleFraction({numerator: n2, denominator: d}),
          showBlank: true,
        }),
      }
    }

  | FractionMultiplication => {
      let d1 = randomInt(2, 10)
      let d2 = randomInt(2, 10)
      let n1 = randomInt(1, d1 - 1)
      let n2 = randomInt(1, d2 - 1)
      let resultNum = n1 * n2
      let resultDenom = d1 * d2
      let g = gcd(resultNum, resultDenom)
      {
        topNumber: "",
        operator: "×",
        bottomNumber: "",
        answer: `${Int.toString(resultNum / g)}/${Int.toString(resultDenom / g)}`,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(n1)}/${Int.toString(d1)} × ${Int.toString(n2)}/${Int.toString(d2)} = ____`),
        fractionData: Some({
          left: SimpleFraction({numerator: n1, denominator: d1}),
          op: "×",
          right: SimpleFraction({numerator: n2, denominator: d2}),
          showBlank: true,
        }),
      }
    }

  | FractionDivision => {
      let d1 = randomInt(2, 8)
      let d2 = randomInt(2, 8)
      let n1 = randomInt(1, d1 - 1)
      let n2 = randomInt(1, d2 - 1)
      let resultNum = n1 * d2
      let resultDenom = d1 * n2
      let g = gcd(resultNum, resultDenom)
      let simplified = if resultNum / g >= resultDenom / g {
        let whole = resultNum / g / (resultDenom / g)
        let rem = mod(resultNum / g, resultDenom / g)
        if rem == 0 {
          Int.toString(whole)
        } else {
          `${Int.toString(whole)} ${Int.toString(rem)}/${Int.toString(resultDenom / g)}`
        }
      } else {
        `${Int.toString(resultNum / g)}/${Int.toString(resultDenom / g)}`
      }
      {
        topNumber: "",
        operator: "÷",
        bottomNumber: "",
        answer: simplified,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(n1)}/${Int.toString(d1)} ÷ ${Int.toString(n2)}/${Int.toString(d2)} = ____`),
        fractionData: Some({
          left: SimpleFraction({numerator: n1, denominator: d1}),
          op: "÷",
          right: SimpleFraction({numerator: n2, denominator: d2}),
          showBlank: true,
        }),
      }
    }

  | FractionComparison => {
      let d1 = randomInt(2, 10)
      let d2 = randomInt(2, 10)
      let n1 = randomInt(1, d1 - 1)
      let n2 = randomInt(1, d2 - 1)
      let val1 = Float.fromInt(n1) /. Float.fromInt(d1)
      let val2 = Float.fromInt(n2) /. Float.fromInt(d2)
      let symbol = if val1 > val2 { ">" } else if val1 < val2 { "<" } else { "=" }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: symbol,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(n1)}/${Int.toString(d1)}  ____  ${Int.toString(n2)}/${Int.toString(d2)}`),
        fractionData: Some({
          left: SimpleFraction({numerator: n1, denominator: d1}),
          op: "?",
          right: SimpleFraction({numerator: n2, denominator: d2}),
          showBlank: false, // comparison - blank goes between operands
        }),
      }
    }

  | FractionEquivalence => {
      let d1 = randomInt(2, 6)
      let n1 = randomInt(1, d1 - 1)
      let multiplier = randomInt(2, 4)
      let d2 = d1 * multiplier
      let n2 = n1 * multiplier
      {
        topNumber: "",
        operator: "=",
        bottomNumber: "",
        answer: Int.toString(n2),
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(n1)}/${Int.toString(d1)} = ____/${Int.toString(d2)}`),
        fractionData: None, // Special case - not standard fraction operation
      }
    }

  | DecimalAddition => {
      let decCfg = config.fourthDecimalConfig->Option.getOr(FourthGrade.Tenths)
      let (maxVal, decimals) = switch decCfg {
      | Tenths => (50.0, 1)
      | Hundredths => (50.0, 2)
      | MixedDecimals => if Math.random() > 0.5 { (50.0, 1) } else { (50.0, 2) }
      }
      let multiplier = Math.pow(10.0, ~exp=Float.fromInt(decimals))
      let a = Math.floor(Math.random() *. maxVal *. multiplier) /. multiplier
      let b = Math.floor(Math.random() *. maxVal *. multiplier) /. multiplier
      {
        topNumber: Float.toFixed(a, ~digits=decimals),
        operator: "+",
        bottomNumber: Float.toFixed(b, ~digits=decimals),
        answer: Float.toFixed(a +. b, ~digits=decimals),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | DecimalSubtraction => {
      let decCfg = config.fourthDecimalConfig->Option.getOr(FourthGrade.Tenths)
      let (maxVal, decimals) = switch decCfg {
      | Tenths => (50.0, 1)
      | Hundredths => (50.0, 2)
      | MixedDecimals => if Math.random() > 0.5 { (50.0, 1) } else { (50.0, 2) }
      }
      let multiplier = Math.pow(10.0, ~exp=Float.fromInt(decimals))
      let a = Math.floor(Math.random() *. maxVal *. multiplier) /. multiplier
      let b = Math.floor(Math.random() *. a *. multiplier) /. multiplier
      {
        topNumber: Float.toFixed(a, ~digits=decimals),
        operator: "-",
        bottomNumber: Float.toFixed(b, ~digits=decimals),
        answer: Float.toFixed(a -. b, ~digits=decimals),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | DecimalMultiplication => {
      let a = Float.fromInt(randomInt(11, 99)) /. 10.0
      let b = randomInt(2, 9)
      {
        topNumber: Float.toFixed(a, ~digits=1),
        operator: "×",
        bottomNumber: Int.toString(b),
        answer: Float.toFixed(a *. Float.fromInt(b), ~digits=1),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | DecimalComparison => {
      let a = Float.fromInt(randomInt(10, 99)) /. 10.0
      let b = Float.fromInt(randomInt(10, 99)) /. 10.0
      let symbol = if a > b { ">" } else if a < b { "<" } else { "=" }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: symbol,
        isVertical: false,
        horizontalDisplay: Some(`${Float.toFixed(a, ~digits=1)}  ____  ${Float.toFixed(b, ~digits=1)}`),
        fractionData: None,
      }
    }

  | MixedNumberAddition => {
      let d = randomInt(2, 8)
      let w1 = randomInt(1, 5)
      let w2 = randomInt(1, 5)
      let n1 = randomInt(1, d - 1)
      let n2 = randomInt(1, d - 1)
      let totalNum = (w1 + w2) * d + n1 + n2
      let wholeResult = totalNum / d
      let numResult = mod(totalNum, d)
      let g = gcd(numResult, d)
      let answer = if numResult == 0 {
        Int.toString(wholeResult)
      } else {
        `${Int.toString(wholeResult)} ${Int.toString(numResult / g)}/${Int.toString(d / g)}`
      }
      {
        topNumber: "",
        operator: "+",
        bottomNumber: "",
        answer: answer,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(w1)} ${Int.toString(n1)}/${Int.toString(d)} + ${Int.toString(w2)} ${Int.toString(n2)}/${Int.toString(d)} = ____`),
        fractionData: Some({
          left: MixedFraction({whole: w1, num: n1, denom: d}),
          op: "+",
          right: MixedFraction({whole: w2, num: n2, denom: d}),
          showBlank: true,
        }),
      }
    }

  | MixedNumberSubtraction => {
      let d = randomInt(2, 8)
      let w1 = randomInt(3, 8)
      let w2 = randomInt(1, w1 - 1)
      let n1 = randomInt(1, d - 1)
      let n2 = randomInt(1, d - 1)
      let total1 = w1 * d + n1
      let total2 = w2 * d + n2
      let diff = total1 - total2
      let wholeResult = diff / d
      let numResult = mod(diff, d)
      let g = gcd(numResult, d)
      let answer = if numResult == 0 {
        Int.toString(wholeResult)
      } else if wholeResult == 0 {
        `${Int.toString(numResult / g)}/${Int.toString(d / g)}`
      } else {
        `${Int.toString(wholeResult)} ${Int.toString(numResult / g)}/${Int.toString(d / g)}`
      }
      {
        topNumber: "",
        operator: "-",
        bottomNumber: "",
        answer: answer,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(w1)} ${Int.toString(n1)}/${Int.toString(d)} - ${Int.toString(w2)} ${Int.toString(n2)}/${Int.toString(d)} = ____`),
        fractionData: Some({
          left: MixedFraction({whole: w1, num: n1, denom: d}),
          op: "-",
          right: MixedFraction({whole: w2, num: n2, denom: d}),
          showBlank: true,
        }),
      }
    }

  | MixedToImproper => {
      let d = randomInt(2, 8)
      let w = randomInt(1, 6)
      let n = randomInt(1, d - 1)
      let improperNum = w * d + n
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(improperNum)}/${Int.toString(d)}`,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(w)} ${Int.toString(n)}/${Int.toString(d)} = ____`),
        fractionData: None, // Conversion - not standard operation
      }
    }

  | ImproperToMixed => {
      let d = randomInt(2, 8)
      let w = randomInt(1, 6)
      let n = randomInt(1, d - 1)
      let improperNum = w * d + n
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(w)} ${Int.toString(n)}/${Int.toString(d)}`,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(improperNum)}/${Int.toString(d)} = ____`),
        fractionData: None, // Conversion - not standard operation
      }
    }

  | PlaceValueIdentify => {
      let num = randomInt(1000, 99999)
      let places = ["ones", "tens", "hundreds", "thousands", "ten thousands"]
      let placeIdx = randomInt(0, 4)
      let place = places->Array.getUnsafe(placeIdx)
      let divisor = Int.fromFloat(Math.pow(10.0, ~exp=Float.fromInt(placeIdx)))
      let digit = mod(num / divisor, 10)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(digit),
        isVertical: false,
        horizontalDisplay: Some(`What digit is in the ${place} place of ${Int.toString(num)}? ____`),
        fractionData: None,
      }
    }

  | Rounding => {
      let roundCfg = config.fourthRoundingConfig->Option.getOr(FourthGrade.RoundToTen)
      let (num, place, placeVal) = switch roundCfg {
      | RoundToTen => (randomInt(10, 999), "ten", 10)
      | RoundToHundred => (randomInt(100, 9999), "hundred", 100)
      | RoundToThousand => (randomInt(1000, 99999), "thousand", 1000)
      | MixedRounding => {
          let choices = [(randomInt(10, 999), "ten", 10), (randomInt(100, 9999), "hundred", 100), (randomInt(1000, 99999), "thousand", 1000)]
          choices->Array.getUnsafe(randomInt(0, 2))
        }
      }
      let rounded = (num + placeVal / 2) / placeVal * placeVal
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(rounded),
        isVertical: false,
        horizontalDisplay: Some(`Round ${Int.toString(num)} to the nearest ${place}: ____`),
        fractionData: None,
      }
    }

  | FindFactors => {
      let factorsCfg = config.fourthFactorsConfig->Option.getOr(FourthGrade.SmallNumbers)
      let maxNum = switch factorsCfg {
      | SmallNumbers => 50
      | MediumNumbers => 100
      | LargeNumbers => 200
      }
      let num = randomInt(12, maxNum)
      // Find all factors
      let factors = []
      for i in 1 to num {
        if mod(num, i) == 0 {
          let _ = factors->Array.push(i)
        }
      }
      let factorStr = factors->Array.map(n => Int.toString(n))->Array.joinUnsafe(", ")
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: factorStr,
        isVertical: false,
        horizontalDisplay: Some(`Find all factors of ${Int.toString(num)}: ____`),
        fractionData: None,
      }
    }

  | GCF => {
      let factorsCfg = config.fourthFactorsConfig->Option.getOr(FourthGrade.SmallNumbers)
      let maxNum = switch factorsCfg {
      | SmallNumbers => 50
      | MediumNumbers => 100
      | LargeNumbers => 200
      }
      let a = randomInt(12, maxNum)
      let b = randomInt(12, maxNum)
      let gcfVal = gcd(a, b)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(gcfVal),
        isVertical: false,
        horizontalDisplay: Some(`GCF of ${Int.toString(a)} and ${Int.toString(b)}: ____`),
        fractionData: None,
      }
    }

  | LCM => {
      let factorsCfg = config.fourthFactorsConfig->Option.getOr(FourthGrade.SmallNumbers)
      let maxNum = switch factorsCfg {
      | SmallNumbers => 20
      | MediumNumbers => 30
      | LargeNumbers => 50
      }
      let a = randomInt(2, maxNum)
      let b = randomInt(2, maxNum)
      let lcmVal = a * b / gcd(a, b)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(lcmVal),
        isVertical: false,
        horizontalDisplay: Some(`LCM of ${Int.toString(a)} and ${Int.toString(b)}: ____`),
        fractionData: None,
      }
    }

  | PrimeComposite => {
      // Generate a mix of prime and composite numbers
      let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
      let composites = [4, 6, 8, 9, 10, 12, 14, 15, 16, 18, 20, 21, 22, 24, 25, 26, 27, 28, 30, 32, 33, 34, 35, 36, 38, 39, 40, 42, 44, 45, 46, 48, 49, 50]
      let isPrime = Math.random() > 0.5
      let num = if isPrime {
        primes->Array.getUnsafe(randomInt(0, Array.length(primes) - 1))
      } else {
        composites->Array.getUnsafe(randomInt(0, Array.length(composites) - 1))
      }
      let answer = if isPrime { "Prime" } else { "Composite" }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: answer,
        isVertical: false,
        horizontalDisplay: Some(`Is ${Int.toString(num)} prime or composite? ____`),
        fractionData: None,
      }
    }

  | LengthConversion => {
      let measCfg = config.fourthMeasurementConfig->Option.getOr(FourthGrade.CustomaryUnits)
      switch measCfg {
      | CustomaryUnits | MixedUnits => {
          let conversionType = randomInt(0, 2)
          switch conversionType {
          | 0 => {
              // feet to inches
              let feet = randomInt(1, 12)
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(feet * 12),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(feet)} feet = ____ inches`),
                fractionData: None,
              }
            }
          | 1 => {
              // yards to feet
              let yards = randomInt(1, 10)
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(yards * 3),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(yards)} yards = ____ feet`),
                fractionData: None,
              }
            }
          | _ => {
              // inches to feet
              let feet = randomInt(1, 10)
              let inches = feet * 12
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(feet),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(inches)} inches = ____ feet`),
                fractionData: None,
              }
            }
          }
        }
      | MetricUnits => {
          let conversionType = randomInt(0, 2)
          switch conversionType {
          | 0 => {
              // meters to centimeters
              let meters = randomInt(1, 10)
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(meters * 100),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(meters)} meters = ____ centimeters`),
                fractionData: None,
              }
            }
          | 1 => {
              // kilometers to meters
              let km = randomInt(1, 10)
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(km * 1000),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(km)} kilometers = ____ meters`),
                fractionData: None,
              }
            }
          | _ => {
              // centimeters to meters
              let meters = randomInt(1, 10)
              let cm = meters * 100
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(meters),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(cm)} centimeters = ____ meters`),
                fractionData: None,
              }
            }
          }
        }
      }
    }

  | WeightConversion => {
      let measCfg = config.fourthMeasurementConfig->Option.getOr(FourthGrade.CustomaryUnits)
      switch measCfg {
      | CustomaryUnits | MixedUnits => {
          let conversionType = randomInt(0, 1)
          switch conversionType {
          | 0 => {
              // pounds to ounces
              let pounds = randomInt(1, 10)
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(pounds * 16),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(pounds)} pounds = ____ ounces`),
                fractionData: None,
              }
            }
          | _ => {
              // ounces to pounds
              let pounds = randomInt(1, 10)
              let ounces = pounds * 16
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(pounds),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(ounces)} ounces = ____ pounds`),
                fractionData: None,
              }
            }
          }
        }
      | MetricUnits => {
          let conversionType = randomInt(0, 1)
          switch conversionType {
          | 0 => {
              // kilograms to grams
              let kg = randomInt(1, 10)
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(kg * 1000),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(kg)} kilograms = ____ grams`),
                fractionData: None,
              }
            }
          | _ => {
              // grams to kilograms
              let kg = randomInt(1, 10)
              let grams = kg * 1000
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(kg),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(grams)} grams = ____ kilograms`),
                fractionData: None,
              }
            }
          }
        }
      }
    }

  | CapacityConversion => {
      let measCfg = config.fourthMeasurementConfig->Option.getOr(FourthGrade.CustomaryUnits)
      switch measCfg {
      | CustomaryUnits | MixedUnits => {
          let conversionType = randomInt(0, 3)
          switch conversionType {
          | 0 => {
              // cups to pints
              let pints = randomInt(1, 8)
              let cups = pints * 2
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(pints),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(cups)} cups = ____ pints`),
                fractionData: None,
              }
            }
          | 1 => {
              // pints to quarts
              let quarts = randomInt(1, 8)
              let pints = quarts * 2
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(quarts),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(pints)} pints = ____ quarts`),
                fractionData: None,
              }
            }
          | 2 => {
              // quarts to gallons
              let gallons = randomInt(1, 5)
              let quarts = gallons * 4
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(gallons),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(quarts)} quarts = ____ gallons`),
                fractionData: None,
              }
            }
          | _ => {
              // gallons to quarts
              let gallons = randomInt(1, 5)
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(gallons * 4),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(gallons)} gallons = ____ quarts`),
                fractionData: None,
              }
            }
          }
        }
      | MetricUnits => {
          let conversionType = randomInt(0, 1)
          switch conversionType {
          | 0 => {
              // liters to milliliters
              let liters = randomInt(1, 10)
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(liters * 1000),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(liters)} liters = ____ milliliters`),
                fractionData: None,
              }
            }
          | _ => {
              // milliliters to liters
              let liters = randomInt(1, 10)
              let ml = liters * 1000
              {
                topNumber: "",
                operator: "",
                bottomNumber: "",
                answer: Int.toString(liters),
                isVertical: false,
                horizontalDisplay: Some(`${Int.toString(ml)} milliliters = ____ liters`),
                fractionData: None,
              }
            }
          }
        }
      }
    }

  | TimeConversion => {
      let conversionType = randomInt(0, 3)
      switch conversionType {
      | 0 => {
          // minutes to seconds
          let minutes = randomInt(1, 10)
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: Int.toString(minutes * 60),
            isVertical: false,
            horizontalDisplay: Some(`${Int.toString(minutes)} minutes = ____ seconds`),
            fractionData: None,
          }
        }
      | 1 => {
          // hours to minutes
          let hours = randomInt(1, 12)
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: Int.toString(hours * 60),
            isVertical: false,
            horizontalDisplay: Some(`${Int.toString(hours)} hours = ____ minutes`),
            fractionData: None,
          }
        }
      | 2 => {
          // seconds to minutes
          let minutes = randomInt(1, 10)
          let seconds = minutes * 60
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: Int.toString(minutes),
            isVertical: false,
            horizontalDisplay: Some(`${Int.toString(seconds)} seconds = ____ minutes`),
            fractionData: None,
          }
        }
      | _ => {
          // minutes to hours
          let hours = randomInt(1, 12)
          let minutes = hours * 60
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: Int.toString(hours),
            isVertical: false,
            horizontalDisplay: Some(`${Int.toString(minutes)} minutes = ____ hours`),
            fractionData: None,
          }
        }
      }
    }
  }
}

// Problem generators for Fifth Grade (delegates to Fourth Grade for shared operations)
let generateFifthGradeProblem = (op: FifthGrade.operation, config: skillConfig): problem => {
  switch op {
  // Basic arithmetic - similar to Fourth Grade but use Fifth Grade configs
  | Addition => {
      let arithmeticCfg = config.fifthArithmeticConfig->Option.getOr(FifthGrade.DoubleDouble)
      let ((min1, max1), (min2, max2)) = getFifthGradeDigitRanges(arithmeticCfg)
      let a = randomInt(min1, max1)
      let b = randomInt(min2, max2)
      {
        topNumber: Int.toString(a),
        operator: "+",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a + b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | Subtraction => {
      let arithmeticCfg = config.fifthArithmeticConfig->Option.getOr(FifthGrade.DoubleDouble)
      let ((min1, max1), (min2, max2)) = getFifthGradeDigitRanges(arithmeticCfg)
      let a = randomInt(min1, max1)
      let bMax = min(max2, a - 1)
      let b = if bMax >= min2 { randomInt(min2, bMax) } else { randomInt(1, a - 1) }
      {
        topNumber: Int.toString(a),
        operator: "-",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a - b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | Multiplication => {
      let arithmeticCfg = config.fifthArithmeticConfig->Option.getOr(FifthGrade.SingleSingle)
      let ((min1, max1), (min2, max2)) = switch arithmeticCfg {
      | SingleSingle => ((2, 12), (2, 12))
      | DoubleSingle => ((10, 99), (2, 9))
      | DoubleDouble => ((10, 50), (10, 50))
      | TripleDouble => ((100, 500), (10, 50))
      | TripleTriple => ((100, 300), (100, 300))
      | MixedDigits => {
          let r = randomInt(0, 2)
          switch r {
          | 0 => ((2, 12), (2, 12))
          | 1 => ((10, 99), (2, 9))
          | _ => ((10, 50), (10, 50))
          }
        }
      }
      let a = randomInt(min1, max1)
      let b = randomInt(min2, max2)
      {
        topNumber: Int.toString(a),
        operator: "×",
        bottomNumber: Int.toString(b),
        answer: Int.toString(a * b),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | Division => {
      let divCfg = config.fifthDivisionConfig->Option.getOr(FifthGrade.NoDivisionRemainder)
      let divisor = randomInt(2, 12)
      let (quotient, remainder) = switch divCfg {
      | NoDivisionRemainder => (randomInt(2, 12), 0)
      | WithRemainder => (randomInt(2, 12), randomInt(1, divisor - 1))
      | MixedDivision => if Math.random() > 0.5 { (randomInt(2, 12), randomInt(1, divisor - 1)) } else { (randomInt(2, 12), 0) }
      }
      let dividend = divisor * quotient + remainder
      let answerStr = if remainder == 0 { Int.toString(quotient) } else { `${Int.toString(quotient)} R${Int.toString(remainder)}` }
      {
        topNumber: Int.toString(dividend),
        operator: "÷",
        bottomNumber: Int.toString(divisor),
        answer: answerStr,
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  // Fraction operations
  | FractionAddition | FractionSubtraction | FractionMultiplication | FractionDivision | FractionComparison | FractionEquivalence => {
      // Reuse Fourth Grade fraction logic
      let fourthOp = switch op {
      | FractionAddition => FourthGrade.FractionAddition
      | FractionSubtraction => FourthGrade.FractionSubtraction
      | FractionMultiplication => FourthGrade.FractionMultiplication
      | FractionDivision => FourthGrade.FractionDivision
      | FractionComparison => FourthGrade.FractionComparison
      | FractionEquivalence => FourthGrade.FractionEquivalence
      | _ => FourthGrade.FractionAddition // fallback
      }
      generateFourthGradeProblem(fourthOp, config)
    }

  // Decimal operations
  | DecimalAddition => {
      let decCfg = config.fifthDecimalConfig->Option.getOr(FifthGrade.Tenths)
      let (maxVal, decimals) = switch decCfg {
      | Tenths => (50.0, 1)
      | Hundredths => (50.0, 2)
      | Thousandths => (50.0, 3)
      | MixedDecimals => {
          let r = randomInt(1, 3)
          (50.0, r)
        }
      }
      let multiplier = Math.pow(10.0, ~exp=Float.fromInt(decimals))
      let a = Math.floor(Math.random() *. maxVal *. multiplier) /. multiplier
      let b = Math.floor(Math.random() *. maxVal *. multiplier) /. multiplier
      {
        topNumber: Float.toFixed(a, ~digits=decimals),
        operator: "+",
        bottomNumber: Float.toFixed(b, ~digits=decimals),
        answer: Float.toFixed(a +. b, ~digits=decimals),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | DecimalSubtraction => {
      let decCfg = config.fifthDecimalConfig->Option.getOr(FifthGrade.Tenths)
      let (maxVal, decimals) = switch decCfg {
      | Tenths => (50.0, 1)
      | Hundredths => (50.0, 2)
      | Thousandths => (50.0, 3)
      | MixedDecimals => (50.0, randomInt(1, 3))
      }
      let multiplier = Math.pow(10.0, ~exp=Float.fromInt(decimals))
      let a = Math.floor(Math.random() *. maxVal *. multiplier) /. multiplier
      let b = Math.floor(Math.random() *. a *. multiplier) /. multiplier
      {
        topNumber: Float.toFixed(a, ~digits=decimals),
        operator: "-",
        bottomNumber: Float.toFixed(b, ~digits=decimals),
        answer: Float.toFixed(a -. b, ~digits=decimals),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | DecimalMultiplication => {
      let a = Float.fromInt(randomInt(11, 99)) /. 10.0
      let b = randomInt(2, 9)
      {
        topNumber: Float.toFixed(a, ~digits=1),
        operator: "×",
        bottomNumber: Int.toString(b),
        answer: Float.toFixed(a *. Float.fromInt(b), ~digits=1),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | DecimalDivision => {
      let divisor = randomInt(2, 9)
      let quotient = Float.fromInt(randomInt(11, 99)) /. 10.0
      let dividend = quotient *. Float.fromInt(divisor)
      {
        topNumber: Float.toFixed(dividend, ~digits=1),
        operator: "÷",
        bottomNumber: Int.toString(divisor),
        answer: Float.toFixed(quotient, ~digits=1),
        isVertical: true,
        horizontalDisplay: None,
        fractionData: None,
      }
    }

  | DecimalComparison => {
      let a = Float.fromInt(randomInt(10, 99)) /. 10.0
      let b = Float.fromInt(randomInt(10, 99)) /. 10.0
      let symbol = if a > b { ">" } else if a < b { "<" } else { "=" }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: symbol,
        isVertical: false,
        horizontalDisplay: Some(`${Float.toFixed(a, ~digits=1)}  ____  ${Float.toFixed(b, ~digits=1)}`),
        fractionData: None,
      }
    }

  // Mixed Numbers
  | MixedNumberAddition | MixedNumberSubtraction | MixedToImproper | ImproperToMixed => {
      let fourthOp = switch op {
      | MixedNumberAddition => FourthGrade.MixedNumberAddition
      | MixedNumberSubtraction => FourthGrade.MixedNumberSubtraction
      | MixedToImproper => FourthGrade.MixedToImproper
      | ImproperToMixed => FourthGrade.ImproperToMixed
      | _ => FourthGrade.MixedNumberAddition
      }
      generateFourthGradeProblem(fourthOp, config)
    }

  // Place Value
  | PlaceValueIdentify => generateFourthGradeProblem(FourthGrade.PlaceValueIdentify, config)

  | Rounding => {
      let roundCfg = config.fifthRoundingConfig->Option.getOr(FifthGrade.RoundToTen)
      let (num, place, placeVal) = switch roundCfg {
      | RoundToTen => (randomInt(10, 999), "ten", 10)
      | RoundToHundred => (randomInt(100, 9999), "hundred", 100)
      | RoundToThousand => (randomInt(1000, 99999), "thousand", 1000)
      | RoundToTenThousand => (randomInt(10000, 999999), "ten thousand", 10000)
      | MixedRounding => {
          let choices = [(randomInt(10, 999), "ten", 10), (randomInt(100, 9999), "hundred", 100), (randomInt(1000, 99999), "thousand", 1000)]
          choices->Array.getUnsafe(randomInt(0, 2))
        }
      }
      let rounded = (num + placeVal / 2) / placeVal * placeVal
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(rounded),
        isVertical: false,
        horizontalDisplay: Some(`Round ${Int.toString(num)} to the nearest ${place}: ____`),
        fractionData: None,
      }
    }

  // Integers
  | IntegerAddition => {
      let intCfg = config.fifthIntegerConfig->Option.getOr(FifthGrade.SmallIntegers)
      let range = switch intCfg {
      | SmallIntegers => 10
      | MediumIntegers => 50
      | LargeIntegers => 100
      | MixedIntegers => [10, 50, 100]->Array.getUnsafe(randomInt(0, 2))
      }
      let a = randomInt(-range, range)
      let b = randomInt(-range, range)
      let aStr = if a < 0 { `(${Int.toString(a)})` } else { Int.toString(a) }
      let bStr = if b < 0 { `(${Int.toString(b)})` } else { Int.toString(b) }
      {
        topNumber: "",
        operator: "+",
        bottomNumber: "",
        answer: Int.toString(a + b),
        isVertical: false,
        horizontalDisplay: Some(`${aStr} + ${bStr} = ____`),
        fractionData: None,
      }
    }

  | IntegerSubtraction => {
      let intCfg = config.fifthIntegerConfig->Option.getOr(FifthGrade.SmallIntegers)
      let range = switch intCfg {
      | SmallIntegers => 10
      | MediumIntegers => 50
      | LargeIntegers => 100
      | MixedIntegers => [10, 50, 100]->Array.getUnsafe(randomInt(0, 2))
      }
      let a = randomInt(-range, range)
      let b = randomInt(-range, range)
      let aStr = if a < 0 { `(${Int.toString(a)})` } else { Int.toString(a) }
      let bStr = if b < 0 { `(${Int.toString(b)})` } else { Int.toString(b) }
      {
        topNumber: "",
        operator: "-",
        bottomNumber: "",
        answer: Int.toString(a - b),
        isVertical: false,
        horizontalDisplay: Some(`${aStr} - ${bStr} = ____`),
        fractionData: None,
      }
    }

  | IntegerMultiplication => {
      let intCfg = config.fifthIntegerConfig->Option.getOr(FifthGrade.SmallIntegers)
      let range = switch intCfg {
      | SmallIntegers => 10
      | MediumIntegers => 12
      | LargeIntegers => 15
      | MixedIntegers => [10, 12, 15]->Array.getUnsafe(randomInt(0, 2))
      }
      let a = randomInt(-range, range)
      let b = randomInt(-range, range)
      let aStr = if a < 0 { `(${Int.toString(a)})` } else { Int.toString(a) }
      let bStr = if b < 0 { `(${Int.toString(b)})` } else { Int.toString(b) }
      {
        topNumber: "",
        operator: "×",
        bottomNumber: "",
        answer: Int.toString(a * b),
        isVertical: false,
        horizontalDisplay: Some(`${aStr} × ${bStr} = ____`),
        fractionData: None,
      }
    }

  | IntegerComparison => {
      let a = randomInt(-50, 50)
      let b = randomInt(-50, 50)
      let symbol = if a > b { ">" } else if a < b { "<" } else { "=" }
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: symbol,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(a)}  ____  ${Int.toString(b)}`),
        fractionData: None,
      }
    }

  // Exponents
  | ExponentEvaluate => {
      let expCfg = config.fifthExponentConfig->Option.getOr(FifthGrade.SmallBases)
      let base = switch expCfg {
      | SmallBases => randomInt(2, 5)
      | MediumBases => randomInt(2, 10)
      | MixedExponents => randomInt(2, 10)
      }
      let exp = randomInt(2, 3)
      let result = Int.fromFloat(Math.pow(Float.fromInt(base), ~exp=Float.fromInt(exp)))
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(result),
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(base)}^${Int.toString(exp)} = ____`),
        fractionData: None,
      }
    }

  | ExponentMultiply => {
      let base = randomInt(2, 5)
      let exp1 = randomInt(1, 3)
      let exp2 = randomInt(1, 3)
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: `${Int.toString(base)}^${Int.toString(exp1 + exp2)}`,
        isVertical: false,
        horizontalDisplay: Some(`${Int.toString(base)}^${Int.toString(exp1)} × ${Int.toString(base)}^${Int.toString(exp2)} = ____`),
        fractionData: None,
      }
    }

  // Order of Operations
  | OrderOfOperationsBasic => {
      let oopCfg = config.fifthOrderOfOperationsConfig->Option.getOr(FifthGrade.TwoOperations)
      switch oopCfg {
      | TwoOperations | MixedComplexity => {
          // Generate: a + b × c or a × b + c
          let a = randomInt(2, 10)
          let b = randomInt(2, 10)
          let c = randomInt(2, 10)
          let useMultFirst = Math.random() > 0.5
          if useMultFirst {
            // a × b + c
            let result = a * b + c
            {
              topNumber: "",
              operator: "",
              bottomNumber: "",
              answer: Int.toString(result),
              isVertical: false,
              horizontalDisplay: Some(`${Int.toString(a)} × ${Int.toString(b)} + ${Int.toString(c)} = ____`),
              fractionData: None,
            }
          } else {
            // a + b × c
            let result = a + b * c
            {
              topNumber: "",
              operator: "",
              bottomNumber: "",
              answer: Int.toString(result),
              isVertical: false,
              horizontalDisplay: Some(`${Int.toString(a)} + ${Int.toString(b)} × ${Int.toString(c)} = ____`),
              fractionData: None,
            }
          }
        }
      | ThreeOperations => {
          // Generate: a + b × c - d
          let a = randomInt(2, 10)
          let b = randomInt(2, 5)
          let c = randomInt(2, 5)
          let d = randomInt(1, 5)
          let result = a + b * c - d
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: Int.toString(result),
            isVertical: false,
            horizontalDisplay: Some(`${Int.toString(a)} + ${Int.toString(b)} × ${Int.toString(c)} - ${Int.toString(d)} = ____`),
            fractionData: None,
          }
        }
      | WithParentheses => {
          // Generate: (a + b) × c
          let a = randomInt(2, 10)
          let b = randomInt(2, 10)
          let c = randomInt(2, 5)
          let result = (a + b) * c
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: Int.toString(result),
            isVertical: false,
            horizontalDisplay: Some(`(${Int.toString(a)} + ${Int.toString(b)}) × ${Int.toString(c)} = ____`),
            fractionData: None,
          }
        }
      }
    }

  | OrderOfOperationsParentheses => {
      let oopCfg = config.fifthOrderOfOperationsConfig->Option.getOr(FifthGrade.WithParentheses)
      let problemType = switch oopCfg {
      | MixedComplexity => randomInt(0, 2)
      | _ => randomInt(0, 2)
      }
      switch problemType {
      | 0 => {
          // (a + b) × c
          let a = randomInt(2, 10)
          let b = randomInt(2, 10)
          let c = randomInt(2, 5)
          let result = (a + b) * c
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: Int.toString(result),
            isVertical: false,
            horizontalDisplay: Some(`(${Int.toString(a)} + ${Int.toString(b)}) × ${Int.toString(c)} = ____`),
            fractionData: None,
          }
        }
      | 1 => {
          // a × (b - c)
          let a = randomInt(2, 5)
          let b = randomInt(6, 12)
          let c = randomInt(1, 5)
          let result = a * (b - c)
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: Int.toString(result),
            isVertical: false,
            horizontalDisplay: Some(`${Int.toString(a)} × (${Int.toString(b)} - ${Int.toString(c)}) = ____`),
            fractionData: None,
          }
        }
      | _ => {
          // (a + b) × (c + d)
          let a = randomInt(2, 5)
          let b = randomInt(2, 5)
          let c = randomInt(2, 5)
          let d = randomInt(2, 5)
          let result = (a + b) * (c + d)
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: Int.toString(result),
            isVertical: false,
            horizontalDisplay: Some(`(${Int.toString(a)} + ${Int.toString(b)}) × (${Int.toString(c)} + ${Int.toString(d)}) = ____`),
            fractionData: None,
          }
        }
      }
    }

  | OrderOfOperationsMixed => {
      // Mixed complexity - randomly choose problem type
      let problemType = randomInt(0, 4)
      switch problemType {
      | 0 => {
          // a + b × c
          let a = randomInt(2, 10)
          let b = randomInt(2, 10)
          let c = randomInt(2, 10)
          let result = a + b * c
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: Int.toString(result),
            isVertical: false,
            horizontalDisplay: Some(`${Int.toString(a)} + ${Int.toString(b)} × ${Int.toString(c)} = ____`),
            fractionData: None,
          }
        }
      | 1 => {
          // a × b - c
          let a = randomInt(2, 10)
          let b = randomInt(2, 10)
          let c = randomInt(1, 10)
          let result = a * b - c
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: Int.toString(result),
            isVertical: false,
            horizontalDisplay: Some(`${Int.toString(a)} × ${Int.toString(b)} - ${Int.toString(c)} = ____`),
            fractionData: None,
          }
        }
      | 2 => {
          // (a + b) × c
          let a = randomInt(2, 10)
          let b = randomInt(2, 10)
          let c = randomInt(2, 5)
          let result = (a + b) * c
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: Int.toString(result),
            isVertical: false,
            horizontalDisplay: Some(`(${Int.toString(a)} + ${Int.toString(b)}) × ${Int.toString(c)} = ____`),
            fractionData: None,
          }
        }
      | 3 => {
          // a + b × c - d
          let a = randomInt(2, 10)
          let b = randomInt(2, 5)
          let c = randomInt(2, 5)
          let d = randomInt(1, 5)
          let result = a + b * c - d
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: Int.toString(result),
            isVertical: false,
            horizontalDisplay: Some(`${Int.toString(a)} + ${Int.toString(b)} × ${Int.toString(c)} - ${Int.toString(d)} = ____`),
            fractionData: None,
          }
        }
      | _ => {
          // a × b + c × d
          let a = randomInt(2, 5)
          let b = randomInt(2, 5)
          let c = randomInt(2, 5)
          let d = randomInt(2, 5)
          let result = a * b + c * d
          {
            topNumber: "",
            operator: "",
            bottomNumber: "",
            answer: Int.toString(result),
            isVertical: false,
            horizontalDisplay: Some(`${Int.toString(a)} × ${Int.toString(b)} + ${Int.toString(c)} × ${Int.toString(d)} = ____`),
            fractionData: None,
          }
        }
      }
    }

  // Volume
  | VolumeRectangularPrism => {
      let volCfg = config.fifthVolumeConfig->Option.getOr(FifthGrade.SmallDimensions)
      let maxDim = switch volCfg {
      | SmallDimensions => 10
      | MediumDimensions => 20
      | LargeDimensions => 50
      }
      let length = randomInt(2, maxDim)
      let width = randomInt(2, maxDim)
      let height = randomInt(2, maxDim)
      let volume = length * width * height
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(volume),
        isVertical: false,
        horizontalDisplay: Some(`Find the volume of a rectangular prism with length ${Int.toString(length)}, width ${Int.toString(width)}, and height ${Int.toString(height)}: ____ cubic units`),
        fractionData: None,
      }
    }

  | VolumeCube => {
      let volCfg = config.fifthVolumeConfig->Option.getOr(FifthGrade.SmallDimensions)
      let maxDim = switch volCfg {
      | SmallDimensions => 10
      | MediumDimensions => 15
      | LargeDimensions => 25
      }
      let side = randomInt(2, maxDim)
      let volume = side * side * side
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(volume),
        isVertical: false,
        horizontalDisplay: Some(`Find the volume of a cube with side length ${Int.toString(side)}: ____ cubic units`),
        fractionData: None,
      }
    }

  | VolumeComposite => {
      // Two rectangular prisms stacked or side by side
      let volCfg = config.fifthVolumeConfig->Option.getOr(FifthGrade.SmallDimensions)
      let maxDim = switch volCfg {
      | SmallDimensions => 8
      | MediumDimensions => 12
      | LargeDimensions => 20
      }
      // First prism
      let l1 = randomInt(2, maxDim)
      let w1 = randomInt(2, maxDim)
      let h1 = randomInt(2, maxDim)
      // Second prism
      let l2 = randomInt(2, maxDim)
      let w2 = randomInt(2, maxDim)
      let h2 = randomInt(2, maxDim)
      let vol1 = l1 * w1 * h1
      let vol2 = l2 * w2 * h2
      let totalVolume = vol1 + vol2
      {
        topNumber: "",
        operator: "",
        bottomNumber: "",
        answer: Int.toString(totalVolume),
        isVertical: false,
        horizontalDisplay: Some(`A shape is made of two rectangular prisms. Prism 1: ${Int.toString(l1)}×${Int.toString(w1)}×${Int.toString(h1)}. Prism 2: ${Int.toString(l2)}×${Int.toString(w2)}×${Int.toString(h2)}. Total volume: ____ cubic units`),
        fractionData: None,
      }
    }
  }
}

// Main generate function
let generate = (config: skillConfig): problem => {
  switch config.operation {
  | KindergartenOperation(op) => generateKindergartenProblem(op, config)
  | FirstGradeOperation(op) => generateFirstGradeProblem(op, config)
  | SecondGradeOperation(op) => generateSecondGradeProblem(op, config)
  | ThirdGradeOperation(op) => generateThirdGradeProblem(op, config)
  | FourthGradeOperation(op) => generateFourthGradeProblem(op, config)
  | FifthGradeOperation(op) => generateFifthGradeProblem(op, config)
  }
}

// Build skill description for display
let skillConfigToString = (config: skillConfig): string => {
  let parts = [
    categoryToString(config.category),
    operationToString(config.operation),
  ]
  parts->Array.join(" - ")
}
