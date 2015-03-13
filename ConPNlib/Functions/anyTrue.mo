within ConPNlib.Functions;
function anyTrue "Is any entry of a Boolean vector true?"
  input Boolean vec[:];
  output Boolean anytrue;
algorithm
  anytrue := false;
  for i in 1:size(vec, 1) loop
    if vec[i] then
      anytrue := true;
    end if;
  end for;
end anyTrue;
