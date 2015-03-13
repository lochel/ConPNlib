within ConPNlib.Functions;
function firingSumCon "calculates the firing sum of continuous places"
  input Boolean fire[:] "firability of transitions";
  input Real arcWeight[:] "arc weights";
  input Real instSpeed[:] "istantaneous speed of transitions";
  output Real conFiringSum "continuous firing sum";
algorithm
  conFiringSum := 0.0;
  for i in 1:size(fire, 1) loop
    if fire[i] then
      conFiringSum := conFiringSum + arcWeight[i] * instSpeed[i];
    end if;
  end for;
end firingSumCon;
