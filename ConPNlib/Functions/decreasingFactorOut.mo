within ConPNlib.Functions;
function decreasingFactorOut "calculation of decreasing factors"
  parameter input Integer nOut "number of output transitions";
  input Real t "marking";
  input Real minMarks "minimum capacity";
  input Real speedIn "input speed";
  input Real maxSpeedOut[:] "maximum speeds of output transitions";
  input Real prelimSpeedOut[:] "preliminary speeds of output transitions";
  input Real arcWeightOut[:] "arc weights of output transitions";
  input Boolean firingIn[:] "firability of input transitions";
  input Boolean firingOut[:] "firability of output transitions";
  output Real decFactorOut[nOut] "decreasing factors for output transitions";
protected
  Real maxSpeedSumOut;
  Real prelimSpeedSumOut;
  Real prelimDecFactorOut;
  Real modSpeedIn;
  Boolean anyFireIn = Functions.anyTrue(firingIn);
  Integer numFireOut = Functions.numTrue(firingOut);
  Integer numFireIn = Functions.numTrue(firingIn);
  Boolean stop;
algorithm
  decFactorOut:=fill(-1, nOut);
  modSpeedIn:=speedIn;
  stop:=false;
  maxSpeedSumOut:=0;
  prelimSpeedSumOut:=0;
  prelimDecFactorOut:=0;
  //-----------------------------------------------------------------------------------------------------------//
  //decreasing factor of output transitions
  stop:=false;
   if numFireOut>1 and numFireIn>0 then
    prelimSpeedSumOut:=Functions.conditionalSum(arcWeightOut.*prelimSpeedOut, firingOut);
    maxSpeedSumOut:=Functions.conditionalSum(arcWeightOut .*maxSpeedOut, firingOut);
    if maxSpeedSumOut>0 then
    if not t>minMarks and speedIn<prelimSpeedSumOut then

      prelimDecFactorOut:=speedIn/maxSpeedSumOut;
      while not stop loop
        stop:=true;
        for i in 1:nOut loop
          if firingOut[i] and prelimDecFactorOut*maxSpeedOut[i]>prelimSpeedOut[i] and decFactorOut[i]<0 and prelimDecFactorOut<1 then
             decFactorOut[i]:=prelimSpeedOut[i]/maxSpeedOut[i];
             modSpeedIn:=modSpeedIn - arcWeightOut[i]*prelimSpeedOut[i];
             maxSpeedSumOut:=maxSpeedSumOut - arcWeightOut[i]*maxSpeedOut[i];
             stop:=false;
          end if;
        end for;
      if maxSpeedSumOut>0 then
          prelimDecFactorOut:=modSpeedIn/maxSpeedSumOut;
      end if;
      end while;
      for i in 1:nOut loop
        if decFactorOut[i]<0 then
          decFactorOut[i]:=prelimDecFactorOut;
        end if;
      end for;
    else
      decFactorOut:=fill(1, nOut);
    end if;
    else
       decFactorOut:=fill(1, nOut);
   end if;
   else
       decFactorOut:=fill(1, nOut);
   end if;
end decreasingFactorOut;
