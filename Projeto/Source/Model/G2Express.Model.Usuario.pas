unit G2Express.Model.Usuario;

interface

uses
  System.SysUtils,
  G2Express.Controller.Usuario,
  FireDAC.Comp.Client,
  uDm,
  Vcl.Dialogs, uLibrary;

const

  CONST_VALIDAUSUARIO = 'SELECT * FROM T_USUARIOS WHERE USUARIO = :USUARIO AND SENHA = :SENHA';

type

  TModelUsuario = class(TInterfacedObject, iModelUsuario)
  private
    FQuery  : TFDQuery;
    FUsuario: String;
    FSenha  : String;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelUsuario;
    function Usuario(Value: String): iModelUsuario;
    function Senha(Value: String): iModelUsuario;
    function ValidaUsuario: Boolean;
  end;

implementation

{ TModelUsuario }

constructor TModelUsuario.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DM.FDCon;
  FQuery.FetchOptions.RowsetSize := 50000;
  FQuery.Active := false;
  FQuery.SQL.Clear;
end;

destructor TModelUsuario.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TModelUsuario.New: iModelUsuario;
begin
  result := self.Create;
end;

function TModelUsuario.Senha(Value: String): iModelUsuario;
begin
  result := self;
  FSenha := Value;
end;

function TModelUsuario.Usuario(Value: String): iModelUsuario;
begin
  result := self;
  FUsuario := Value;
end;

function TModelUsuario.ValidaUsuario: Boolean;
begin
  try
    FQuery.SQL.Text := CONST_VALIDAUSUARIO;
    FQuery.ParamByName('USUARIO').AsString := FUsuario;
    FQuery.ParamByName('SENHA').AsString := FSenha;
    FQuery.Open;

    if FQuery.RecordCount <> 0 then
    begin
      CodUsuario := FQuery.FieldByName('COD_USER').AsInteger;
      NomeUsuario:= FQuery.FieldByName('NOME').AsString;
      result := true;
    end
    else
      result := false;

  except
    on E: Exception do
    begin
      result := false;
      showmessage('erro ao fazer loguin' + sLineBreak + E.Message);

    end;

  end;

end;

end.
