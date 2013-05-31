unit TSTs_inkLIFO_20x4_EnumBreak;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLIFO,
     inkLIFO;

type

 tTests_inkLIFO_20x4_EnumBreak= class(tTSTCTC_CORE_inkLIFO)
  protected
    procedure _enumData_CLR(const DATA:pointer; str:NativeInt);
  protected
    function _Enum_FNK_(const Data:pointer; const NODE:pointer):boolean;
  published
    procedure Enumerate_NIL;
    procedure Enumerate_One;
    procedure Enumerate_Two_first;
    procedure Enumerate_Two_last;
    procedure Enumerate_SiX_first;
    procedure Enumerate_SiX_middle;
    procedure Enumerate_SiX_last;
  end;

implementation

type
 rTests_EnumDATA=record
    owner  :tTSTCTC_CORE_inkLIFO;
    counter:NativeUint;
    order  :NativeUint;
  end;
 pTests_EnumDATA=^rTests_EnumDATA;

function tTests_inkLIFO_20x4_EnumBreak._Enum_FNK_(const Data:pointer; const NODE:pointer):boolean;
begin
    result:=true;
    //---
    with pTests_EnumDATA(DATA)^ do begin
      counter:=counter+1;
      result := order<>owner.TST_node_Nmbr(NODE);
    end;
end;

//------------------------------------------------------------------------------

procedure tTests_inkLIFO_20x4_EnumBreak._enumData_CLR(const DATA:pointer; str:NativeInt);
begin
    with pTests_EnumDATA(DATA)^ do begin
      owner  :=SELF;
      counter:=0;
      order  :=str;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tTests_inkLIFO_20x4_EnumBreak.Enumerate_Nil;
var lst:pointer;
    ddd:rTests_EnumDATA;
begin
    STACK:=TST_stack_Create(0);
   _enumData_CLR(@ddd,TST_STACK_Count);
    //--
    lst:=inkLIFO_nodesEnum(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNull  ('wrong enum stop', lst);
    AssertEquals('wrong enum nmbr', TST_STACK_Count,  DDD.counter);
end;

procedure tTests_inkLIFO_20x4_EnumBreak.Enumerate_One;
var lst:pointer;
    ddd:rTests_EnumDATA;
    bbb:integer;
begin
    STACK:=TST_stack_Create(1);
    bbb  :=0;
   _enumData_CLR(@ddd,bbb);
    //--
    lst:=inkLIFO_nodesEnum(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNOTNull('wrong enum stop', lst);
    AssertEquals ('wrong enum nmbr', bbb, TST_node_Nmbr(lst));
end;

procedure tTests_inkLIFO_20x4_EnumBreak.Enumerate_Two_first;
var lst:pointer;
    ddd:rTests_EnumDATA;
    bbb:integer;
begin
    STACK:=TST_stack_Create(2);
    bbb  :=0;
   _enumData_CLR(@ddd,bbb);
    //--
    lst:=inkLIFO_nodesEnum(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNOTNull('wrong enum stop', lst);
    AssertEquals ('wrong enum nmbr', bbb, TST_node_Nmbr(lst));
end;

procedure tTests_inkLIFO_20x4_EnumBreak.Enumerate_Two_last;
var lst:pointer;
    ddd:rTests_EnumDATA;
    bbb:integer;
begin
    STACK:=TST_stack_Create(2);
    bbb  :=1;
   _enumData_CLR(@ddd,bbb);
    //--
    lst:=inkLIFO_nodesEnum(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNOTNull('wrong enum stop', lst);
    AssertEquals ('wrong enum nmbr', bbb, TST_node_Nmbr(lst));
end;

procedure tTests_inkLIFO_20x4_EnumBreak.Enumerate_SiX_first;
var lst:pointer;
    ddd:rTests_EnumDATA;
    bbb:integer;
begin
    STACK:=TST_stack_Create(6);
    bbb  :=0;
   _enumData_CLR(@ddd,bbb);
    //--
    lst:=inkLIFO_nodesEnum(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNOTNull('wrong enum stop', lst);
    AssertEquals ('wrong enum nmbr', bbb, TST_node_Nmbr(lst));
end;

procedure tTests_inkLIFO_20x4_EnumBreak.Enumerate_SiX_middle;
var lst:pointer;
    ddd:rTests_EnumDATA;
    bbb:integer;
begin
    STACK:=TST_stack_Create(6);
    bbb  :=3;
   _enumData_CLR(@ddd,bbb);
    //--
    lst:=inkLIFO_nodesEnum(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNOTNull('wrong enum stop', lst);
    AssertEquals ('wrong enum nmbr', bbb, TST_node_Nmbr(lst));
end;

procedure tTests_inkLIFO_20x4_EnumBreak.Enumerate_SiX_last;
var lst:pointer;
    ddd:rTests_EnumDATA;
    bbb:integer;
begin
    STACK:=TST_stack_Create(6);
    bbb  :=5;
   _enumData_CLR(@ddd,bbb);
    //--
    lst:=inkLIFO_nodesEnum(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNOTNull('wrong enum stop', lst);
    AssertEquals ('wrong enum nmbr', bbb, TST_node_Nmbr(lst));
end;

initialization
    RegisterTest(cTestSuitePath__inkLIFO,tTests_inkLIFO_20x4_EnumBreak);
end.

