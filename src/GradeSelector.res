// Grade Selector Component

@react.component
let make = (
  ~value: option<Problem.grade>,
  ~onChange: option<Problem.grade> => unit,
) => {
  let handleChange = (e: ReactEvent.Form.t) => {
    let v = ReactEvent.Form.target(e)["value"]
    let newGrade = switch v {
    | "kindergarten" => Some(Problem.KindergartenGrade)
    | "first" => Some(Problem.FirstGrade)
    | "second" => Some(Problem.SecondGrade)
    | "third" => Some(Problem.ThirdGrade)
    | "fourth" => Some(Problem.FourthGrade)
    | "fifth" => Some(Problem.FifthGrade)
    | _ => None
    }
    onChange(newGrade)
  }

  let currentValue = switch value {
  | Some(Problem.KindergartenGrade) => "kindergarten"
  | Some(Problem.FirstGrade) => "first"
  | Some(Problem.SecondGrade) => "second"
  | Some(Problem.ThirdGrade) => "third"
  | Some(Problem.FourthGrade) => "fourth"
  | Some(Problem.FifthGrade) => "fifth"
  | None => ""
  }

  <div className="form-group">
    <label className="form-label"> {React.string("Grade")} </label>
    <select className="form-select" value={currentValue} onChange={handleChange}>
      <option value=""> {React.string("Select grade...")} </option>
      <option value="kindergarten"> {React.string("Kindergarten")} </option>
      <option value="first"> {React.string("First Grade")} </option>
      <option value="second"> {React.string("Second Grade")} </option>
      <option value="third"> {React.string("Third Grade")} </option>
      <option value="fourth"> {React.string("Fourth Grade")} </option>
      <option value="fifth"> {React.string("Fifth Grade")} </option>
    </select>
  </div>
}
