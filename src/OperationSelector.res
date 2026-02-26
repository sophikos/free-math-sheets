// Operation Selector Component

// Convert operation to select value
let operationToValue = (op: option<Problem.operation>): string => {
  switch op {
  // Kindergarten operations
  | Some(Problem.KindergartenOperation(Kindergarten.CountObjects)) => "countobjects"
  | Some(Problem.KindergartenOperation(Kindergarten.WriteNumbers)) => "writenumbers"
  | Some(Problem.KindergartenOperation(Kindergarten.NumberSequence)) => "numbersequence"
  | Some(Problem.KindergartenOperation(Kindergarten.CountByOnes)) => "countbyones"
  | Some(Problem.KindergartenOperation(Kindergarten.MoreOrLess)) => "moreorless"
  | Some(Problem.KindergartenOperation(Kindergarten.CompareNumbers)) => "comparenumbers"
  | Some(Problem.KindergartenOperation(Kindergarten.OrderNumbers)) => "ordernumbers"
  | Some(Problem.KindergartenOperation(Kindergarten.AddWithinFive)) => "addwithinfive"
  | Some(Problem.KindergartenOperation(Kindergarten.AddWithinTen)) => "addwithinten"
  | Some(Problem.KindergartenOperation(Kindergarten.AddMissing)) => "addmissing"
  | Some(Problem.KindergartenOperation(Kindergarten.SubtractWithinFive)) => "subtractwithinfive"
  | Some(Problem.KindergartenOperation(Kindergarten.SubtractWithinTen)) => "subtractwithinten"
  // First Grade operations
  | Some(Problem.FirstGradeOperation(FirstGrade.AddWithinTen)) => "addwithinten"
  | Some(Problem.FirstGradeOperation(FirstGrade.AddWithinTwenty)) => "addwithintwenty"
  | Some(Problem.FirstGradeOperation(FirstGrade.AddDoubles)) => "adddoubles"
  | Some(Problem.FirstGradeOperation(FirstGrade.AddMissing)) => "addmissing"
  | Some(Problem.FirstGradeOperation(FirstGrade.AddThreeNumbers)) => "addthreenumbers"
  | Some(Problem.FirstGradeOperation(FirstGrade.SubtractWithinTen)) => "subtractwithinten"
  | Some(Problem.FirstGradeOperation(FirstGrade.SubtractWithinTwenty)) => "subtractwithintwenty"
  | Some(Problem.FirstGradeOperation(FirstGrade.SubtractMissing)) => "subtractmissing"
  | Some(Problem.FirstGradeOperation(FirstGrade.FactFamilies)) => "factfamilies"
  | Some(Problem.FirstGradeOperation(FirstGrade.TensAndOnes)) => "tensandones"
  | Some(Problem.FirstGradeOperation(FirstGrade.ExpandedForm)) => "expandedform"
  | Some(Problem.FirstGradeOperation(FirstGrade.AddTensToNumber)) => "addtenstonumber"
  | Some(Problem.FirstGradeOperation(FirstGrade.CompareNumbers)) => "comparenumbers"
  | Some(Problem.FirstGradeOperation(FirstGrade.CompareWithSymbols)) => "comparewithsymbols"
  | Some(Problem.FirstGradeOperation(FirstGrade.OrderNumbers)) => "ordernumbers"
  | Some(Problem.FirstGradeOperation(FirstGrade.TellTimeHour)) => "telltimehour"
  | Some(Problem.FirstGradeOperation(FirstGrade.TellTimeHalfHour)) => "telltimehalfhour"
  // Second Grade operations
  | Some(Problem.SecondGradeOperation(SecondGrade.AddTwoDigit)) => "addtwodigit"
  | Some(Problem.SecondGradeOperation(SecondGrade.AddTwoDigitTwo)) => "addtwodigittwo"
  | Some(Problem.SecondGradeOperation(SecondGrade.AddWithRegrouping)) => "addwithregrouping"
  | Some(Problem.SecondGradeOperation(SecondGrade.AddThreeNumbers)) => "addthreenumbers"
  | Some(Problem.SecondGradeOperation(SecondGrade.SubtractTwoDigit)) => "subtracttwodigit"
  | Some(Problem.SecondGradeOperation(SecondGrade.SubtractTwoDigitTwo)) => "subtracttwodigittwo"
  | Some(Problem.SecondGradeOperation(SecondGrade.SubtractRegrouping)) => "subtractregrouping"
  | Some(Problem.SecondGradeOperation(SecondGrade.HundredsTensOnes)) => "hundredstensones"
  | Some(Problem.SecondGradeOperation(SecondGrade.ExpandedForm)) => "expandedform"
  | Some(Problem.SecondGradeOperation(SecondGrade.CompareThreeDigit)) => "comparethreedigit"
  | Some(Problem.SecondGradeOperation(SecondGrade.SkipCountByTwos)) => "skipcountbytwos"
  | Some(Problem.SecondGradeOperation(SecondGrade.SkipCountByFives)) => "skipcountbyfives"
  | Some(Problem.SecondGradeOperation(SecondGrade.SkipCountByTens)) => "skipcountbytens"
  | Some(Problem.SecondGradeOperation(SecondGrade.SkipCountByHundreds)) => "skipcountbyhundreds"
  | Some(Problem.SecondGradeOperation(SecondGrade.CountCoins)) => "countcoins"
  | Some(Problem.SecondGradeOperation(SecondGrade.MakeChange)) => "makechange"
  | Some(Problem.SecondGradeOperation(SecondGrade.CompareMoney)) => "comparemoney"
  | Some(Problem.SecondGradeOperation(SecondGrade.TellTimeFiveMin)) => "telltimefivemin"
  | Some(Problem.SecondGradeOperation(SecondGrade.NumberPatterns)) => "numberpatterns"
  | Some(Problem.SecondGradeOperation(SecondGrade.OddEven)) => "oddeven"
  // Third Grade operations
  | Some(Problem.ThirdGradeOperation(ThirdGrade.AddThreeDigit)) => "addthreedigit"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.AddMultiple)) => "addmultiple"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.SubtractThreeDigit)) => "subtractthreedigit"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.SubtractAcrossZeros)) => "subtractacrosszeros"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.MultiplicationFacts)) => "multiplicationfacts"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.MultiplyByTen)) => "multiplybyten"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.DivisionFacts)) => "divisionfacts"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.DivideWithRemainder)) => "dividewithremainder"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.IdentifyFractions)) => "identifyfractions"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.CompareFractions)) => "comparefractions"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.EquivalentFractions)) => "equivalentfractions"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.FractionsOnNumberLine)) => "fractionsonnumberline"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.RoundToTen)) => "roundtoten"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.RoundToHundred)) => "roundtohundred"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.CompareNumbers)) => "comparenumbers"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.PlaceValueIdentify)) => "placevalueidentify"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.TellTimeMinute)) => "telltimeminute"
  | Some(Problem.ThirdGradeOperation(ThirdGrade.ElapsedTime)) => "elapsedtime"
  // Fourth Grade operations
  | Some(Problem.FourthGradeOperation(FourthGrade.Addition)) => "addition"
  | Some(Problem.FourthGradeOperation(FourthGrade.Subtraction)) => "subtraction"
  | Some(Problem.FourthGradeOperation(FourthGrade.Multiplication)) => "multiplication"
  | Some(Problem.FourthGradeOperation(FourthGrade.Division)) => "division"
  | Some(Problem.FourthGradeOperation(FourthGrade.FractionAddition)) => "fractionaddition"
  | Some(Problem.FourthGradeOperation(FourthGrade.FractionSubtraction)) => "fractionsubtraction"
  | Some(Problem.FourthGradeOperation(FourthGrade.FractionMultiplication)) => "fractionmultiplication"
  | Some(Problem.FourthGradeOperation(FourthGrade.FractionDivision)) => "fractiondivision"
  | Some(Problem.FourthGradeOperation(FourthGrade.FractionComparison)) => "fractioncomparison"
  | Some(Problem.FourthGradeOperation(FourthGrade.FractionEquivalence)) => "fractionequivalence"
  | Some(Problem.FourthGradeOperation(FourthGrade.DecimalAddition)) => "decimaladdition"
  | Some(Problem.FourthGradeOperation(FourthGrade.DecimalSubtraction)) => "decimalsubtraction"
  | Some(Problem.FourthGradeOperation(FourthGrade.DecimalMultiplication)) => "decimalmultiplication"
  | Some(Problem.FourthGradeOperation(FourthGrade.DecimalComparison)) => "decimalcomparison"
  | Some(Problem.FourthGradeOperation(FourthGrade.MixedNumberAddition)) => "mixednumberaddition"
  | Some(Problem.FourthGradeOperation(FourthGrade.MixedNumberSubtraction)) => "mixednumbersubtraction"
  | Some(Problem.FourthGradeOperation(FourthGrade.MixedToImproper)) => "mixedtoimproper"
  | Some(Problem.FourthGradeOperation(FourthGrade.ImproperToMixed)) => "impropertomixed"
  | Some(Problem.FourthGradeOperation(FourthGrade.PlaceValueIdentify)) => "placevalueidentify"
  | Some(Problem.FourthGradeOperation(FourthGrade.Rounding)) => "rounding"
  | Some(Problem.FourthGradeOperation(FourthGrade.FindFactors)) => "findfactors"
  | Some(Problem.FourthGradeOperation(FourthGrade.GCF)) => "gcf"
  | Some(Problem.FourthGradeOperation(FourthGrade.LCM)) => "lcm"
  | Some(Problem.FourthGradeOperation(FourthGrade.PrimeComposite)) => "primecomposite"
  | Some(Problem.FourthGradeOperation(FourthGrade.LengthConversion)) => "lengthconversion"
  | Some(Problem.FourthGradeOperation(FourthGrade.WeightConversion)) => "weightconversion"
  | Some(Problem.FourthGradeOperation(FourthGrade.CapacityConversion)) => "capacityconversion"
  | Some(Problem.FourthGradeOperation(FourthGrade.TimeConversion)) => "timeconversion"
  // Fifth Grade operations
  | Some(Problem.FifthGradeOperation(FifthGrade.Addition)) => "addition"
  | Some(Problem.FifthGradeOperation(FifthGrade.Subtraction)) => "subtraction"
  | Some(Problem.FifthGradeOperation(FifthGrade.Multiplication)) => "multiplication"
  | Some(Problem.FifthGradeOperation(FifthGrade.Division)) => "division"
  | Some(Problem.FifthGradeOperation(FifthGrade.FractionAddition)) => "fractionaddition"
  | Some(Problem.FifthGradeOperation(FifthGrade.FractionSubtraction)) => "fractionsubtraction"
  | Some(Problem.FifthGradeOperation(FifthGrade.FractionMultiplication)) => "fractionmultiplication"
  | Some(Problem.FifthGradeOperation(FifthGrade.FractionDivision)) => "fractiondivision"
  | Some(Problem.FifthGradeOperation(FifthGrade.FractionComparison)) => "fractioncomparison"
  | Some(Problem.FifthGradeOperation(FifthGrade.FractionEquivalence)) => "fractionequivalence"
  | Some(Problem.FifthGradeOperation(FifthGrade.DecimalAddition)) => "decimaladdition"
  | Some(Problem.FifthGradeOperation(FifthGrade.DecimalSubtraction)) => "decimalsubtraction"
  | Some(Problem.FifthGradeOperation(FifthGrade.DecimalMultiplication)) => "decimalmultiplication"
  | Some(Problem.FifthGradeOperation(FifthGrade.DecimalDivision)) => "decimaldivision"
  | Some(Problem.FifthGradeOperation(FifthGrade.DecimalComparison)) => "decimalcomparison"
  | Some(Problem.FifthGradeOperation(FifthGrade.MixedNumberAddition)) => "mixednumberaddition"
  | Some(Problem.FifthGradeOperation(FifthGrade.MixedNumberSubtraction)) => "mixednumbersubtraction"
  | Some(Problem.FifthGradeOperation(FifthGrade.MixedToImproper)) => "mixedtoimproper"
  | Some(Problem.FifthGradeOperation(FifthGrade.ImproperToMixed)) => "impropertomixed"
  | Some(Problem.FifthGradeOperation(FifthGrade.PlaceValueIdentify)) => "placevalueidentify"
  | Some(Problem.FifthGradeOperation(FifthGrade.Rounding)) => "rounding"
  | Some(Problem.FifthGradeOperation(FifthGrade.IntegerAddition)) => "integeraddition"
  | Some(Problem.FifthGradeOperation(FifthGrade.IntegerSubtraction)) => "integersubtraction"
  | Some(Problem.FifthGradeOperation(FifthGrade.IntegerMultiplication)) => "integermultiplication"
  | Some(Problem.FifthGradeOperation(FifthGrade.IntegerComparison)) => "integercomparison"
  | Some(Problem.FifthGradeOperation(FifthGrade.ExponentEvaluate)) => "exponentevaluate"
  | Some(Problem.FifthGradeOperation(FifthGrade.ExponentMultiply)) => "exponentmultiply"
  | Some(Problem.FifthGradeOperation(FifthGrade.OrderOfOperationsBasic)) => "orderofoperationsbasic"
  | Some(Problem.FifthGradeOperation(FifthGrade.OrderOfOperationsParentheses)) => "orderofoperationsparentheses"
  | Some(Problem.FifthGradeOperation(FifthGrade.OrderOfOperationsMixed)) => "orderofoperationsmixed"
  | Some(Problem.FifthGradeOperation(FifthGrade.VolumeRectangularPrism)) => "volumerectangularprism"
  | Some(Problem.FifthGradeOperation(FifthGrade.VolumeCube)) => "volumecube"
  | Some(Problem.FifthGradeOperation(FifthGrade.VolumeComposite)) => "volumecomposite"
  | None => ""
  }
}

