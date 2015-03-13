within ConPNlib.Blocks;
block activationCon "activation process of continuous transitions"
  parameter input Integer nIn "number of input places";
  parameter input Integer nOut "number of output places";
  input Real tIn[:] "marking of input places";
  input Real tOut[:] "marking of output places";
  input Real arcWeightIn[:] "arc weights of input places";
  input Real arcWeightOut[:] "arc weights of output places";
  input Real minTokens[:] "minimum capacities of input places";
  input Real maxTokens[:] "maximum capacities of output places";
  input Boolean fed[:] "input places are fed?";
  input Boolean emptied[:] "output places are emptied?";
  input PNlib.Types.ArcType arcType[:] "arc type of input places";
  input Real testValue[:] "test values of test and inhibitor arcs";
  output Boolean active "activation of transition";
  output Boolean weaklyInputActiveVec[nIn]
    "places that causes weakly input activation";
  output Boolean weaklyOutputActiveVec[nOut]
    "places that causes weakly output activation";
algorithm
  active := true;
  weaklyInputActiveVec := fill(false, nIn);
  weaklyOutputActiveVec := fill(false, nOut);

  //check input places
  for i in 1:nIn loop
    // normal arc
    if arcType[i] == PNlib.Types.ArcType.normal_arc then
      if tIn[i] <= minTokens[i] then
         if fed[i] then
           weaklyInputActiveVec[i] := true;
         else
           active := false;
         end if;
      end if;
    // inhibitor arc
    elseif arcType[i] == PNlib.Types.ArcType.inhibitor_arc then
      if not tIn[i] < testValue[i] then
        active := false;
      end if;
    end if;
  end for;

  //output places
  for i in 1:nOut loop
    if tOut[i] >= maxTokens[i] and not emptied[i] then
      active := false;
    elseif tOut[i] >= maxTokens[i] and emptied[i] then
      weaklyOutputActiveVec[i] := true;
    end if;
  end for;
end activationCon;
