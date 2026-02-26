// Config Selector Component - renders the appropriate config options based on operation

// Kindergarten Counting Config
module KindergartenCountingConfig = {
  @react.component
  let make = (
    ~value: option<Kindergarten.countingConfig>,
    ~onChange: option<Kindergarten.countingConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(Kindergarten.CountToTen) => "ten"
    | Some(Kindergarten.CountToTwenty) => "twenty"
    | Some(Kindergarten.MixedCounting) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "ten" => Some(Kindergarten.CountToTen)
      | "twenty" => Some(Kindergarten.CountToTwenty)
      | "mixed" => Some(Kindergarten.MixedCounting)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Count To")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select range...")} </option>
        <option value="ten"> {React.string("Count to 10")} </option>
        <option value="twenty"> {React.string("Count to 20")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// First Grade Addition Config
module FirstAdditionConfig = {
  @react.component
  let make = (
    ~value: option<FirstGrade.additionConfig>,
    ~onChange: option<FirstGrade.additionConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FirstGrade.WithinTen) => "ten"
    | Some(FirstGrade.WithinTwenty) => "twenty"
    | Some(FirstGrade.MixedAddition) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "ten" => Some(FirstGrade.WithinTen)
      | "twenty" => Some(FirstGrade.WithinTwenty)
      | "mixed" => Some(FirstGrade.MixedAddition)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Sum Range")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select range...")} </option>
        <option value="ten"> {React.string("Within 10")} </option>
        <option value="twenty"> {React.string("Within 20")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// First Grade Place Value Config
module FirstPlaceValueConfig = {
  @react.component
  let make = (
    ~value: option<FirstGrade.placeValueConfig>,
    ~onChange: option<FirstGrade.placeValueConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FirstGrade.TwoDigit) => "twodigit"
    | Some(FirstGrade.MixedPlaceValue) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "twodigit" => Some(FirstGrade.TwoDigit)
      | "mixed" => Some(FirstGrade.MixedPlaceValue)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Number Size")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select size...")} </option>
        <option value="twodigit"> {React.string("Two-digit (10-99)")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// First Grade Time Config
module FirstTimeConfig = {
  @react.component
  let make = (
    ~value: option<FirstGrade.timeConfig>,
    ~onChange: option<FirstGrade.timeConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FirstGrade.ToTheHour) => "hour"
    | Some(FirstGrade.ToHalfHour) => "halfhour"
    | Some(FirstGrade.MixedTime) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "hour" => Some(FirstGrade.ToTheHour)
      | "halfhour" => Some(FirstGrade.ToHalfHour)
      | "mixed" => Some(FirstGrade.MixedTime)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Time Precision")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select precision...")} </option>
        <option value="hour"> {React.string("To the hour")} </option>
        <option value="halfhour"> {React.string("To half hour")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Second Grade Addition Config
module SecondAdditionConfig = {
  @react.component
  let make = (
    ~value: option<SecondGrade.additionConfig>,
    ~onChange: option<SecondGrade.additionConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(SecondGrade.NoRegrouping) => "noregrouping"
    | Some(SecondGrade.WithRegrouping) => "withregrouping"
    | Some(SecondGrade.MixedAddition) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "noregrouping" => Some(SecondGrade.NoRegrouping)
      | "withregrouping" => Some(SecondGrade.WithRegrouping)
      | "mixed" => Some(SecondGrade.MixedAddition)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Regrouping")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select type...")} </option>
        <option value="noregrouping"> {React.string("Without regrouping")} </option>
        <option value="withregrouping"> {React.string("With regrouping")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Second Grade Place Value Config
module SecondPlaceValueConfig = {
  @react.component
  let make = (
    ~value: option<SecondGrade.placeValueConfig>,
    ~onChange: option<SecondGrade.placeValueConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(SecondGrade.TwoDigit) => "twodigit"
    | Some(SecondGrade.ThreeDigit) => "threedigit"
    | Some(SecondGrade.MixedPlaceValue) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "twodigit" => Some(SecondGrade.TwoDigit)
      | "threedigit" => Some(SecondGrade.ThreeDigit)
      | "mixed" => Some(SecondGrade.MixedPlaceValue)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Number Size")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select size...")} </option>
        <option value="twodigit"> {React.string("Two-digit (10-99)")} </option>
        <option value="threedigit"> {React.string("Three-digit (100-999)")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Second Grade Money Config
module SecondMoneyConfig = {
  @react.component
  let make = (
    ~value: option<SecondGrade.moneyConfig>,
    ~onChange: option<SecondGrade.moneyConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(SecondGrade.CoinsOnly) => "coins"
    | Some(SecondGrade.WithDollars) => "dollars"
    | Some(SecondGrade.MixedMoney) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "coins" => Some(SecondGrade.CoinsOnly)
      | "dollars" => Some(SecondGrade.WithDollars)
      | "mixed" => Some(SecondGrade.MixedMoney)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Money Type")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select type...")} </option>
        <option value="coins"> {React.string("Coins only")} </option>
        <option value="dollars"> {React.string("With dollars")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Third Grade Multiplication Config
module ThirdMultiplicationConfig = {
  @react.component
  let make = (
    ~value: option<ThirdGrade.multiplicationConfig>,
    ~onChange: option<ThirdGrade.multiplicationConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(ThirdGrade.FactsToFive) => "five"
    | Some(ThirdGrade.FactsToTen) => "ten"
    | Some(ThirdGrade.MixedFacts) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "five" => Some(ThirdGrade.FactsToFive)
      | "ten" => Some(ThirdGrade.FactsToTen)
      | "mixed" => Some(ThirdGrade.MixedFacts)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Facts Range")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select range...")} </option>
        <option value="five"> {React.string("Facts 0-5")} </option>
        <option value="ten"> {React.string("Facts 0-10")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Third Grade Division Config
module ThirdDivisionConfig = {
  @react.component
  let make = (
    ~value: option<ThirdGrade.divisionConfig>,
    ~onChange: option<ThirdGrade.divisionConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(ThirdGrade.NoDivisionRemainder) => "noremainder"
    | Some(ThirdGrade.WithRemainder) => "withremainder"
    | Some(ThirdGrade.MixedDivision) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "noremainder" => Some(ThirdGrade.NoDivisionRemainder)
      | "withremainder" => Some(ThirdGrade.WithRemainder)
      | "mixed" => Some(ThirdGrade.MixedDivision)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Remainder")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select type...")} </option>
        <option value="noremainder"> {React.string("No remainders")} </option>
        <option value="withremainder"> {React.string("With remainders")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Third Grade Fraction Config
module ThirdFractionConfig = {
  @react.component
  let make = (
    ~value: option<ThirdGrade.fractionConfig>,
    ~onChange: option<ThirdGrade.fractionConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(ThirdGrade.UnitFractions) => "unit"
    | Some(ThirdGrade.SimpleFractions) => "simple"
    | Some(ThirdGrade.MixedFractions) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "unit" => Some(ThirdGrade.UnitFractions)
      | "simple" => Some(ThirdGrade.SimpleFractions)
      | "mixed" => Some(ThirdGrade.MixedFractions)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Fraction Type")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select type...")} </option>
        <option value="unit"> {React.string("Unit fractions (1/2, 1/3, 1/4)")} </option>
        <option value="simple"> {React.string("Simple fractions")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Third Grade Rounding Config
module ThirdRoundingConfig = {
  @react.component
  let make = (
    ~value: option<ThirdGrade.roundingConfig>,
    ~onChange: option<ThirdGrade.roundingConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(ThirdGrade.RoundToTen) => "ten"
    | Some(ThirdGrade.RoundToHundred) => "hundred"
    | Some(ThirdGrade.MixedRounding) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "ten" => Some(ThirdGrade.RoundToTen)
      | "hundred" => Some(ThirdGrade.RoundToHundred)
      | "mixed" => Some(ThirdGrade.MixedRounding)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Round To")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select place...")} </option>
        <option value="ten"> {React.string("Nearest 10")} </option>
        <option value="hundred"> {React.string("Nearest 100")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fourth Grade Arithmetic Config
module FourthArithmeticConfig = {
  @react.component
  let make = (
    ~value: option<FourthGrade.arithmeticConfig>,
    ~onChange: option<FourthGrade.arithmeticConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FourthGrade.SingleSingle) => "singlesingle"
    | Some(FourthGrade.DoubleSingle) => "doublesingle"
    | Some(FourthGrade.DoubleDouble) => "doubledouble"
    | Some(FourthGrade.TripleDouble) => "tripledouble"
    | Some(FourthGrade.TripleTriple) => "tripletriple"
    | Some(FourthGrade.MixedDigits) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "singlesingle" => Some(FourthGrade.SingleSingle)
      | "doublesingle" => Some(FourthGrade.DoubleSingle)
      | "doubledouble" => Some(FourthGrade.DoubleDouble)
      | "tripledouble" => Some(FourthGrade.TripleDouble)
      | "tripletriple" => Some(FourthGrade.TripleTriple)
      | "mixed" => Some(FourthGrade.MixedDigits)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Digit Size")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select size...")} </option>
        <option value="singlesingle"> {React.string("Single + Single (e.g. 7 + 5)")} </option>
        <option value="doublesingle"> {React.string("Double + Single (e.g. 45 + 8)")} </option>
        <option value="doubledouble"> {React.string("Double + Double (e.g. 47 + 36)")} </option>
        <option value="tripledouble"> {React.string("Triple + Double (e.g. 347 + 56)")} </option>
        <option value="tripletriple"> {React.string("Triple + Triple (e.g. 347 + 256)")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fourth Grade Fraction Config
module FourthFractionConfig = {
  @react.component
  let make = (
    ~value: option<FourthGrade.fractionConfig>,
    ~onChange: option<FourthGrade.fractionConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FourthGrade.SameDenominator) => "same"
    | Some(FourthGrade.DifferentDenominator) => "different"
    | Some(FourthGrade.MixedDenominators) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "same" => Some(FourthGrade.SameDenominator)
      | "different" => Some(FourthGrade.DifferentDenominator)
      | "mixed" => Some(FourthGrade.MixedDenominators)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Denominators")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select type...")} </option>
        <option value="same"> {React.string("Same denominators")} </option>
        <option value="different"> {React.string("Different denominators")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fourth Grade Decimal Config
module FourthDecimalConfig = {
  @react.component
  let make = (
    ~value: option<FourthGrade.decimalConfig>,
    ~onChange: option<FourthGrade.decimalConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FourthGrade.Tenths) => "tenths"
    | Some(FourthGrade.Hundredths) => "hundredths"
    | Some(FourthGrade.MixedDecimals) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "tenths" => Some(FourthGrade.Tenths)
      | "hundredths" => Some(FourthGrade.Hundredths)
      | "mixed" => Some(FourthGrade.MixedDecimals)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Decimal Places")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select precision...")} </option>
        <option value="tenths"> {React.string("Tenths (1 decimal place)")} </option>
        <option value="hundredths"> {React.string("Hundredths (2 decimal places)")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fourth Grade Rounding Config
module FourthRoundingConfig = {
  @react.component
  let make = (
    ~value: option<FourthGrade.roundingConfig>,
    ~onChange: option<FourthGrade.roundingConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FourthGrade.RoundToTen) => "ten"
    | Some(FourthGrade.RoundToHundred) => "hundred"
    | Some(FourthGrade.RoundToThousand) => "thousand"
    | Some(FourthGrade.MixedRounding) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "ten" => Some(FourthGrade.RoundToTen)
      | "hundred" => Some(FourthGrade.RoundToHundred)
      | "thousand" => Some(FourthGrade.RoundToThousand)
      | "mixed" => Some(FourthGrade.MixedRounding)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Round To")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select place...")} </option>
        <option value="ten"> {React.string("Nearest 10")} </option>
        <option value="hundred"> {React.string("Nearest 100")} </option>
        <option value="thousand"> {React.string("Nearest 1,000")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fourth Grade Division Config
module FourthDivisionConfig = {
  @react.component
  let make = (
    ~value: option<FourthGrade.divisionConfig>,
    ~onChange: option<FourthGrade.divisionConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FourthGrade.NoDivisionRemainder) => "noremainder"
    | Some(FourthGrade.WithRemainder) => "withremainder"
    | Some(FourthGrade.MixedDivision) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "noremainder" => Some(FourthGrade.NoDivisionRemainder)
      | "withremainder" => Some(FourthGrade.WithRemainder)
      | "mixed" => Some(FourthGrade.MixedDivision)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Remainder")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select type...")} </option>
        <option value="noremainder"> {React.string("No remainders")} </option>
        <option value="withremainder"> {React.string("With remainders")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fourth Grade Factors Config
module FourthFactorsConfig = {
  @react.component
  let make = (
    ~value: option<FourthGrade.factorsConfig>,
    ~onChange: option<FourthGrade.factorsConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FourthGrade.SmallNumbers) => "small"
    | Some(FourthGrade.MediumNumbers) => "medium"
    | Some(FourthGrade.LargeNumbers) => "large"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "small" => Some(FourthGrade.SmallNumbers)
      | "medium" => Some(FourthGrade.MediumNumbers)
      | "large" => Some(FourthGrade.LargeNumbers)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Number Range")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select range...")} </option>
        <option value="small"> {React.string("Small (1-50)")} </option>
        <option value="medium"> {React.string("Medium (1-100)")} </option>
        <option value="large"> {React.string("Large (1-200)")} </option>
      </select>
    </div>
  }
}

// Fourth Grade Measurement Config
module FourthMeasurementConfig = {
  @react.component
  let make = (
    ~value: option<FourthGrade.measurementConfig>,
    ~onChange: option<FourthGrade.measurementConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FourthGrade.CustomaryUnits) => "customary"
    | Some(FourthGrade.MetricUnits) => "metric"
    | Some(FourthGrade.MixedUnits) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "customary" => Some(FourthGrade.CustomaryUnits)
      | "metric" => Some(FourthGrade.MetricUnits)
      | "mixed" => Some(FourthGrade.MixedUnits)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Unit System")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select system...")} </option>
        <option value="customary"> {React.string("Customary (feet, pounds, cups)")} </option>
        <option value="metric"> {React.string("Metric (meters, grams, liters)")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fifth Grade Arithmetic Config
module FifthArithmeticConfig = {
  @react.component
  let make = (
    ~value: option<FifthGrade.arithmeticConfig>,
    ~onChange: option<FifthGrade.arithmeticConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FifthGrade.SingleSingle) => "singlesingle"
    | Some(FifthGrade.DoubleSingle) => "doublesingle"
    | Some(FifthGrade.DoubleDouble) => "doubledouble"
    | Some(FifthGrade.TripleDouble) => "tripledouble"
    | Some(FifthGrade.TripleTriple) => "tripletriple"
    | Some(FifthGrade.MixedDigits) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "singlesingle" => Some(FifthGrade.SingleSingle)
      | "doublesingle" => Some(FifthGrade.DoubleSingle)
      | "doubledouble" => Some(FifthGrade.DoubleDouble)
      | "tripledouble" => Some(FifthGrade.TripleDouble)
      | "tripletriple" => Some(FifthGrade.TripleTriple)
      | "mixed" => Some(FifthGrade.MixedDigits)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Digit Size")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select size...")} </option>
        <option value="singlesingle"> {React.string("Single + Single (e.g. 7 + 5)")} </option>
        <option value="doublesingle"> {React.string("Double + Single (e.g. 45 + 8)")} </option>
        <option value="doubledouble"> {React.string("Double + Double (e.g. 47 + 36)")} </option>
        <option value="tripledouble"> {React.string("Triple + Double (e.g. 347 + 56)")} </option>
        <option value="tripletriple"> {React.string("Triple + Triple (e.g. 347 + 256)")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fifth Grade Fraction Config
module FifthFractionConfig = {
  @react.component
  let make = (
    ~value: option<FifthGrade.fractionConfig>,
    ~onChange: option<FifthGrade.fractionConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FifthGrade.SameDenominator) => "same"
    | Some(FifthGrade.DifferentDenominator) => "different"
    | Some(FifthGrade.MixedDenominators) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "same" => Some(FifthGrade.SameDenominator)
      | "different" => Some(FifthGrade.DifferentDenominator)
      | "mixed" => Some(FifthGrade.MixedDenominators)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Denominators")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select type...")} </option>
        <option value="same"> {React.string("Same denominators")} </option>
        <option value="different"> {React.string("Different denominators")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fifth Grade Decimal Config
module FifthDecimalConfig = {
  @react.component
  let make = (
    ~value: option<FifthGrade.decimalConfig>,
    ~onChange: option<FifthGrade.decimalConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FifthGrade.Tenths) => "tenths"
    | Some(FifthGrade.Hundredths) => "hundredths"
    | Some(FifthGrade.Thousandths) => "thousandths"
    | Some(FifthGrade.MixedDecimals) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "tenths" => Some(FifthGrade.Tenths)
      | "hundredths" => Some(FifthGrade.Hundredths)
      | "thousandths" => Some(FifthGrade.Thousandths)
      | "mixed" => Some(FifthGrade.MixedDecimals)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Decimal Places")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select precision...")} </option>
        <option value="tenths"> {React.string("Tenths (1 decimal place)")} </option>
        <option value="hundredths"> {React.string("Hundredths (2 decimal places)")} </option>
        <option value="thousandths"> {React.string("Thousandths (3 decimal places)")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fifth Grade Rounding Config
module FifthRoundingConfig = {
  @react.component
  let make = (
    ~value: option<FifthGrade.roundingConfig>,
    ~onChange: option<FifthGrade.roundingConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FifthGrade.RoundToTen) => "ten"
    | Some(FifthGrade.RoundToHundred) => "hundred"
    | Some(FifthGrade.RoundToThousand) => "thousand"
    | Some(FifthGrade.RoundToTenThousand) => "tenthousand"
    | Some(FifthGrade.MixedRounding) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "ten" => Some(FifthGrade.RoundToTen)
      | "hundred" => Some(FifthGrade.RoundToHundred)
      | "thousand" => Some(FifthGrade.RoundToThousand)
      | "tenthousand" => Some(FifthGrade.RoundToTenThousand)
      | "mixed" => Some(FifthGrade.MixedRounding)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Round To")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select place...")} </option>
        <option value="ten"> {React.string("Nearest 10")} </option>
        <option value="hundred"> {React.string("Nearest 100")} </option>
        <option value="thousand"> {React.string("Nearest 1,000")} </option>
        <option value="tenthousand"> {React.string("Nearest 10,000")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fifth Grade Division Config
module FifthDivisionConfig = {
  @react.component
  let make = (
    ~value: option<FifthGrade.divisionConfig>,
    ~onChange: option<FifthGrade.divisionConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FifthGrade.NoDivisionRemainder) => "noremainder"
    | Some(FifthGrade.WithRemainder) => "withremainder"
    | Some(FifthGrade.MixedDivision) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "noremainder" => Some(FifthGrade.NoDivisionRemainder)
      | "withremainder" => Some(FifthGrade.WithRemainder)
      | "mixed" => Some(FifthGrade.MixedDivision)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Remainder")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select type...")} </option>
        <option value="noremainder"> {React.string("No remainders")} </option>
        <option value="withremainder"> {React.string("With remainders")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fifth Grade Integer Config
module FifthIntegerConfig = {
  @react.component
  let make = (
    ~value: option<FifthGrade.integerConfig>,
    ~onChange: option<FifthGrade.integerConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FifthGrade.SmallIntegers) => "small"
    | Some(FifthGrade.MediumIntegers) => "medium"
    | Some(FifthGrade.LargeIntegers) => "large"
    | Some(FifthGrade.MixedIntegers) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "small" => Some(FifthGrade.SmallIntegers)
      | "medium" => Some(FifthGrade.MediumIntegers)
      | "large" => Some(FifthGrade.LargeIntegers)
      | "mixed" => Some(FifthGrade.MixedIntegers)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Integer Range")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select range...")} </option>
        <option value="small"> {React.string("Small (-10 to 10)")} </option>
        <option value="medium"> {React.string("Medium (-50 to 50)")} </option>
        <option value="large"> {React.string("Large (-100 to 100)")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fifth Grade Exponent Config
module FifthExponentConfig = {
  @react.component
  let make = (
    ~value: option<FifthGrade.exponentConfig>,
    ~onChange: option<FifthGrade.exponentConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FifthGrade.SmallBases) => "small"
    | Some(FifthGrade.MediumBases) => "medium"
    | Some(FifthGrade.MixedExponents) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "small" => Some(FifthGrade.SmallBases)
      | "medium" => Some(FifthGrade.MediumBases)
      | "mixed" => Some(FifthGrade.MixedExponents)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Base Size")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select size...")} </option>
        <option value="small"> {React.string("Small bases (2-5)")} </option>
        <option value="medium"> {React.string("Medium bases (2-10)")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fifth Grade Order of Operations Config
module FifthOrderOfOperationsConfig = {
  @react.component
  let make = (
    ~value: option<FifthGrade.orderOfOperationsConfig>,
    ~onChange: option<FifthGrade.orderOfOperationsConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FifthGrade.TwoOperations) => "two"
    | Some(FifthGrade.ThreeOperations) => "three"
    | Some(FifthGrade.WithParentheses) => "parentheses"
    | Some(FifthGrade.MixedComplexity) => "mixed"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "two" => Some(FifthGrade.TwoOperations)
      | "three" => Some(FifthGrade.ThreeOperations)
      | "parentheses" => Some(FifthGrade.WithParentheses)
      | "mixed" => Some(FifthGrade.MixedComplexity)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Complexity")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select complexity...")} </option>
        <option value="two"> {React.string("Two operations (e.g. 3 + 4 × 2)")} </option>
        <option value="three"> {React.string("Three operations")} </option>
        <option value="parentheses"> {React.string("With parentheses")} </option>
        <option value="mixed"> {React.string("Mixed (variety)")} </option>
      </select>
    </div>
  }
}

// Fifth Grade Volume Config
module FifthVolumeConfig = {
  @react.component
  let make = (
    ~value: option<FifthGrade.volumeConfig>,
    ~onChange: option<FifthGrade.volumeConfig> => unit,
  ) => {
    let currentValue = switch value {
    | Some(FifthGrade.SmallDimensions) => "small"
    | Some(FifthGrade.MediumDimensions) => "medium"
    | Some(FifthGrade.LargeDimensions) => "large"
    | None => ""
    }

    let handleChange = (e: ReactEvent.Form.t) => {
      let v = ReactEvent.Form.target(e)["value"]
      let cfg = switch v {
      | "small" => Some(FifthGrade.SmallDimensions)
      | "medium" => Some(FifthGrade.MediumDimensions)
      | "large" => Some(FifthGrade.LargeDimensions)
      | _ => None
      }
      onChange(cfg)
    }

    <div className="form-group">
      <label className="form-label"> {React.string("Dimension Range")} </label>
      <select className="form-select" value={currentValue} onChange={handleChange}>
        <option value=""> {React.string("Select range...")} </option>
        <option value="small"> {React.string("Small (1-10)")} </option>
        <option value="medium"> {React.string("Medium (1-20)")} </option>
        <option value="large"> {React.string("Large (1-50)")} </option>
      </select>
    </div>
  }
}
