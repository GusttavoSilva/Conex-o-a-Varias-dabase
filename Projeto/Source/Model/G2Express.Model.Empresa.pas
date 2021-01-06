unit G2Express.Model.Empresa;

interface

uses
  G2Express.Controller.Empresa,
  uDm,
  FireDAC.Comp.Client,
  Vcl.StdCtrls;

const

  CONST_SEARCHEMPRESA = 'select cod_unid, nome_fant from t_unidade';

type

  TModelEmpresa = class(TInterfacedObject, iModelEmpresa)
  private
    FQuery     : TFDQuery;
    FCodEmpresa: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelEmpresa;

    function SearchEmpresa: iModelEmpresa;
    function InsertEmpresaComboBox(AComboBox: TCombobox): iModelEmpresa;
  end;

implementation

uses
  System.SysUtils;

{ TModelEmpresa }

constructor TModelEmpresa.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DM.FDCon;
  FQuery.FetchOptions.RowsetSize := 50000;
  FQuery.Active := false;
  FQuery.SQL.Clear;
end;

destructor TModelEmpresa.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TModelEmpresa.New: iModelEmpresa;
begin
  result := self.Create;
end;

function TModelEmpresa.SearchEmpresa: iModelEmpresa;
begin
  result := self;
  FQuery.Open(CONST_SEARCHEMPRESA);
end;

function TModelEmpresa.InsertEmpresaComboBox(AComboBox: TCombobox): iModelEmpresa;
var
  i: Integer;
begin
  result := self;
  for i := 0 to FQuery.RecordCount - 1 do
  begin
    AComboBox.AddItem(FQuery.FieldByName('nome_fant').AsString, TObject(FQuery.FieldByName('cod_unid').AsInteger));
    FQuery.Next;
  end;
end;

end.
