unit G2Express.Model.ConnectionMSSQL;

interface

uses
  G2Express.Controller.Connection,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  System.SysUtils,
  Vcl.StdCtrls,
  Vcl.Forms,
  System.Classes;

type

  TModelConnectionMSSQL = class(TInterfacedObject, iModelConnectionMSSQL)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConnectionMSSQL;
    function Connection(AConnection: TFDConnection; AList: TStringList): Boolean;
  end;

implementation

{ TModelConnectionMSSQL }

uses
  uDm,
  Vcl.Dialogs,
  G2Express.Model.ConnectionSQLite;

constructor TModelConnectionMSSQL.Create;
begin
end;

destructor TModelConnectionMSSQL.Destroy;
begin
  inherited;
end;

class function TModelConnectionMSSQL.New: iModelConnectionMSSQL;
begin
  result := self.Create;
end;

function TModelConnectionMSSQL.Connection(AConnection: TFDConnection; AList: TStringList): Boolean;
begin

  AConnection.Connected := false;
  try
    AConnection.ConnectionString := ';Password=' + AList[3] + ';DriverID=' + AList[0] + ';User_Name=' + AList[2] +
      ';Database=' + AList[4] + ';Server=' + AList[1] + ';MARS=true';
    AConnection.Connected := true;
    result := true;
  Except
    on E: Exception do
    begin
      result := false;
      ShowMessage('Erro ao conectar ao banco!' + E.Message);
    end;
  end;

end;

end.
