unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TNewThread = class(TThread)
  private
   FNumber: integer;
   FMemo: TMemo;
   FWriteFile: String;
   procedure Print;
  protected
   procedure Execute; override;
  public
    property Memo: TMemo read FMemo write FMemo;
    property WriteFile: String read FWriteFile write FWriteFile;
  end;

var
  Form2: TForm2;
  LastNumbers : TStringList;
  MaxNumber: Integer;
implementation

{$R *.dfm}

function simple(n : integer):boolean;
var  r : integer;
begin
if n<2 then result:=false
else
 begin
  r := 2;
  result:=true;
  while (r*r<=n)and result do
  if n mod r=0 then result:=false
  else inc(r);
 end;
end;

function FoundElement(Value:Integer):Boolean;
var i:integer;
begin
  Result:= True;
  for I := 0 to LastNumbers.Count-1 do
  begin
    if(StrToInt(LastNumbers[i]) = Value) then
    begin
      Result:= False;
    end;
  end;
end;

procedure SaveToFile(str:string;FileDir:string);
var
  f:TextFile;
begin
  AssignFile(f,FileDir);
  if not FileExists(FileDir) then
  begin
  Rewrite(f);
  CloseFile(f);
  end;
  Append(f);
  Write(f,str + ' ');
  CloseFile(f);
end;

procedure TNewThread.Print;
begin
  self.Memo.Lines.Add(IntToStr(FNumber));
  SaveToFile(inttostr(self.FNumber) ,'Result.txt');
  SaveToFile(inttostr(self.FNumber), self.FWriteFile);

end;

procedure TNewThread.Execute;
var i:integer;
begin
  for I := 0 to MaxNumber do
  begin
    FNumber:= i;
    if( FoundElement(FNumber) and simple(FNumber) )then
    begin
      LastNumbers.Add(inttostr(FNumber));
      Synchronize(Print);
    end;

  end;
end;



procedure TForm2.Button1Click(Sender: TObject);
var NewThread: array[1..2] of TNewThread;
i:integer;
MemArray: array[1..2] of TMemo;
begin

  MaxNumber:= StrToInt(ComboBox1.Items[Combobox1.ItemIndex]);
  LastNumbers.Clear;
  Memo1.Clear;
  Memo2.Clear;

  MemArray[1]:= Form2.Memo1;
  MemArray[2]:= Form2.Memo2;

  DeleteFile('Result.txt');
  for i:=1 to 2 do
    begin
      DeleteFile('Thread ' + IntToStr(i) + '.txt');
      NewThread[i]:=TNewThread.Create(true);
      NewThread[i].FreeOnTerminate:=true;
      NewThread[i].Resume;
      NewThread[i].Priority:=tpNormal;
      NewThread[i].Memo:= MemArray[i];
      NewThread[i].WriteFile:=  'Thread ' + IntToStr(i) + '.txt';
   end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  LastNumbers:= TStringList.Create;
end;

end.
