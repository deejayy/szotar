Uses Crt;

Var F: text;
    S, S2, S3: String;
    C: Char;
    A: Array[1..120, 1..2] of String;
    I, J, K, P: Integer;

Procedure Parse(Z, Z2: String);
 Var L: Integer;
  Begin
    If Length(Z)>1 Then
        For L:=1 To Length(Z2) Do
          Begin
            If Z[L]<>Z2[L] Then Begin TextColor(LightRed); Write(Z2[L]); End
              Else Begin TextColor(White); Write(Z[L]); End;
          End
      Else Begin TextColor(LightRed); Write(Z2); TextColor(White); End;
  End;

BEGIN
  RandomIze;
  Clrscr;
  TextColor(White);
  Assign(F, ParamStr(1));
  Reset(F);
  I:=0; J:=0;
    Repeat
      Inc(I);
      ReadLn(F, S);
      If P<Length(S) Then P:=Length(S);
      S2:=Copy(S, Pos(':', S)+1, Length(S));
      Delete(S, Pos(':', S), Length(S));
      A[I,1]:=S;
      A[I,2]:=S2;
    Until EoF(F);
  J:=I;
    Repeat
      K:=Random(J);
      Write(A[K,1], ': ');
      S3:='';
      ReadLn(S3);
      If S3='x' Then Halt;
      If S3='0' Then S3:=A[K,2];
      If S3=A[K,2] Then Begin GotoXY(P+4, WhereY-1); TextColor(LightGreen); WriteLn('OK'); TextColor(White) End
        Else Begin GotoXY(P+4, WhereY-1); Write('FALSCH: '); Parse(S3, A[K,2]); WriteLn; TextColor(White) End;
      S3:='';
    Until False;
  Close(F);
END.