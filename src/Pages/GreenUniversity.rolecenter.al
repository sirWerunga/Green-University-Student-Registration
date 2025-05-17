page 50131 MyRoleCenter
{
    PageType = RoleCenter;
    Caption = 'My Role Center';

    layout
    {
        area(RoleCenter)
        {
            group(Group1)
            {
                part(Part1; RoleCenterHeadline)
                {
                    ApplicationArea = All;
                }

                part(Part2; SalesInvoiceCuePage)
                {
                    Caption = 'Invoices';
                }
            }
        }
    }


    actions
    {
        area(Sections)
        {
            group(StudentRegistration)
            {
                Caption = 'Student Registration';
                Image = RegisteredDocs;
                action(PostedServiceInvoices)
                {
                    Caption = 'Posted Service Invoices';
                    RunObject = Page "Posted Service Invoices";
                    ApplicationArea = All;
                }

                action(PostedSalesInvoices)
                {
                    Caption = 'Posted Sales Invoices';
                    RunObject = Page "Posted Sales Invoices";
                    ApplicationArea = All;
                }

                group(SalesDocuments)
                {
                    Caption = 'Sales Documents';
                    action("Sales Document Entity")
                    {
                        ApplicationArea = All;
                        RunObject = page "Sales Document Entity";
                    }
                    action("Sales Document Line Entity")
                    {
                        ApplicationArea = All;
                        RunObject = page "Sales Document Line Entity";
                    }
                }
            }
        }

        area(Embedding)
        {

            action(Students)
            {
                Caption = 'Student List';
                RunObject = Page "Student Registration Form List";
                ApplicationArea = All;
            }


        }

        area(Processing)
        {
            action(SeeSalesInvoices)
            {
                Caption = 'See Sales Invoices';
                RunObject = Page "Posted Sales Invoices";
            }

        }

        area(Creation)
        {
            action(AddSalesInvoice)
            {
                Caption = 'Add Sales Invoice';
                Image = NewInvoice;
                RunObject = Page "Sales Invoice";
                RunPageMode = Create;
            }
        }

        // area(Reporting)
        // {
        //     action(SalesInvoicesReport)
        //     {
        //         Caption = 'Sales Invoices Report';
        //         Image = "Report";
        //         RunObject = Report "Sales - Invoice";
        //     }
        // }
    }
}

// Creates a profile that uses the Role Center
profile MyProfile
{
    ProfileDescription = 'Sample Profile';
    RoleCenter = MyRoleCenter;
    Caption = 'Green University';
}