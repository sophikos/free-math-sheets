// Category Selector Component

// Convert category to select value
let categoryToValue = (cat: option<Problem.category>): string => {
  switch cat {
  // Kindergarten
  | Some(Problem.KindergartenCategory(Kindergarten.Counting)) => "counting"
  | Some(Problem.KindergartenCategory(Kindergarten.Comparing)) => "comparing"
  | Some(Problem.KindergartenCategory(Kindergarten.Addition)) => "addition"
  | Some(Problem.KindergartenCategory(Kindergarten.Subtraction)) => "subtraction"
  // First Grade
  | Some(Problem.FirstGradeCategory(FirstGrade.Addition)) => "addition"
  | Some(Problem.FirstGradeCategory(FirstGrade.Subtraction)) => "subtraction"
  | Some(Problem.FirstGradeCategory(FirstGrade.PlaceValue)) => "placevalue"
  | Some(Problem.FirstGradeCategory(FirstGrade.Comparing)) => "comparing"
  | Some(Problem.FirstGradeCategory(FirstGrade.Time)) => "time"
  // Second Grade
  | Some(Problem.SecondGradeCategory(SecondGrade.Addition)) => "addition"
  | Some(Problem.SecondGradeCategory(SecondGrade.Subtraction)) => "subtraction"
  | Some(Problem.SecondGradeCategory(SecondGrade.PlaceValue)) => "placevalue"
  | Some(Problem.SecondGradeCategory(SecondGrade.Money)) => "money"
  | Some(Problem.SecondGradeCategory(SecondGrade.Time)) => "time"
  | Some(Problem.SecondGradeCategory(SecondGrade.Patterns)) => "patterns"
  // Third Grade
  | Some(Problem.ThirdGradeCategory(ThirdGrade.Addition)) => "addition"
  | Some(Problem.ThirdGradeCategory(ThirdGrade.Subtraction)) => "subtraction"
  | Some(Problem.ThirdGradeCategory(ThirdGrade.Multiplication)) => "multiplication"
  | Some(Problem.ThirdGradeCategory(ThirdGrade.Division)) => "division"
  | Some(Problem.ThirdGradeCategory(ThirdGrade.Fractions)) => "fractions"
  | Some(Problem.ThirdGradeCategory(ThirdGrade.PlaceValue)) => "placevalue"
  | Some(Problem.ThirdGradeCategory(ThirdGrade.Time)) => "time"
  // Fourth Grade
  | Some(Problem.FourthGradeCategory(FourthGrade.Arithmetic)) => "arithmetic"
  | Some(Problem.FourthGradeCategory(FourthGrade.Fractions)) => "fractions"
  | Some(Problem.FourthGradeCategory(FourthGrade.Decimals)) => "decimals"
  | Some(Problem.FourthGradeCategory(FourthGrade.MixedNumbers)) => "mixednumbers"
  | Some(Problem.FourthGradeCategory(FourthGrade.PlaceValue)) => "placevalue"
  | Some(Problem.FourthGradeCategory(FourthGrade.FactorsMultiples)) => "factorsmultiples"
  | Some(Problem.FourthGradeCategory(FourthGrade.Measurement)) => "measurement"
  // Fifth Grade
  | Some(Problem.FifthGradeCategory(FifthGrade.Arithmetic)) => "arithmetic"
  | Some(Problem.FifthGradeCategory(FifthGrade.Fractions)) => "fractions"
  | Some(Problem.FifthGradeCategory(FifthGrade.Decimals)) => "decimals"
  | Some(Problem.FifthGradeCategory(FifthGrade.MixedNumbers)) => "mixednumbers"
  | Some(Problem.FifthGradeCategory(FifthGrade.PlaceValue)) => "placevalue"
  | Some(Problem.FifthGradeCategory(FifthGrade.Integers)) => "integers"
  | Some(Problem.FifthGradeCategory(FifthGrade.Exponents)) => "exponents"
  | Some(Problem.FifthGradeCategory(FifthGrade.OrderOfOperations)) => "orderofoperations"
  | Some(Problem.FifthGradeCategory(FifthGrade.Volume)) => "volume"
  | None => ""
  }
}