// Convert value to Fourth Grade operation
let valueToFourthGradeOperation = (value: string): option<Problem.operation> => {
  switch value {
  | "addition" => Some(Problem.FourthGradeOperation(FourthGrade.Addition))
  | "subtraction" => Some(Problem.FourthGradeOperation(FourthGrade.Subtraction))
  | "multiplication" => Some(Problem.FourthGradeOperation(FourthGrade.Multiplication))
  | "division" => Some(Problem.FourthGradeOperation(FourthGrade.Division))
  | "fractionaddition" => Some(Problem.FourthGradeOperation(FourthGrade.FractionAddition))
  | "fractionsubtraction" => Some(Problem.FourthGradeOperation(FourthGrade.FractionSubtraction))
  | "fractionmultiplication" => Some(Problem.FourthGradeOperation(FourthGrade.FractionMultiplication))
  | "fractiondivision" => Some(Problem.FourthGradeOperation(FourthGrade.FractionDivision))
  | "fractioncomparison" => Some(Problem.FourthGradeOperation(FourthGrade.FractionComparison))
  | "fractionequivalence" => Some(Problem.FourthGradeOperation(FourthGrade.FractionEquivalence))
  | "decimaladdition" => Some(Problem.FourthGradeOperation(FourthGrade.DecimalAddition))
  | "decimalsubtraction" => Some(Problem.FourthGradeOperation(FourthGrade.DecimalSubtraction))
  | "decimalmultiplication" => Some(Problem.FourthGradeOperation(FourthGrade.DecimalMultiplication))
  | "decimalcomparison" => Some(Problem.FourthGradeOperation(FourthGrade.DecimalComparison))
  | "mixednumberaddition" => Some(Problem.FourthGradeOperation(FourthGrade.MixedNumberAddition))
  | "mixednumbersubtraction" => Some(Problem.FourthGradeOperation(FourthGrade.MixedNumberSubtraction))
  | "mixedtoimproper" => Some(Problem.FourthGradeOperation(FourthGrade.MixedToImproper))
  | "impropertomixed" => Some(Problem.FourthGradeOperation(FourthGrade.ImproperToMixed))
  | "placevalueidentify" => Some(Problem.FourthGradeOperation(FourthGrade.PlaceValueIdentify))
  | "rounding" => Some(Problem.FourthGradeOperation(FourthGrade.Rounding))
  | "findfactors" => Some(Problem.FourthGradeOperation(FourthGrade.FindFactors))
  | "gcf" => Some(Problem.FourthGradeOperation(FourthGrade.GCF))
  | "lcm" => Some(Problem.FourthGradeOperation(FourthGrade.LCM))
  | "primecomposite" => Some(Problem.FourthGradeOperation(FourthGrade.PrimeComposite))
  | "lengthconversion" => Some(Problem.FourthGradeOperation(FourthGrade.LengthConversion))
  | "weightconversion" => Some(Problem.FourthGradeOperation(FourthGrade.WeightConversion))
  | "capacityconversion" => Some(Problem.FourthGradeOperation(FourthGrade.CapacityConversion))
  | "timeconversion" => Some(Problem.FourthGradeOperation(FourthGrade.TimeConversion))
  | _ => None
  }
}

