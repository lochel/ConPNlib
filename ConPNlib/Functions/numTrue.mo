within ConPNlib.Functions;
function numTrue "Is any entry of a Boolean vector true?"
  input Boolean vec[:];
  output Integer numtrue;
algorithm
  numtrue := 0;
  for i in 1:size(vec, 1) loop
    if vec[i] then
      numtrue := numtrue+1;
    end if;
  end for;
end numTrue;
