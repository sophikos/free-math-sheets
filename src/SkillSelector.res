// Skill Selector - Composes grade, category, operation, and config selectors

@react.component
let make = (
  ~onConfigChange: Problem.skillConfig => unit,
  ~onConfigClear: unit => unit,
  ~currentConfig: option<Problem.skillConfig>,
) => {
  // State for each dropdown level
  let (grade, setGrade) = React.useState(() =>
    currentConfig->Option.map(c => c.grade)
  )
  let (category, setCategory) = React.useState(() =>
    currentConfig->Option.map(c => c.category)
  )
  let (operation, setOperation) = React.useState(() =>
    currentConfig->Option.map(c => c.operation)
  )

  // Kindergarten config state
  let (kindergartenCountingConfig, setKindergartenCountingConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.kindergartenCountingConfig)
  )

  // First Grade config state
  let (firstAdditionConfig, setFirstAdditionConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.firstAdditionConfig)
  )
  let (firstPlaceValueConfig, setFirstPlaceValueConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.firstPlaceValueConfig)
  )
  let (firstTimeConfig, setFirstTimeConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.firstTimeConfig)
  )

  // Second Grade config state
  let (secondAdditionConfig, setSecondAdditionConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.secondAdditionConfig)
  )
  let (secondPlaceValueConfig, setSecondPlaceValueConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.secondPlaceValueConfig)
  )
  let (secondMoneyConfig, setSecondMoneyConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.secondMoneyConfig)
  )

  // Third Grade config state
  let (thirdMultiplicationConfig, setThirdMultiplicationConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.thirdMultiplicationConfig)
  )
  let (thirdDivisionConfig, setThirdDivisionConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.thirdDivisionConfig)
  )
  let (thirdFractionConfig, setThirdFractionConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.thirdFractionConfig)
  )
  let (thirdRoundingConfig, setThirdRoundingConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.thirdRoundingConfig)
  )

  // Fourth Grade config state
  let (fourthArithmeticConfig, setFourthArithmeticConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fourthArithmeticConfig)
  )
  let (fourthFractionConfig, setFourthFractionConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fourthFractionConfig)
  )
  let (fourthDecimalConfig, setFourthDecimalConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fourthDecimalConfig)
  )
  let (fourthRoundingConfig, setFourthRoundingConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fourthRoundingConfig)
  )
  let (fourthDivisionConfig, setFourthDivisionConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fourthDivisionConfig)
  )
  let (fourthFactorsConfig, setFourthFactorsConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fourthFactorsConfig)
  )
  let (fourthMeasurementConfig, setFourthMeasurementConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fourthMeasurementConfig)
  )

  // Fifth Grade config state
  let (fifthArithmeticConfig, setFifthArithmeticConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fifthArithmeticConfig)
  )
  let (fifthFractionConfig, setFifthFractionConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fifthFractionConfig)
  )
  let (fifthDecimalConfig, setFifthDecimalConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fifthDecimalConfig)
  )
  let (fifthRoundingConfig, setFifthRoundingConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fifthRoundingConfig)
  )
  let (fifthDivisionConfig, setFifthDivisionConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fifthDivisionConfig)
  )
  let (fifthIntegerConfig, setFifthIntegerConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fifthIntegerConfig)
  )
  let (fifthExponentConfig, setFifthExponentConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fifthExponentConfig)
  )
  let (fifthOrderOfOperationsConfig, setFifthOrderOfOperationsConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fifthOrderOfOperationsConfig)
  )
  let (fifthVolumeConfig, setFifthVolumeConfig) = React.useState(() =>
    currentConfig->Option.flatMap(c => c.fifthVolumeConfig)
  )

  // Clear all configs
  let clearAllConfigs = () => {
    setKindergartenCountingConfig(_ => None)
    setFirstAdditionConfig(_ => None)
    setFirstPlaceValueConfig(_ => None)
    setFirstTimeConfig(_ => None)
    setSecondAdditionConfig(_ => None)
    setSecondPlaceValueConfig(_ => None)
    setSecondMoneyConfig(_ => None)
    setThirdMultiplicationConfig(_ => None)
    setThirdDivisionConfig(_ => None)
    setThirdFractionConfig(_ => None)
    setThirdRoundingConfig(_ => None)
    setFourthArithmeticConfig(_ => None)
    setFourthFractionConfig(_ => None)
    setFourthDecimalConfig(_ => None)
    setFourthRoundingConfig(_ => None)
    setFourthDivisionConfig(_ => None)
    setFourthFactorsConfig(_ => None)
    setFourthMeasurementConfig(_ => None)
    setFifthArithmeticConfig(_ => None)
    setFifthFractionConfig(_ => None)
    setFifthDecimalConfig(_ => None)
    setFifthRoundingConfig(_ => None)
    setFifthDivisionConfig(_ => None)
    setFifthIntegerConfig(_ => None)
    setFifthExponentConfig(_ => None)
    setFifthOrderOfOperationsConfig(_ => None)
    setFifthVolumeConfig(_ => None)
  }

  // Build and emit config when all required fields are set
  let emitConfig = () => {
    switch (grade, category, operation) {
    | (Some(g), Some(cat), Some(op)) => {
        let configType = Problem.getConfigType(op)
        let hasRequiredConfig = switch (g, configType) {
        | (_, Problem.NoConfig) => true
        // Kindergarten
        | (Problem.KindergartenGrade, Problem.CountingType) => kindergartenCountingConfig->Option.isSome
        // First Grade
        | (Problem.FirstGrade, Problem.AdditionType) => firstAdditionConfig->Option.isSome
        | (Problem.FirstGrade, Problem.PlaceValueType) => firstPlaceValueConfig->Option.isSome
        | (Problem.FirstGrade, Problem.TimeType) => firstTimeConfig->Option.isSome
        // Second Grade
        | (Problem.SecondGrade, Problem.AdditionType) => secondAdditionConfig->Option.isSome
        | (Problem.SecondGrade, Problem.PlaceValueType) => secondPlaceValueConfig->Option.isSome
        | (Problem.SecondGrade, Problem.MoneyType) => secondMoneyConfig->Option.isSome
        // Third Grade
        | (Problem.ThirdGrade, Problem.MultiplicationType) => thirdMultiplicationConfig->Option.isSome
        | (Problem.ThirdGrade, Problem.DivisionType) => thirdDivisionConfig->Option.isSome
        | (Problem.ThirdGrade, Problem.FractionType) => thirdFractionConfig->Option.isSome
        | (Problem.ThirdGrade, Problem.RoundingType) => thirdRoundingConfig->Option.isSome
        // Fourth Grade
        | (Problem.FourthGrade, Problem.ArithmeticType) => fourthArithmeticConfig->Option.isSome
        | (Problem.FourthGrade, Problem.FractionType) => fourthFractionConfig->Option.isSome
        | (Problem.FourthGrade, Problem.DecimalType) => fourthDecimalConfig->Option.isSome
        | (Problem.FourthGrade, Problem.RoundingType) => fourthRoundingConfig->Option.isSome
        | (Problem.FourthGrade, Problem.DivisionType) => fourthDivisionConfig->Option.isSome
        | (Problem.FourthGrade, Problem.FactorsType) => fourthFactorsConfig->Option.isSome
        | (Problem.FourthGrade, Problem.MeasurementType) => fourthMeasurementConfig->Option.isSome
        // Fifth Grade
        | (Problem.FifthGrade, Problem.ArithmeticType) => fifthArithmeticConfig->Option.isSome
        | (Problem.FifthGrade, Problem.FractionType) => fifthFractionConfig->Option.isSome
        | (Problem.FifthGrade, Problem.DecimalType) => fifthDecimalConfig->Option.isSome
        | (Problem.FifthGrade, Problem.RoundingType) => fifthRoundingConfig->Option.isSome
        | (Problem.FifthGrade, Problem.DivisionType) => fifthDivisionConfig->Option.isSome
        | (Problem.FifthGrade, Problem.IntegerType) => fifthIntegerConfig->Option.isSome
        | (Problem.FifthGrade, Problem.ExponentType) => fifthExponentConfig->Option.isSome
        | (Problem.FifthGrade, Problem.OrderOfOperationsType) => fifthOrderOfOperationsConfig->Option.isSome
        | (Problem.FifthGrade, Problem.VolumeType) => fifthVolumeConfig->Option.isSome
        | _ => false
        }
        if hasRequiredConfig {
          onConfigChange({
            Problem.grade: g,
            category: cat,
            operation: op,
            kindergartenCountingConfig,
            firstAdditionConfig,
            firstPlaceValueConfig,
            firstTimeConfig,
            secondAdditionConfig,
            secondPlaceValueConfig,
            secondMoneyConfig,
            thirdMultiplicationConfig,
            thirdDivisionConfig,
            thirdFractionConfig,
            thirdRoundingConfig,
            fourthArithmeticConfig,
            fourthFractionConfig,
            fourthDecimalConfig,
            fourthRoundingConfig,
            fourthDivisionConfig,
            fourthFactorsConfig,
            fourthMeasurementConfig,
            fifthArithmeticConfig,
            fifthFractionConfig,
            fifthDecimalConfig,
            fifthRoundingConfig,
            fifthDivisionConfig,
            fifthIntegerConfig,
            fifthExponentConfig,
            fifthOrderOfOperationsConfig,
            fifthVolumeConfig,
          })
        }
      }
    | _ => ()
    }
  }

  // Emit config whenever relevant state changes
  React.useEffect7(() => {
    emitConfig()
    None
  }, (
    operation,
    kindergartenCountingConfig,
    firstAdditionConfig,
    firstPlaceValueConfig,
    firstTimeConfig,
    secondAdditionConfig,
    secondPlaceValueConfig,
  ))

  React.useEffect7(() => {
    emitConfig()
    None
  }, (
    secondMoneyConfig,
    thirdMultiplicationConfig,
    thirdDivisionConfig,
    thirdFractionConfig,
    thirdRoundingConfig,
    fourthArithmeticConfig,
    fourthFractionConfig,
  ))

  React.useEffect7(() => {
    emitConfig()
    None
  }, (
    fourthDecimalConfig,
    fourthRoundingConfig,
    fourthDivisionConfig,
    fourthFactorsConfig,
    fourthMeasurementConfig,
    fifthArithmeticConfig,
    fifthFractionConfig,
  ))

  React.useEffect7(() => {
    emitConfig()
    None
  }, (
    fifthDecimalConfig,
    fifthRoundingConfig,
    fifthDivisionConfig,
    fifthIntegerConfig,
    fifthExponentConfig,
    fifthOrderOfOperationsConfig,
    fifthVolumeConfig,
  ))

  // Handle grade change
  let handleGradeChange = (newGrade: option<Problem.grade>) => {
    setGrade(_ => newGrade)
    setCategory(_ => None)
    setOperation(_ => None)
    clearAllConfigs()
    onConfigClear()
  }

  // Handle category change
  let handleCategoryChange = (newCategory: option<Problem.category>) => {
    setCategory(_ => newCategory)
    setOperation(_ => None)
    clearAllConfigs()
    onConfigClear()
  }

  // Handle operation change
  let handleOperationChange = (newOperation: option<Problem.operation>) => {
    setOperation(_ => newOperation)
    clearAllConfigs()
    onConfigClear()
  }

  // Render config selector based on operation and grade
  let renderConfigSelector = () => {
    switch (grade, operation) {
    | (Some(Problem.KindergartenGrade), Some(op)) => {
        let configType = Problem.getConfigType(op)
        switch configType {
        | Problem.CountingType =>
          <ConfigSelector.KindergartenCountingConfig
            value={kindergartenCountingConfig}
            onChange={cfg => setKindergartenCountingConfig(_ => cfg)}
          />
        | _ => React.null
        }
      }
    | (Some(Problem.FirstGrade), Some(op)) => {
        let configType = Problem.getConfigType(op)
        switch configType {
        | Problem.AdditionType =>
          <ConfigSelector.FirstAdditionConfig
            value={firstAdditionConfig}
            onChange={cfg => setFirstAdditionConfig(_ => cfg)}
          />
        | Problem.PlaceValueType =>
          <ConfigSelector.FirstPlaceValueConfig
            value={firstPlaceValueConfig}
            onChange={cfg => setFirstPlaceValueConfig(_ => cfg)}
          />
        | Problem.TimeType =>
          <ConfigSelector.FirstTimeConfig
            value={firstTimeConfig}
            onChange={cfg => setFirstTimeConfig(_ => cfg)}
          />
        | _ => React.null
        }
      }
    | (Some(Problem.SecondGrade), Some(op)) => {
        let configType = Problem.getConfigType(op)
        switch configType {
        | Problem.AdditionType =>
          <ConfigSelector.SecondAdditionConfig
            value={secondAdditionConfig}
            onChange={cfg => setSecondAdditionConfig(_ => cfg)}
          />
        | Problem.PlaceValueType =>
          <ConfigSelector.SecondPlaceValueConfig
            value={secondPlaceValueConfig}
            onChange={cfg => setSecondPlaceValueConfig(_ => cfg)}
          />
        | Problem.MoneyType =>
          <ConfigSelector.SecondMoneyConfig
            value={secondMoneyConfig}
            onChange={cfg => setSecondMoneyConfig(_ => cfg)}
          />
        | _ => React.null
        }
      }
    | (Some(Problem.ThirdGrade), Some(op)) => {
        let configType = Problem.getConfigType(op)
        switch configType {
        | Problem.MultiplicationType =>
          <ConfigSelector.ThirdMultiplicationConfig
            value={thirdMultiplicationConfig}
            onChange={cfg => setThirdMultiplicationConfig(_ => cfg)}
          />
        | Problem.DivisionType =>
          <ConfigSelector.ThirdDivisionConfig
            value={thirdDivisionConfig}
            onChange={cfg => setThirdDivisionConfig(_ => cfg)}
          />
        | Problem.FractionType =>
          <ConfigSelector.ThirdFractionConfig
            value={thirdFractionConfig}
            onChange={cfg => setThirdFractionConfig(_ => cfg)}
          />
        | Problem.RoundingType =>
          <ConfigSelector.ThirdRoundingConfig
            value={thirdRoundingConfig}
            onChange={cfg => setThirdRoundingConfig(_ => cfg)}
          />
        | _ => React.null
        }
      }
    | (Some(Problem.FourthGrade), Some(op)) => {
        let configType = Problem.getConfigType(op)
        switch configType {
        | Problem.ArithmeticType =>
          <ConfigSelector.FourthArithmeticConfig
            value={fourthArithmeticConfig}
            onChange={cfg => setFourthArithmeticConfig(_ => cfg)}
          />
        | Problem.FractionType =>
          <ConfigSelector.FourthFractionConfig
            value={fourthFractionConfig}
            onChange={cfg => setFourthFractionConfig(_ => cfg)}
          />
        | Problem.DecimalType =>
          <ConfigSelector.FourthDecimalConfig
            value={fourthDecimalConfig}
            onChange={cfg => setFourthDecimalConfig(_ => cfg)}
          />
        | Problem.RoundingType =>
          <ConfigSelector.FourthRoundingConfig
            value={fourthRoundingConfig}
            onChange={cfg => setFourthRoundingConfig(_ => cfg)}
          />
        | Problem.DivisionType =>
          <ConfigSelector.FourthDivisionConfig
            value={fourthDivisionConfig}
            onChange={cfg => setFourthDivisionConfig(_ => cfg)}
          />
        | Problem.FactorsType =>
          <ConfigSelector.FourthFactorsConfig
            value={fourthFactorsConfig}
            onChange={cfg => setFourthFactorsConfig(_ => cfg)}
          />
        | Problem.MeasurementType =>
          <ConfigSelector.FourthMeasurementConfig
            value={fourthMeasurementConfig}
            onChange={cfg => setFourthMeasurementConfig(_ => cfg)}
          />
        | _ => React.null
        }
      }
    | (Some(Problem.FifthGrade), Some(op)) => {
        let configType = Problem.getConfigType(op)
        switch configType {
        | Problem.ArithmeticType =>
          <ConfigSelector.FifthArithmeticConfig
            value={fifthArithmeticConfig}
            onChange={cfg => setFifthArithmeticConfig(_ => cfg)}
          />
        | Problem.FractionType =>
          <ConfigSelector.FifthFractionConfig
            value={fifthFractionConfig}
            onChange={cfg => setFifthFractionConfig(_ => cfg)}
          />
        | Problem.DecimalType =>
          <ConfigSelector.FifthDecimalConfig
            value={fifthDecimalConfig}
            onChange={cfg => setFifthDecimalConfig(_ => cfg)}
          />
        | Problem.RoundingType =>
          <ConfigSelector.FifthRoundingConfig
            value={fifthRoundingConfig}
            onChange={cfg => setFifthRoundingConfig(_ => cfg)}
          />
        | Problem.DivisionType =>
          <ConfigSelector.FifthDivisionConfig
            value={fifthDivisionConfig}
            onChange={cfg => setFifthDivisionConfig(_ => cfg)}
          />
        | Problem.IntegerType =>
          <ConfigSelector.FifthIntegerConfig
            value={fifthIntegerConfig}
            onChange={cfg => setFifthIntegerConfig(_ => cfg)}
          />
        | Problem.ExponentType =>
          <ConfigSelector.FifthExponentConfig
            value={fifthExponentConfig}
            onChange={cfg => setFifthExponentConfig(_ => cfg)}
          />
        | Problem.OrderOfOperationsType =>
          <ConfigSelector.FifthOrderOfOperationsConfig
            value={fifthOrderOfOperationsConfig}
            onChange={cfg => setFifthOrderOfOperationsConfig(_ => cfg)}
          />
        | Problem.VolumeType =>
          <ConfigSelector.FifthVolumeConfig
            value={fifthVolumeConfig}
            onChange={cfg => setFifthVolumeConfig(_ => cfg)}
          />
        | _ => React.null
        }
      }
    | _ => React.null
    }
  }

  <>
    <GradeSelector value={grade} onChange={handleGradeChange} />
    <CategorySelector grade={grade} value={category} onChange={handleCategoryChange} />
    <OperationSelector grade={grade} category={category} value={operation} onChange={handleOperationChange} />
    {renderConfigSelector()}
  </>
}
