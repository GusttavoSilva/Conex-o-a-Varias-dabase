unit G2Express.View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
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
  FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef,
  G2Express.Model.Usuario, uLibrary;

type
  TForm1 = class(TForm)
    cbxDataBase: TComboBox;
    cbxEmpresa: TComboBox;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnEntrar: TButton;
    FDQuery1: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure cbxDataBaseChange(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  G2Express.Model.ConnectionSQLite,
  uDm,
  G2Express.Model.ConnectionMSSQL,
  G2Express.Controller.Connection,
  G2Express.Model.Empresa;

procedure TForm1.btnEntrarClick(Sender: TObject);
begin
  if TModelUsuario.New.Usuario(edtUsuario.Text).Senha(edtSenha.Text).ValidaUsuario then
  begin
    CodEmpresa:= integer(cbxEmpresa.Items.Objects[cbxEmpresa.ItemIndex]);
    NomeEmpresa:= cbxEmpresa.Text;
  end;
end;

procedure TForm1.cbxDataBaseChange(Sender: TObject);
var
  List: TStringList;
begin

  List := TStringList.Create;
  try
    TModelConnectionSQLite.New.IdDataBase(integer(cbxDataBase.Items.Objects[cbxDataBase.ItemIndex]))
      .ReturnListConnection(List);

    if TModelConnectionMSSQL.New.Connection(DM.FDCon, List) then
    begin
      cbxEmpresa.Enabled := true;
      edtUsuario.Enabled := true;
      edtSenha.Enabled := true;
      TModelEmpresa.New.SearchEmpresa.InsertEmpresaComboBox(cbxEmpresa);
    end;

  finally
    FreeAndNil(List);
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  teste: integer;
begin
  cbxEmpresa.Enabled := false;
  edtUsuario.Enabled := false;
  edtSenha.Enabled := false;
  cbxDataBase.ItemIndex := 0;

  TModelConnectionSQLite.New.SearchDataBase.InsertDataBaseComboBox(cbxDataBase);

  if cbxDataBase.Items.Count = 2 then
  begin
    cbxDataBase.ItemIndex := 1;
    cbxDataBase.Enabled := false;
    cbxDataBaseChange(self);
  end;

  teste := cbxDataBase.Items.Count;

end;

end.