// Convert value to Fifth Grade operation
let valueToFifthGradeOperation = (value: string): option<Problem.operation> => {
  switch value {
  | "addition" => Some(Problem.FifthGradeOperation(FifthGrade.Addition))
  | "subtraction" => Some(Problem.FifthGradeOperation(FifthGrade.Subtraction))
  | "multiplication" => Some(Problem.FifthGradeOperation(FifthGrade.Multiplication))
  | "division" => Some(Problem.FifthGradeOperation(FifthGrade.Division))
  | "fractionaddition" => Some(Problem.FifthGradeOperation(FifthGrade.FractionAddition))
  | "fractionsubtraction" => Some(Problem.FifthGradeOperation(FifthGrade.FractionSubtraction))
  | "fractionmultiplication" => Some(Problem.FifthGradeOperation(FifthGrade.FractionMultiplication))
  | "fractiondivision" => Some(Problem.FifthGradeOperation(FifthGrade.FractionDivision))
  | "fractioncomparison" => Some(Problem.FifthGradeOperation(FifthGrade.FractionComparison))
  | "fractionequivalence" => Some(Problem.FifthGradeOperation(FifthGrade.FractionEquivalence))
  | "decimaladdition" => Some(Problem.FifthGradeOperation(FifthGrade.DecimalAddition))
  | "decimalsubtraction" => Some(Problem.FifthGradeOperation(FifthGrade.DecimalSubtraction))
  | "decimalmultiplication" => Some(Problem.FifthGradeOperation(FifthGrade.DecimalMultiplication))
  | "decimaldivision" => Some(Problem.FifthGradeOperation(FifthGrade.DecimalDivision))
  | "decimalcomparison" => Some(Problem.FifthGradeOperation(FifthGrade.DecimalComparison))
  | "mixednumberaddition" => Some(Problem.FifthGradeOperation(FifthGrade.MixedNumberAddition))
  | "mixednumbersubtraction" => Some(Problem.FifthGradeOperation(FifthGrade.MixedNumberSubtraction))
  | "mixedtoimproper" => Some(Problem.FifthGradeOperation(FifthGrade.MixedToImproper))
  | "impropertomixed" => Some(Problem.FifthGradeOperation(FifthGrade.ImproperToMixed))
  | "placevalueidentify" => Some(Problem.FifthGradeOperation(FifthGrade.PlaceValueIdentify))
  | "rounding" => Some(Problem.FifthGradeOperation(FifthGrade.Rounding))
  | "integeraddition" => Some(Problem.FifthGradeOperation(FifthGrade.IntegerAddition))
  | "integersubtraction" => Some(Problem.FifthGradeOperation(FifthGrade.IntegerSubtraction))
  | "integermultiplication" => Some(Problem.FifthGradeOperation(FifthGrade.IntegerMultiplication))
  | "integercomparison" => Some(Problem.FifthGradeOperation(FifthGrade.IntegerComparison))
  | "exponentevaluate" => Some(Problem.FifthGradeOperation(FifthGrade.ExponentEvaluate))
  | "exponentmultiply" => Some(Problem.FifthGradeOperation(FifthGrade.ExponentMultiply))
  | "orderofoperationsbasic" => Some(Problem.FifthGradeOperation(FifthGrade.OrderOfOperationsBasic))
  | "orderofoperationsparentheses" => Some(Problem.FifthGradeOperation(FifthGrade.OrderOfOperationsParentheses))
  | "orderofoperationsmixed" => Some(Problem.FifthGradeOperation(FifthGrade.OrderOfOperationsMixed))
  | "volumerectangularprism" => Some(Problem.FifthGradeOperation(FifthGrade.VolumeRectangularPrism))
  | "volumecube" => Some(Problem.FifthGradeOperation(FifthGrade.VolumeCube))
  | "volumecomposite" => Some(Problem.FifthGradeOperation(FifthGrade.VolumeComposite))
  | _ => None
  }
}

