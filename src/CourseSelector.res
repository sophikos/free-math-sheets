// Course Selector Component

@react.component
let make = (
  ~value: option<Problem.course>,
  ~onChange: option<Problem.course> => unit,
) => {
  let handleChange = (e: ReactEvent.Form.t) => {
    let v = ReactEvent.Form.target(e)["value"]
    let newCourse = switch v {
    | "kindergarten" => Some(Problem.KindergartenGrade)
    | "first" => Some(Problem.FirstGrade)
    | "second" => Some(Problem.SecondGrade)
    | "third" => Some(Problem.ThirdGrade)
    | "fourth" => Some(Problem.FourthGrade)
    | "fifth" => Some(Problem.FifthGrade)
    | "trigonometry" => Some(Problem.TrigonometryGrade)
    | _ => None
    }
    onChange(newCourse)
  }

  let currentValue = switch value {
  | Some(Problem.KindergartenGrade) => "kindergarten"
  | Some(Problem.FirstGrade) => "first"
  | Some(Problem.SecondGrade) => "second"
  | Some(Problem.ThirdGrade) => "third"
  | Some(Problem.FourthGrade) => "fourth"
  | Some(Problem.FifthGrade) => "fifth"
  | Some(Problem.TrigonometryGrade) => "trigonometry"
  | None => ""
  }

  <div className="form-group">
    <label className="form-label"> {React.string("Course")} </label>
    <select className="form-select" value={currentValue} onChange={handleChange}>
      <option value=""> {React.string("Select course...")} </option>
      <option value="kindergarten"> {React.string("Kindergarten")} </option>
      <option value="first"> {React.string("First Grade")} </option>
      <option value="second"> {React.string("Second Grade")} </option>
      <option value="third"> {React.string("Third Grade")} </option>
      <option value="fourth"> {React.string("Fourth Grade")} </option>
      <option value="fifth"> {React.string("Fifth Grade")} </option>
      <option value="trigonometry"> {React.string("Trigonometry")} </option>
    </select>
  </div>
}
