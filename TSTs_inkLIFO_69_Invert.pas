unit TSTs_inkLIFO_69_Invert;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLIFO,
     inkLIFO;

type

 tTests_inkLIFO_69_Invert= class(tTSTCTC_CORE_inkLIFO)
  protected
    procedure _test_ASC;
    procedure _test_DSC;
  published
    procedure Invert_Nil;
    procedure Invert_One;
    procedure Invert_Two;
    procedure Invert_SiX;
  end;

implementation

procedure tTests_inkLIFO_69_Invert._test_ASC;
begin
   AssertNotNull('ASC wrong STACK==nil', STACK);
   AssertEquals ('ASC wrong START node', TST_STACK_Count-1,TST_node_Nmbr(STACK));
end;

procedure tTests_inkLIFO_69_Invert._test_DSC;
begin
   AssertNotNull('DSC wrong STACK==nil', STACK);
   AssertEquals ('DSC wrong START node', 0,TST_node_Nmbr(STACK));
end;

//------------------------------------------------------------------------------

procedure tTests_inkLIFO_69_Invert.Invert_Nil;
begin
    STACK:=TST_stack_Create(0);
    //---
    inkLIFO_Invert(STACK);
    AssertNull('wrong STACK<>nil', STACK);
    //---
    inkLIFO_Invert(STACK);
    AssertNull('wrong STACK<>nil', STACK);
end;

procedure tTests_inkLIFO_69_Invert.Invert_One;
begin
    STACK:=TST_stack_Create(1);
    //---
    inkLIFO_Invert(STACK);
   _test_DSC;
    //---
    inkLIFO_Invert(STACK);
   _test_ASC;
end;

procedure tTests_inkLIFO_69_Invert.Invert_Two;
begin
    STACK:=TST_stack_Create(2);
    //---
    inkLIFO_Invert(STACK);
   _test_DSC;
    //---
    inkLIFO_Invert(STACK);
   _test_ASC;
end;

procedure tTests_inkLIFO_69_Invert.Invert_SiX;
begin
    STACK:=TST_stack_Create(6);
    //---
    inkLIFO_Invert(STACK);
   _test_DSC;
    //---
    inkLIFO_Invert(STACK);
   _test_ASC;
end;

initialization
    RegisterTest(cTestSuitePath__inkLIFO,tTests_inkLIFO_69_Invert);
end.

