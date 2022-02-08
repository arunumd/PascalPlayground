unit Sorting;

interface

type
    Vector = array of Integer;

  procedure merge(var arr: Vector; l: Integer; m: Integer;
    r: Integer);

  procedure mergesort(var arr: Vector; l: Integer; r: Integer);

  procedure spawn(var arr: Vector);

  procedure main();

implementation

  procedure merge(var arr: Vector; l: Integer; m: Integer; r: Integer);
    var
      nl, nr, i, j, k: Integer;
      larr, rarr: Vector;
    begin
      nl := m - l + 1;
      nr := r - m;
      Setlength(larr, nl);
      Setlength(rarr, nr);
      for i := 0 to nl - 1 do
        larr[i] := arr[l + i];
      for j := 0 to nr - 1 do
        rarr[j] := arr[m + 1 + j];
      i := 0;
      j := 0;
      k := l;
      while ((i < nl) and (j < nr)) do
        begin
          if (larr[i] <= rarr[j]) then
            begin
              arr[k] := larr[i];
              Inc(i);
            end
          else
            begin
              arr[k] := rarr[j];
              Inc(j);
            end;
          Inc(k);
        end;
      while (i < nl) do
        begin
          arr[k] := larr[i];
          Inc(i);
          Inc(k);
        end;
      while (j < nr) do
        begin
          arr[k] := rarr[j];
          Inc(j);
          Inc(k);
        end;
    end;

  procedure mergesort(var arr: Vector; l: Integer; r: Integer);
    var
      m: Integer;
    begin
      if (l < r) then
        begin
          m := l + Trunc((r - l) / 2);
          mergesort(arr, l, m);
          mergesort(arr, m + 1, r);
          merge(arr, l, m, r);
        end;
    end;

  procedure spawn(var arr: Vector);
  var
  i : Integer;
  begin
    for i := Low(arr) to High(arr) do
    if (i <> High(arr)) then write(arr[i], ' ')
    else writeln(arr[i]);
  end;

  procedure main();
  var
  arr : Vector;
  begin
     SetLength(arr, 8);
     arr := [99, 56, 21, 88, 56, 3, 11, 16];
     writeln('Array before sorting was :');
     spawn(arr);
     mergesort(arr, 0, 7);
     writeln('');
     writeln('Array after sorting is :');
     spawn(arr);
     readln;
  end;

end.
