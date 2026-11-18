page 50999 "RJS project demo page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "RJS Season";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Season Type"; Rec."Season Type")
                {
                    ApplicationArea = All;
                }

                field("Season Year"; Rec."Season Year")
                {
                    ApplicationArea = All;
                }

                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                }

                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}