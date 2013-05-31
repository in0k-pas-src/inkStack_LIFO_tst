unit TSTs_inkLIFO_BASE;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry, uTST_CORE_inkLIFO,
     inkLIFO;

type

  {[Type TeST Core Test Case] САМ РОДОначальник тестов}
 tTests_inkLIFO_BASE=class(tTSTCTC_CORE_inkLIFO)
  published
    procedure Init_from_NIL;
    procedure Init_from_Self;
  published
    procedure isEmpty_to_NIL;
    procedure isEmpty_to_Self;
  end;

implementation

procedure tTests_inkLIFO_BASE.Init_from_NIL;
begin
    STACK:=nil;
    //---
    inkLIFO_INIT(STACK);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkLIFO_BASE.Init_from_Self;
begin
    STACK:=self;
    //---
    inkLIFO_INIT(STACK);
    //---
    AssertNull(STACK);
    //---
    STACK:=NIL;
end;

procedure tTests_inkLIFO_BASE.isEmpty_to_NIL;
begin
    STACK:=nil;
    //---
    AssertTrue( inkLIFO_isEmpty(STACK) );
end;

procedure tTests_inkLIFO_BASE.isEmpty_to_Self;
begin
    STACK:=self;
    //---
    AssertFALSE( inkLIFO_isEmpty(STACK) );
    //---
    STACK:=NIL;
end;

initialization
    RegisterTest(cTestSuitePath__inkLIFO,tTests_inkLIFO_BASE);
end.
