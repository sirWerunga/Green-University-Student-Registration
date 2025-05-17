namespace GreenUniversityStudentRegistration.GreenUniversityStudentRegistration;

page 50132 SalesInvoiceCuePage
{
    ApplicationArea = All;
    Caption = 'SalesInvoiceCuePage';
    PageType = CardPart;
    SourceTable = SalesInvoiceCueTable;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field(PrimaryKey; Rec.PrimaryKey)
                {
                    ToolTip = 'Specifies the value of the PrimaryKey field.', Comment = '%';
                }
                field(SalesInvoicesOpen; Rec.SalesInvoicesOpen)
                {
                    ToolTip = 'Specifies the value of the SalesInvoicesOpen field.', Comment = '%';
                }
            }
        }
    }
}
