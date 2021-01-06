unit G2Express.Controller.Empresa;

interface

uses
  Vcl.StdCtrls;

type

  iModelEmpresa = interface
    ['{F0D41B86-22DA-463B-ABF2-F19CD7FCF3CC}']
    function SearchEmpresa: iModelEmpresa;
    function InsertEmpresaComboBox(AComboBox: TCombobox): iModelEmpresa;
  end;

implementation

end.
