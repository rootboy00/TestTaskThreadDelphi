object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 374
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 253
    Top = 301
    Width = 71
    Height = 23
    Caption = #1054#1090' 0 '#1076#1086' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 1
    Width = 92
    Height = 25
    Caption = 'Thread 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 216
    Top = 1
    Width = 92
    Height = 25
    Caption = 'Thread 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 296
    Width = 185
    Height = 41
    Caption = #1047#1072#1087#1091#1089#1082
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 48
    Width = 185
    Height = 233
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 216
    Top = 48
    Width = 185
    Height = 233
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 330
    Top = 306
    Width = 71
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 3
    Text = '1000000'
    Items.Strings = (
      '1000000'
      '100000'
      '10000'
      '1000'
      '500'
      '100'
      '20')
  end
end
