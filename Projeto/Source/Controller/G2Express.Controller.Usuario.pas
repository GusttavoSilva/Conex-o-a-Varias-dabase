unit G2Express.Controller.Usuario;

interface

type
  iModelUsuario = interface
    ['{4CC766B2-A916-4637-AE93-CFCD2C3FCA5A}']
    function Usuario(Value: String): iModelUsuario;
    function Senha(Value: String): iModelUsuario;
    function ValidaUsuario: Boolean;
  end;

implementation

end.