// Convert value to category based on grade
let valueToCategory = (grade: Problem.grade, value: string): option<Problem.category> => {
  switch (grade, value) {
  // Kindergarten
  | (Problem.KindergartenGrade, "counting") => Some(Problem.KindergartenCategory(Kindergarten.Counting))
  | (Problem.KindergartenGrade, "comparing") => Some(Problem.KindergartenCategory(Kindergarten.Comparing))
  | (Problem.KindergartenGrade, "addition") => Some(Problem.KindergartenCategory(Kindergarten.Addition))
  | (Problem.KindergartenGrade, "subtraction") => Some(Problem.KindergartenCategory(Kindergarten.Subtraction))
  // First Grade
  | (Problem.FirstGrade, "addition") => Some(Problem.FirstGradeCategory(FirstGrade.Addition))
  | (Problem.FirstGrade, "subtraction") => Some(Problem.FirstGradeCategory(FirstGrade.Subtraction))
  | (Problem.FirstGrade, "placevalue") => Some(Problem.FirstGradeCategory(FirstGrade.PlaceValue))
  | (Problem.FirstGrade, "comparing") => Some(Problem.FirstGradeCategory(FirstGrade.Comparing))
  | (Problem.FirstGrade, "time") => Some(Problem.FirstGradeCategory(FirstGrade.Time))
  // Second Grade
  | (Problem.SecondGrade, "addition") => Some(Problem.SecondGradeCategory(SecondGrade.Addition))
  | (Problem.SecondGrade, "subtraction") => Some(Problem.SecondGradeCategory(SecondGrade.Subtraction))
  | (Problem.SecondGrade, "placevalue") => Some(Problem.SecondGradeCategory(SecondGrade.PlaceValue))
  | (Problem.SecondGrade, "money") => Some(Problem.SecondGradeCategory(SecondGrade.Money))
  | (Problem.SecondGrade, "time") => Some(Problem.SecondGradeCategory(SecondGrade.Time))
  | (Problem.SecondGrade, "patterns") => Some(Problem.SecondGradeCategory(SecondGrade.Patterns))
  // Third Grade
  | (Problem.ThirdGrade, "addition") => Some(Problem.ThirdGradeCategory(ThirdGrade.Addition))
  | (Problem.ThirdGrade, "subtraction") => Some(Problem.ThirdGradeCategory(ThirdGrade.Subtraction))
  | (Problem.ThirdGrade, "multiplication") => Some(Problem.ThirdGradeCategory(ThirdGrade.Multiplication))
  | (Problem.ThirdGrade, "division") => Some(Problem.ThirdGradeCategory(ThirdGrade.Division))
  | (Problem.ThirdGrade, "fractions") => Some(Problem.ThirdGradeCategory(ThirdGrade.Fractions))
  | (Problem.ThirdGrade, "placevalue") => Some(Problem.ThirdGradeCategory(ThirdGrade.PlaceValue))
  | (Problem.ThirdGrade, "time") => Some(Problem.ThirdGradeCategory(ThirdGrade.Time))
  // Fourth Grade
  | (Problem.FourthGrade, "arithmetic") => Some(Problem.FourthGradeCategory(FourthGrade.Arithmetic))
  | (Problem.FourthGrade, "fractions") => Some(Problem.FourthGradeCategory(FourthGrade.Fractions))
  | (Problem.FourthGrade, "decimals") => Some(Problem.FourthGradeCategory(FourthGrade.Decimals))
  | (Problem.FourthGrade, "mixednumbers") => Some(Problem.FourthGradeCategory(FourthGrade.MixedNumbers))
  | (Problem.FourthGrade, "placevalue") => Some(Problem.FourthGradeCategory(FourthGrade.PlaceValue))
  | (Problem.FourthGrade, "factorsmultiples") => Some(Problem.FourthGradeCategory(FourthGrade.FactorsMultiples))
  | (Problem.FourthGrade, "measurement") => Some(Problem.FourthGradeCategory(FourthGrade.Measurement))
  // Fifth Grade
  | (Problem.FifthGrade, "arithmetic") => Some(Problem.FifthGradeCategory(FifthGrade.Arithmetic))
  | (Problem.FifthGrade, "fractions") => Some(Problem.FifthGradeCategory(FifthGrade.Fractions))
  | (Problem.FifthGrade, "decimals") => Some(Problem.FifthGradeCategory(FifthGrade.Decimals))
  | (Problem.FifthGrade, "mixednumbers") => Some(Problem.FifthGradeCategory(FifthGrade.MixedNumbers))
  | (Problem.FifthGrade, "placevalue") => Some(Problem.FifthGradeCategory(FifthGrade.PlaceValue))
  | (Problem.FifthGrade, "integers") => Some(Problem.FifthGradeCategory(FifthGrade.Integers))
  | (Problem.FifthGrade, "exponents") => Some(Problem.FifthGradeCategory(FifthGrade.Exponents))
  | (Problem.FifthGrade, "orderofoperations") => Some(Problem.FifthGradeCategory(FifthGrade.OrderOfOperations))
  | (Problem.FifthGrade, "volume") => Some(Problem.FifthGradeCategory(FifthGrade.Volume))
  | _ => None
  }
}

