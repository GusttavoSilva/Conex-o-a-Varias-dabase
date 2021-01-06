program G2Express;

uses
  Vcl.Forms,
  G2Express.View.Principal in 'Source\View\G2Express.View.Principal.pas' {Form1},
  G2Express.Model.ConnectionSQLite in 'Source\Model\G2Express.Model.ConnectionSQLite.pas',
  G2Express.Controller.Connection in 'Source\Controller\G2Express.Controller.Connection.pas',
  G2Express.Model.ConnectionMSSQL in 'Source\Model\G2Express.Model.ConnectionMSSQL.pas',
  uDm in 'Source\Componente\uDm.pas' {DM: TDataModule},
  G2Express.Model.Empresa in 'Source\Model\G2Express.Model.Empresa.pas',
  G2Express.Controller.Empresa in 'Source\Controller\G2Express.Controller.Empresa.pas',
  G2Express.Model.Usuario in 'Source\Model\G2Express.Model.Usuario.pas',
  G2Express.Controller.Usuario in 'Source\Controller\G2Express.Controller.Usuario.pas',
  uLibrary in 'Source\Core\uLibrary.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
