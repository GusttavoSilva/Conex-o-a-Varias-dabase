object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 361
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cbxDataBase: TComboBox
    Left = 344
    Top = 24
    Width = 145
    Height = 21
    TabOrder = 0
    OnChange = cbxDataBaseChange
    Items.Strings = (
      'Selecione a Base')
  end
  object cbxEmpresa: TComboBox
    Left = 344
    Top = 51
    Width = 145
    Height = 21
    TabOrder = 1
    Text = 'cbxEmpresa'
  end
  object edtUsuario: TEdit
    Left = 344
    Top = 78
    Width = 145
    Height = 21
    TabOrder = 2
    TextHint = 'Usuario'
  end
  object edtSenha: TEdit
    Left = 344
    Top = 105
    Width = 145
    Height = 21
    TabOrder = 3
    TextHint = 'Senha'
  end
  object btnEntrar: TButton
    Left = 376
    Top = 132
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 4
    OnClick = btnEntrarClick
  end
  object FDQuery1: TFDQuery
    Left = 440
    Top = 232
  end
end
