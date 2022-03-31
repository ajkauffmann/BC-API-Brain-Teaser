table 50900 SomeDataPTE
{
    fields
    {
        field(1; Code; Code[10]) { }
        field(2; Data; Blob) { }
    }

    trigger OnInsert()
    begin
        Rec.Code := GetNextCode();
    end;

    internal procedure GetNextCode() NextCode: Code[10]
    begin
        NextCode := 'DATA' + Format(NumberSequence.Next('SomeDataPTE')).PadLeft(6, '0');
    end;

    internal procedure SetData(Value: Text)
    var
        Base64Convert: Codeunit "Base64 Convert";
        OutStr: OutStream;
    begin
        if Value = '' then
            exit;

        Clear(Rec.Data);
        
        Rec.Data.CreateOutStream(OutStr);
        Base64Convert.FromBase64(Value, OutStr);
    end;
}