// Convert value to Kindergarten operation
let valueToKindergartenOperation = (value: string): option<Problem.operation> => {
  switch value {
  | "countobjects" => Some(Problem.KindergartenOperation(Kindergarten.CountObjects))
  | "writenumbers" => Some(Problem.KindergartenOperation(Kindergarten.WriteNumbers))
  | "numbersequence" => Some(Problem.KindergartenOperation(Kindergarten.NumberSequence))
  | "countbyones" => Some(Problem.KindergartenOperation(Kindergarten.CountByOnes))
  | "moreorless" => Some(Problem.KindergartenOperation(Kindergarten.MoreOrLess))
  | "comparenumbers" => Some(Problem.KindergartenOperation(Kindergarten.CompareNumbers))
  | "ordernumbers" => Some(Problem.KindergartenOperation(Kindergarten.OrderNumbers))
  | "addwithinfive" => Some(Problem.KindergartenOperation(Kindergarten.AddWithinFive))
  | "addwithinten" => Some(Problem.KindergartenOperation(Kindergarten.AddWithinTen))
  | "addmissing" => Some(Problem.KindergartenOperation(Kindergarten.AddMissing))
  | "subtractwithinfive" => Some(Problem.KindergartenOperation(Kindergarten.SubtractWithinFive))
  | "subtractwithinten" => Some(Problem.KindergartenOperation(Kindergarten.SubtractWithinTen))
  | _ => None
  }
}

