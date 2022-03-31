page 50900 SomeDataListPTE
{
    PageType = List;
    Caption = 'Some Data';
    SourceTable = SomeDataPTE;
    InsertAllowed = false;
    ModifyAllowed = false;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(records)
            {
                field(Code; Rec.Code) { ApplicationArea = All; }
                field(SystemCreatedAt; Rec.SystemCreatedAt) { ApplicationArea = All; }
            }
        }
    }
}