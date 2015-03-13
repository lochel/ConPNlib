within ConPNlib.Functions;
function decreasingFactorIn "calculation of decreasing factors"
  parameter input Integer nIn "number of input transitions";
  input Real t "marking";
  input Real maxMarks "maximum capacity";
  input Real speedOut "output speed";
  input Real maxSpeedIn[:] "maximum speeds of input transitions";
  input Real prelimSpeedIn[:] "preliminary speeds of input transitions";
  input Real arcWeightIn[:] "arc weights of input transitions";
  input Boolean firingIn[:] "firability of input transitions";
  input Boolean firingOut[:] "firability of input transitions";
  output Real decFactorIn[nIn] "decreasing factors for input transitions";
protected
  Real maxSpeedSumIn;
  Real prelimSpeedSumIn;
  Real prelimDecFactorIn;
  Real modSpeedOut;
  Boolean anyFireIn = Functions.anyTrue(firingIn);
  Integer numFireIn = Functions.numTrue(firingIn);
  Integer numFireOut = Functions.numTrue(firingOut);
  Boolean stop;
algorithm
  decFactorIn:=fill(-1, nIn);
  modSpeedOut:=speedOut;
  stop:=false;
  maxSpeedSumIn:=0;
  prelimSpeedSumIn:=0;
  prelimDecFactorIn:=0;
  //-----------------------------------------------------------------------------------------------------------//
  //decreasing factor of input transitions
if numFireOut>0 and numFireIn>1 then
    prelimSpeedSumIn:=Functions.conditionalSum(arcWeightIn.*prelimSpeedIn, firingIn);
    maxSpeedSumIn:=Functions.conditionalSum(arcWeightIn.*maxSpeedIn, firingIn);
    if maxSpeedSumIn>0 then
    if not (t<maxMarks) and  speedOut<prelimSpeedSumIn then   // arcWeights can be zero and then is maxSpeedSumIn zero!!! and not maxSpeedSumIn<=0
      prelimDecFactorIn:=speedOut/maxSpeedSumIn;
      while not stop loop
        stop:=true;
        for i in 1:nIn loop
          if firingIn[i] and prelimDecFactorIn*maxSpeedIn[i]>prelimSpeedIn[i] and decFactorIn[i]<0 and prelimDecFactorIn<1 then
             decFactorIn[i]:=prelimSpeedIn[i]/maxSpeedIn[i];
             modSpeedOut:=modSpeedOut - arcWeightIn[i]*prelimSpeedIn[i];
             maxSpeedSumIn:=maxSpeedSumIn - arcWeightIn[i]*maxSpeedIn[i];
             stop:=false;
          end if;
        end for;
         if  maxSpeedSumIn>0 then
           prelimDecFactorIn:=modSpeedOut/maxSpeedSumIn;
         else
           prelimDecFactorIn:=1;
        end if;
 //       prelimDecFactorIn:=if not maxSpeedSumIn<=0 then modSpeedOut/maxSpeedSumIn else 1;  // arcWeights can be zero and then is maxSpeedSumIn zero!!!
      end while;
      for i in 1:nIn loop
        if decFactorIn[i]<0 then
          decFactorIn[i]:=prelimDecFactorIn;
        end if;
      end for;
    else
      decFactorIn:=fill(1, nIn);
    end if;
  else
      decFactorIn:=fill(1, nIn);
    end if;
     else
      decFactorIn:=fill(1, nIn);
end if;
end decreasingFactorIn;
