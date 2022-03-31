codeunit 50900 SomeDataInstallPTE
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        CreateNumberSequence();
    end;

    local procedure CreateNumberSequence()
    begin
        if not NumberSequence.Exists('SomeDataPTE') then
            NumberSequence.Insert('SomeDataPTE', 0, 1);
    end;
}