unit G2Express.Model.ConnectionSQLite;

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

const

  CONST_SEARCHDATABASE = 'SELECT * FROM DATA_BASE';

  CONST_RETURNLISTCONNECTION = 'select  cs.driver_name , cs.servidor, cs.usuario, cs.senha, db.name_base ' +
    'from data_base db left join connection_server cs on (db.id_servidor = cs.id) where db.id = :IDDATABASE';

type

  TModelConnectionSQLite = class(TInterfacedObject, iModelConnectionSQLite)
  private
    FConnection: TFDConnection;
    FQuery     : TFDQuery;

    FIdDataBase: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConnectionSQLite;

    function IdDataBase(Value: Integer): iModelConnectionSQLite;
    function SearchDataBase: iModelConnectionSQLite;
    function InsertDataBaseComboBox(AComboBox: TCombobox): iModelConnectionSQLite;
    function ReturnListConnection(AList: TStringList): iModelConnectionSQLite;
  end;

implementation

uses
  Vcl.Dialogs;

{ TModelConnectionSQLite }

constructor TModelConnectionSQLite.Create;
begin
  FConnection := TFDConnection.Create(nil);
  FConnection.DriverName := 'SQLite';
  FConnection.Params.Values['Database'] := ExtractFilePath(Application.ExeName) + '\Connection\G2ExpressConnection.db';
  FConnection.Connected := True;

  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConnection;
  FQuery.FetchOptions.RowsetSize := 50000;
  FQuery.Active := false;
  FQuery.SQL.Clear;
end;

destructor TModelConnectionSQLite.Destroy;
begin
  FreeAndNil(FConnection);
  FreeAndNil(FQuery);
  inherited;
end;

class function TModelConnectionSQLite.New: iModelConnectionSQLite;
begin
  result := self.Create;
end;

function TModelConnectionSQLite.IdDataBase(Value: Integer): iModelConnectionSQLite;
begin
  result := self;
  FIdDataBase := Value;
end;

function TModelConnectionSQLite.SearchDataBase: iModelConnectionSQLite;
begin
  result := self;
  FQuery.Open(CONST_SEARCHDATABASE);
end;

function TModelConnectionSQLite.InsertDataBaseComboBox(AComboBox: TCombobox): iModelConnectionSQLite;
var
  i: Integer;
begin
  result := self;
  for i := 0 to FQuery.RecordCount - 1 do
  begin
    AComboBox.AddItem(FQuery.FieldByName('name_base').AsString, TObject(FQuery.FieldByName('id').AsInteger));
    FQuery.Next;
  end;
end;

function TModelConnectionSQLite.ReturnListConnection(AList: TStringList): iModelConnectionSQLite;
var
  i: Integer;
begin
  result := self;

  FQuery.SQL.Text := CONST_RETURNLISTCONNECTION;
  FQuery.ParamByName('IDDATABASE').AsInteger := FIdDataBase;
  FQuery.Open;

  if FQuery.RecordCount = 0 then
  begin
    showmessage('Nenhum registo encontrado!');
  end;

  for i := 0 to FQuery.FieldCount - 1 do
  begin
    AList.Add(FQuery.Fields[i].AsString);
    FQuery.Next;
  end;
end;

end.
