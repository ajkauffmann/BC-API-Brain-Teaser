page 50901 SomeDataAPIPTE
{
    PageType = API;
    SourceTable = SomeDataPTE;
    DelayedInsert = true;
    APIPublisher = 'cronus';
    APIGroup = 'data';
    APIVersion = 'v1.0';
    EntitySetName = 'somedata';
    EntityName = 'somedatum';
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(records)
            {
                field(id; Rec.SystemId) { Editable = false; }
                field(code; Rec.Code) { Editable = false; }
                field(data; base64Data) { }
                field(lastDateTimeModified; Rec.SystemModifiedAt) { Editable = false; }
            }
        }
    }

    var
        base64Data: Text;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        SomeData: Record SomeDataPTE;
    begin
        SomeData.Init();
        SomeData.Code := SomeData.GetNextCode();
        SomeData.SetData(base64Data);
        SomeData.Insert(true);
        Rec := SomeData;
        exit(false);
    end;

    trigger OnAfterGetRecord()
    begin
        base64Data := Rec.GetData();
    end;
}