// Convert value to First Grade operation
let valueToFirstGradeOperation = (value: string): option<Problem.operation> => {
  switch value {
  | "addwithinten" => Some(Problem.FirstGradeOperation(FirstGrade.AddWithinTen))
  | "addwithintwenty" => Some(Problem.FirstGradeOperation(FirstGrade.AddWithinTwenty))
  | "adddoubles" => Some(Problem.FirstGradeOperation(FirstGrade.AddDoubles))
  | "addmissing" => Some(Problem.FirstGradeOperation(FirstGrade.AddMissing))
  | "addthreenumbers" => Some(Problem.FirstGradeOperation(FirstGrade.AddThreeNumbers))
  | "subtractwithinten" => Some(Problem.FirstGradeOperation(FirstGrade.SubtractWithinTen))
  | "subtractwithintwenty" => Some(Problem.FirstGradeOperation(FirstGrade.SubtractWithinTwenty))
  | "subtractmissing" => Some(Problem.FirstGradeOperation(FirstGrade.SubtractMissing))
  | "factfamilies" => Some(Problem.FirstGradeOperation(FirstGrade.FactFamilies))
  | "tensandones" => Some(Problem.FirstGradeOperation(FirstGrade.TensAndOnes))
  | "expandedform" => Some(Problem.FirstGradeOperation(FirstGrade.ExpandedForm))
  | "addtenstonumber" => Some(Problem.FirstGradeOperation(FirstGrade.AddTensToNumber))
  | "comparenumbers" => Some(Problem.FirstGradeOperation(FirstGrade.CompareNumbers))
  | "comparewithsymbols" => Some(Problem.FirstGradeOperation(FirstGrade.CompareWithSymbols))
  | "ordernumbers" => Some(Problem.FirstGradeOperation(FirstGrade.OrderNumbers))
  | "telltimehour" => Some(Problem.FirstGradeOperation(FirstGrade.TellTimeHour))
  | "telltimehalfhour" => Some(Problem.FirstGradeOperation(FirstGrade.TellTimeHalfHour))
  | _ => None
  }
}

