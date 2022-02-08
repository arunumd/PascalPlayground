program SortAlgorithms;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Sorting in 'Sorting.pas';

begin
  try
    Sorting.main;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