@react.component
let make = (
  ~grade: option<Problem.grade>,
  ~value: option<Problem.category>,
  ~onChange: option<Problem.category> => unit,
) => {
  let handleChange = (e: ReactEvent.Form.t) => {
    let v = ReactEvent.Form.target(e)["value"]
    switch grade {
    | Some(g) => onChange(valueToCategory(g, v))
    | None => ()
    }
  }

  let renderOptions = () => {
    switch grade {
    | Some(Problem.KindergartenGrade) =>
      <>
        <option value="counting"> {React.string("Counting")} </option>
        <option value="comparing"> {React.string("Comparing Numbers")} </option>
        <option value="addition"> {React.string("Addition")} </option>
        <option value="subtraction"> {React.string("Subtraction")} </option>
      </>
    | Some(Problem.FirstGrade) =>
      <>
        <option value="addition"> {React.string("Addition")} </option>
        <option value="subtraction"> {React.string("Subtraction")} </option>
        <option value="placevalue"> {React.string("Place Value")} </option>
        <option value="comparing"> {React.string("Comparing Numbers")} </option>
        <option value="time"> {React.string("Time")} </option>
      </>
    | Some(Problem.SecondGrade) =>
      <>
        <option value="addition"> {React.string("Addition")} </option>
        <option value="subtraction"> {React.string("Subtraction")} </option>
        <option value="placevalue"> {React.string("Place Value")} </option>
        <option value="money"> {React.string("Money")} </option>
        <option value="time"> {React.string("Time")} </option>
        <option value="patterns"> {React.string("Patterns")} </option>
      </>
    | Some(Problem.ThirdGrade) =>
      <>
        <option value="addition"> {React.string("Addition")} </option>
        <option value="subtraction"> {React.string("Subtraction")} </option>
        <option value="multiplication"> {React.string("Multiplication")} </option>
        <option value="division"> {React.string("Division")} </option>
        <option value="fractions"> {React.string("Fractions")} </option>
        <option value="placevalue"> {React.string("Place Value & Rounding")} </option>
        <option value="time"> {React.string("Time")} </option>
      </>
    | Some(Problem.FourthGrade) =>
      <>
        <option value="arithmetic"> {React.string("Arithmetic")} </option>
        <option value="fractions"> {React.string("Fractions")} </option>
        <option value="decimals"> {React.string("Decimals")} </option>
        <option value="mixednumbers"> {React.string("Mixed Numbers")} </option>
        <option value="placevalue"> {React.string("Place Value & Rounding")} </option>
        <option value="factorsmultiples"> {React.string("Factors & Multiples")} </option>
        <option value="measurement"> {React.string("Measurement")} </option>
      </>
    | Some(Problem.FifthGrade) =>
      <>
        <option value="arithmetic"> {React.string("Arithmetic")} </option>
        <option value="fractions"> {React.string("Fractions")} </option>
        <option value="decimals"> {React.string("Decimals")} </option>
        <option value="mixednumbers"> {React.string("Mixed Numbers")} </option>
        <option value="placevalue"> {React.string("Place Value & Rounding")} </option>
        <option value="integers"> {React.string("Integers")} </option>
        <option value="exponents"> {React.string("Exponents")} </option>
        <option value="orderofoperations"> {React.string("Order of Operations")} </option>
        <option value="volume"> {React.string("Volume")} </option>
      </>
    | None => React.null
    }
  }

  switch grade {
  | Some(_) =>
    <div className="form-group">
      <label className="form-label"> {React.string("Category")} </label>
      <select className="form-select" value={categoryToValue(value)} onChange={handleChange}>
        <option value=""> {React.string("Select category...")} </option>
        {renderOptions()}
      </select>
    </div>
  | None => React.null
  }
}
