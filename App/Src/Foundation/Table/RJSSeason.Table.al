table 50000 "RJS Season"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[10])
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Regex: Codeunit Regex;
            begin
                if Code = '' then
                    Error('Code should not be blankS');

                if not Regex.IsMatch(Code, '^[KRS][0-9]{2}$') then
                    Error('Season should start with K, R, or S and last two digits of year');

                if Format(Rec.Code).StartsWith('K') then
                    Rec."Season Type" := Enum::"RJS Season Type"::Kharif
                else if Format(Rec.Code).StartsWith('R') then
                    Rec."Season Type" := Enum::"RJS Season Type"::Rabi
                else if Format(Rec.Code).StartsWith('S') then
                    Rec."Season Type" := Enum::"RJS Season Type"::Summer;
            end;
        }

        field(2; Description; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(3; "Season Type"; Enum "RJS Season Type")
        {
            DataClassification = CustomerContent;
            // Editable = false;
        }

        field(4; "Season Year"; Integer)
        {
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            begin

            end;
        }

        field(5; "Starting Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(6; "Ending Date"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if ("Starting Date" <> 0D) and ("Ending Date" <> 0D) then
                    if "Ending Date" < "Starting Date" then
                        Error('Ending date must be on or after Starting Date.');
            end;
        }

        field(7; Status; Enum "RJS Season Status")
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}