// Convert value to Second Grade operation
let valueToSecondGradeOperation = (value: string): option<Problem.operation> => {
  switch value {
  | "addtwodigit" => Some(Problem.SecondGradeOperation(SecondGrade.AddTwoDigit))
  | "addtwodigittwo" => Some(Problem.SecondGradeOperation(SecondGrade.AddTwoDigitTwo))
  | "addwithregrouping" => Some(Problem.SecondGradeOperation(SecondGrade.AddWithRegrouping))
  | "addthreenumbers" => Some(Problem.SecondGradeOperation(SecondGrade.AddThreeNumbers))
  | "subtracttwodigit" => Some(Problem.SecondGradeOperation(SecondGrade.SubtractTwoDigit))
  | "subtracttwodigittwo" => Some(Problem.SecondGradeOperation(SecondGrade.SubtractTwoDigitTwo))
  | "subtractregrouping" => Some(Problem.SecondGradeOperation(SecondGrade.SubtractRegrouping))
  | "hundredstensones" => Some(Problem.SecondGradeOperation(SecondGrade.HundredsTensOnes))
  | "expandedform" => Some(Problem.SecondGradeOperation(SecondGrade.ExpandedForm))
  | "comparethreedigit" => Some(Problem.SecondGradeOperation(SecondGrade.CompareThreeDigit))
  | "skipcountbytwos" => Some(Problem.SecondGradeOperation(SecondGrade.SkipCountByTwos))
  | "skipcountbyfives" => Some(Problem.SecondGradeOperation(SecondGrade.SkipCountByFives))
  | "skipcountbytens" => Some(Problem.SecondGradeOperation(SecondGrade.SkipCountByTens))
  | "skipcountbyhundreds" => Some(Problem.SecondGradeOperation(SecondGrade.SkipCountByHundreds))
  | "countcoins" => Some(Problem.SecondGradeOperation(SecondGrade.CountCoins))
  | "makechange" => Some(Problem.SecondGradeOperation(SecondGrade.MakeChange))
  | "comparemoney" => Some(Problem.SecondGradeOperation(SecondGrade.CompareMoney))
  | "telltimefivemin" => Some(Problem.SecondGradeOperation(SecondGrade.TellTimeFiveMin))
  | "numberpatterns" => Some(Problem.SecondGradeOperation(SecondGrade.NumberPatterns))
  | "oddeven" => Some(Problem.SecondGradeOperation(SecondGrade.OddEven))
  | _ => None
  }
}

