unit Unit3;
interface

uses
  AltLib_Code, SetupTable, SysUtils, ImmobileQuery, DB;
type
  Unit3 = class
  published
    function GerarId(): String;
  end;

function Unit3.GerarId(): String;
begin
  Result := NewFormatedCode('public', 'Funcionario', 'id', 10, 1);
end;

end.
