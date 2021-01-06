unit G2Express.Controller.Connection;

interface

uses
  Vcl.StdCtrls,
  System.Classes,
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
  FireDAC.Comp.DataSet;

type

  iModelConnectionSQLite = interface
    ['{575D8A1F-9E48-46E1-8BDD-E1617B827C18}']
    function IdDataBase(Value: Integer): iModelConnectionSQLite;
    function SearchDataBase: iModelConnectionSQLite;
    function InsertDataBaseComboBox(AComboBox: TCombobox): iModelConnectionSQLite;
    function ReturnListConnection(AList: TStringList): iModelConnectionSQLite;

  end;

  iModelConnectionMSSQL = interface
    ['{90AEBD02-2B2B-4E31-BC15-C3426589DE66}']
    function Connection(AConnection: TFDConnection; AList: TStringList): Boolean;
  end;

implementation

end.