// Convert value to Third Grade operation
let valueToThirdGradeOperation = (value: string): option<Problem.operation> => {
  switch value {
  | "addthreedigit" => Some(Problem.ThirdGradeOperation(ThirdGrade.AddThreeDigit))
  | "addmultiple" => Some(Problem.ThirdGradeOperation(ThirdGrade.AddMultiple))
  | "subtractthreedigit" => Some(Problem.ThirdGradeOperation(ThirdGrade.SubtractThreeDigit))
  | "subtractacrosszeros" => Some(Problem.ThirdGradeOperation(ThirdGrade.SubtractAcrossZeros))
  | "multiplicationfacts" => Some(Problem.ThirdGradeOperation(ThirdGrade.MultiplicationFacts))
  | "multiplybyten" => Some(Problem.ThirdGradeOperation(ThirdGrade.MultiplyByTen))
  | "divisionfacts" => Some(Problem.ThirdGradeOperation(ThirdGrade.DivisionFacts))
  | "dividewithremainder" => Some(Problem.ThirdGradeOperation(ThirdGrade.DivideWithRemainder))
  | "identifyfractions" => Some(Problem.ThirdGradeOperation(ThirdGrade.IdentifyFractions))
  | "comparefractions" => Some(Problem.ThirdGradeOperation(ThirdGrade.CompareFractions))
  | "equivalentfractions" => Some(Problem.ThirdGradeOperation(ThirdGrade.EquivalentFractions))
  | "fractionsonnumberline" => Some(Problem.ThirdGradeOperation(ThirdGrade.FractionsOnNumberLine))
  | "roundtoten" => Some(Problem.ThirdGradeOperation(ThirdGrade.RoundToTen))
  | "roundtohundred" => Some(Problem.ThirdGradeOperation(ThirdGrade.RoundToHundred))
  | "comparenumbers" => Some(Problem.ThirdGradeOperation(ThirdGrade.CompareNumbers))
  | "placevalueidentify" => Some(Problem.ThirdGradeOperation(ThirdGrade.PlaceValueIdentify))
  | "telltimeminute" => Some(Problem.ThirdGradeOperation(ThirdGrade.TellTimeMinute))
  | "elapsedtime" => Some(Problem.ThirdGradeOperation(ThirdGrade.ElapsedTime))
  | _ => None
  }
}

@react.component
let make = (
  ~grade: option<Problem.grade>,
  ~category: option<Problem.category>,
  ~value: option<Problem.operation>,
  ~onChange: option<Problem.operation> => unit,
) => {
  let handleChange = (e: ReactEvent.Form.t) => {
    let v = ReactEvent.Form.target(e)["value"]
    switch grade {
    | Some(Problem.KindergartenGrade) => onChange(valueToKindergartenOperation(v))
    | Some(Problem.FirstGrade) => onChange(valueToFirstGradeOperation(v))
    | Some(Problem.SecondGrade) => onChange(valueToSecondGradeOperation(v))
    | Some(Problem.ThirdGrade) => onChange(valueToThirdGradeOperation(v))
    | Some(Problem.FourthGrade) => onChange(valueToFourthGradeOperation(v))
    | Some(Problem.FifthGrade) => onChange(valueToFifthGradeOperation(v))
    | None => ()
    }
  }

  let renderOptions = () => {
    switch category {
    | Some(cat) => {
        let operations = Problem.getOperationsForCategory(cat)
        operations
        ->Array.map(op => {
          let opValue = operationToValue(Some(op))
          let label = Problem.operationToString(op)
          <option key={opValue} value={opValue}> {React.string(label)} </option>
        })
        ->React.array
      }
    | None => React.null
    }
  }

  switch category {
  | Some(_) =>
    <div className="form-group">
      <label className="form-label"> {React.string("Skill")} </label>
      <select className="form-select" value={operationToValue(value)} onChange={handleChange}>
        <option value=""> {React.string("Select skill...")} </option>
        {renderOptions()}
      </select>
    </div>
  | None => React.null
  }
}
