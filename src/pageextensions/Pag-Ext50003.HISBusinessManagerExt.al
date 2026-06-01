pageextension 50003 "EDC HIS Business Manager RC" extends "Business Manager Role Center"
{
    actions
    {
        addbefore(Action39)
        {
            group("EDC HIS Interface")
            {
                Caption = 'HIS Interface';

                group("EDC HIS Setup")
                {
                    Caption = 'Integration Setup';
                    action("EDC Setups")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Integration Setup';
                        Image = Setup;
                        RunObject = Page "EDC Integration Setup";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Integration Setup action.';
                    }
                    group("EDC Masters Setups")
                    {
                        Caption = 'Setups';
                        action("EDC MOP Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'MOP Setup';
                            Image = Setup;
                            RunObject = Page "EDC HIS MOP Revenue Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the MOP Setup action.';
                        }
                        action("EDC Payroll Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Payroll Setup';
                            Image = Setup;
                            RunObject = Page "EDC HIS Payroll Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Payroll Setup action.';
                        }
                        action("EDC Pharmacy Setup")
                        {
                            Visible = false;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Pharmacy Setup';
                            Image = Setup;
                            RunObject = Page "EDC HIS Pharmacy Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Pharmacy Setup action.';
                        }
                        action("EDC Revenue Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Revenue Setup';
                            Image = Setup;
                            RunObject = Page "EDC HIS Revenue Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Revenue Setup action.';
                        }
                        action("EDC Collection Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Collection Setup';
                            Image = Setup;
                            RunObject = Page "EDC HIS Collection Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Collection Setup action.';
                        }
                        action("EDC Consumption Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Consumption Setup';
                            Image = Setup;
                            RunObject = Page "EDC HIS Consumption Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Consumption Setup action.';
                        }
                        action("EDC HIS Doctor Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Doctor Payout Setup';
                            Image = Setup;
                            RunObject = Page "EDC HIS Doctor Payout Setup";
                            RunPageMode = Create;
                            ToolTip = 'Create a new Doctor Payout for HIS Interface.';
                        }
                        action("EDC Settlement Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Settlement Setup';
                            Image = Setup;
                            RunObject = Page "EDC HIS Settlement Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Settlement Setup action.';
                        }
                        action("EDC Payment Advice E-Mail Setups")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Payment Advice E-Mail Setups';
                            Image = Setup;
                            RunObject = Page "EDC HIS E-Mail Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Payment Advice E-Mail Setups action.';
                        }
                    }
                    group("EDC HIS Mapping")
                    {
                        Caption = 'Mapping';

                        action("EDC HIS Item Mapping")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Item Mapping';
                            Image = Setup;
                            RunObject = Page "EDC HIS Item Mapping";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Item Mapping action.';
                        }
                        action("EDC HIS UOM Mapping")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'UOM Mapping';
                            Image = Setup;
                            RunObject = Page "EDC HIS UOM Mapping";
                            RunPageMode = Create;
                            ToolTip = 'Create a new UOM Mapping for HIS Interface.';
                        }
                        action("EDC Profit Center")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Dimension Mapping';
                            Image = Setup;
                            RunObject = Page "EDC HIS Dimension Setup";
                            RunPageMode = Create;
                            ToolTip = 'Create a new Dimension mapping for HIS Interface.';
                        }
                        action("EDC HIS Customer Mapping")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'HIS Customer Mapping';
                            Image = Setup;
                            RunObject = Page "EDC HIS Customer Mapping";
                            RunPageMode = Create;
                            ToolTip = 'Executes the HIS Customer Mapping Setups action.';
                        }
                    }
                    group("Allow Date")
                    {
                        Caption = 'Allow HIS Data Posting Date';
                        action("Allow Posting Date")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Allow HIS Data Posting Date';
                            Image = Setup;
                            RunObject = Page "Allow Posting Date";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Allow Posting Date action.';
                        }
                    }
                }
                group("EDC HIS Masters")
                {
                    Caption = 'Master';

                    group("EDC Masters Create")
                    {
                        Caption = 'Master Create';

                        action("EDC HIS Vendor List")
                        {
                            AccessByPermission = TableData "EDC HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Vendors List';
                            Image = NewOrder;
                            RunObject = Page "EDC HIS Vendor Staging List";
                            RunPageMode = Create;
                            ToolTip = 'Create a new HIS Vendors for items or services.';
                        }
                        action("EDC HIS Doctor List")
                        {
                            AccessByPermission = TableData "EDC HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Doctor List';
                            Image = NewOrder;
                            RunObject = Page "EDC HIS Doctor Staging List";
                            RunPageMode = Create;
                            ToolTip = 'Create a new HIS Doctor for items or services.';
                        }
                        action("EDC HIS Customer List")
                        {
                            AccessByPermission = TableData "EDC HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Customers List';
                            Image = NewOrder;
                            RunObject = Page "EDC HIS Customer Staging List";
                            RunPageMode = Create;
                            ToolTip = 'Create a new Customers for items or services.';
                        }
                        action("EDC HIS Emplooyee List")
                        {
                            AccessByPermission = TableData "EDC HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Employees List';
                            Image = NewOrder;
                            RunObject = Page "EDC HIS Employee Staging List";
                            RunPageMode = Create;
                            ToolTip = 'Check a new Employees for Payroll Entries.';
                        }
                        action("EDC HIS items List")
                        {
                            AccessByPermission = TableData "EDC HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Items List';
                            Image = NewOrder;
                            RunObject = Page "EDC HIS Item List";
                            RunPageMode = Create;
                            ToolTip = 'Create a new Item for Purchase or Sales.';
                        }
                        action("HIS Pending items List")
                        {
                            AccessByPermission = TableData "EDC HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Item Approval Level1';
                            Image = NewOrder;
                            RunObject = Page "EDC HIS Item Pending List";
                            RunPageMode = Create;
                            ToolTip = 'Create a Pending Item for Purchase or Sales.';
                        }
                        action("HIS Approved items List")
                        {
                            AccessByPermission = TableData "EDC HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Item Approval Level2';
                            Image = NewOrder;
                            RunObject = Page "EDC HIS Item Approved List";
                            RunPageMode = Create;
                            ToolTip = 'Create a Approved Item for Purchase or Sales.';
                        }

                    }
                    group("EDC Master Created Successfully")
                    {
                        Caption = 'Master Created Successfully';

                        action("EDC Created HIS Vendor List")
                        {
                            AccessByPermission = TableData "EDC HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Created Vendors List';
                            Image = Archive;
                            RunObject = Page "EDC Posted HIS Vend. Stg. List";
                            RunPageMode = Create;
                            ToolTip = 'Check a new Vendors for items or services.';
                        }
                        action("EDC Created HIS Doctor List")
                        {
                            AccessByPermission = TableData "EDC HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Created Doctor List';
                            Image = Archive;
                            RunObject = Page "EDC Posted HIS Doct. Stg. List";
                            RunPageMode = Create;
                            ToolTip = 'Check a new Doctor for items or services.';
                        }
                        action("EDC Created HIS Customer List")
                        {
                            AccessByPermission = TableData "EDC HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Created Customers List';
                            Image = Archive;
                            RunObject = Page "EDC Posted HIS Customer List";
                            RunPageMode = Create;
                            ToolTip = 'Check a new Customers for items or services.';
                        }
                        action("EDC Created HIS Employee List")
                        {
                            AccessByPermission = TableData "EDC HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Created Employees List';
                            Image = Archive;
                            RunObject = Page "EDC Posted HIS Employee List";
                            RunPageMode = Create;
                            ToolTip = 'Check a new Employees for Payroll Entries.';
                        }
                        action("EDC Created HIS items List")
                        {
                            AccessByPermission = TableData "EDC HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Created Items List';
                            Image = Archive;
                            RunObject = Page "EDC Posted HIS Item List";
                            RunPageMode = Create;
                            ToolTip = 'Check a new Items for Purchase or Sales.';
                        }
                        action("Pending items List")
                        {
                            AccessByPermission = TableData "EDC HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'All Pending Items List';
                            Image = Archive;
                            RunObject = Page "EDC ALL HIS Item List";
                            RunPageMode = Create;
                            ToolTip = 'Check a Pending Items for Purchase or Sales.';
                        }

                    }

                }
                group("EDC HIS Collection Staging")
                {
                    Caption = 'Collection Entries';

                    action("EDC Create HIS Collection Entries")
                    {
                        AccessByPermission = TableData "EDC HIS Revenue Staging Table" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Collection Entries';
                        Image = Archive;
                        RunObject = Page "EDC HIS Revenue Stagging";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Collection Entries for Companies.';
                    }
                    action("EDC Created HIS Collection Entries")
                    {
                        AccessByPermission = TableData "EDC HIS Revenue Staging Table" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Collection Entries';
                        Image = Archive;
                        RunObject = Page "EDC Posted HIS Rev. Stagging";
                        RunPageMode = Create;
                        ToolTip = 'Check a new Collection Entries for Companies.';
                    }

                }
                group("EDC HIS Pharmacy Staging")
                {
                    Caption = 'Pharmacy Entries';
                    Visible = false;

                    action("EDC Create HIS Pharmacy Entries")
                    {
                        AccessByPermission = TableData "EDC HIS Pharmacy Entries" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Pharmacy Entries';
                        Image = Archive;
                        RunObject = Page "EDC HIS Pharmacy Entries";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Pharmacy Entries for Companies.';
                    }


                    action("EDC Created HIS Phamacy Entries")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Phamacy Entries';
                        Image = Archive;
                        RunObject = Page "EDC Posted HIS Pharm. Entries";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Created Phamacy Entries action.';
                    }

                }
                group("EDC HIS Consumption Staging")
                {
                    Caption = 'Consumption Entries';

                    action("EDC Create HIS Consumption Entries")
                    {
                        AccessByPermission = TableData "EDC HIS Consumption Entries" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Consumption Entries';
                        Image = Archive;
                        RunObject = Page "EDC HIS Consumption Entries";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Consumption Entries for Companies.';
                    }


                    action("EDC Created HIS Consumption Ent.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Consumption Entries';
                        Image = Archive;
                        RunObject = Page "EDC Posted HIS Cons. Entries";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Created Consumption Entries action.';
                    }

                }
                group("EDC HIS GRN Entries")
                {
                    Caption = 'GRN Entries';

                    action("EDC HIS GRN")
                    {
                        AccessByPermission = TableData "EDC HIS Purchase Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create GRN';
                        Image = Archive;
                        RunObject = Page "EDC HIS GRN List";
                        RunPageMode = Create;
                        ToolTip = 'Create a new GRN Entries for Vendor.';
                    }
                    action("EDC Created HIS GRN")
                    {
                        AccessByPermission = TableData "EDC HIS Purchase Header" = R;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created GRN';
                        Image = Archive;
                        RunObject = Page "EDC Posted HIS GRN List";
                        RunPageMode = Create;
                        ToolTip = 'Created a GRN Entries for Vendor.';
                    }
                }

                group("EDC HIS GRN Return Entries")
                {
                    Caption = 'GRN Return Entries';

                    action("EDC HIS GRN Return")
                    {
                        AccessByPermission = TableData "EDC HIS Purchase Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create GRN Return';
                        Image = Archive;
                        RunObject = Page "EDC HIS GRN Return List";
                        RunPageMode = Create;
                        ToolTip = 'Create a new GRN Return Entries for Vendor.';
                    }
                    action("EDC Created HIS GRN Return")
                    {
                        AccessByPermission = TableData "EDC HIS Purchase Header" = R;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created GRN Return';
                        Image = Archive;
                        RunObject = Page "EDC Posted HIS GRN Return List";
                        RunPageMode = Create;
                        ToolTip = 'Created a GRN ReturnEntries for Vendor.';
                    }
                }
                group("EDC HIS Revenue Invoice Entries")
                {
                    Caption = 'Revenue Invoice Entries';
                    action("EDC HIS Revenue Invoice")
                    {
                        AccessByPermission = TableData "EDC HIS Revenue Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Revenue Invoice';
                        Image = Archive;
                        RunObject = Page "EDC HIS Revenue List";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Create Revenue Invoice action.';
                    }
                    action("EDC Created HIS Revenue Invoice")
                    {
                        AccessByPermission = TableData "EDC HIS Revenue Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Image = Archive;
                        RunObject = Page "EDC Posted HIS Revenue List";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Created Revenue Invoice action.';
                        Caption = 'Created Revenue Invoice';
                    }
                }
                group("EDC HIS Revenue Cancel Entries")
                {
                    Caption = 'Revenue Cancel Entries';
                    action("EDC HIS Revenue Cancel")
                    {
                        AccessByPermission = TableData "EDC HIS Revenue Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Image = Archive;
                        RunObject = Page "EDC HIS Revenue Cancel List";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Revenue Cancel action.';
                        Caption = 'Create Revenue Cancel';
                    }
                    action("EDC Created HIS Revenue Cancel")
                    {
                        AccessByPermission = TableData "EDC HIS Revenue Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Image = Archive;
                        RunObject = Page "EDC HIS Posted Rev Cancel List";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Created Revenue Cancel action.';
                        Caption = 'Created Revenue Cancel';
                    }
                }
                // group("HIS System Integration")
                // {
                //     Caption = 'System Integration';

                //     action(AkhilSetup)
                //     {
                //         Caption = 'Setup';
                //         ApplicationArea = all;
                //         RunObject = page "EDC Akhil Integration Setup";
                //         ToolTip = 'Executes the Setup action.';
                //     }
                //     action(AkhilSupplerLogs)
                //     {
                //         Caption = 'Supplier Sync Logs';
                //         ApplicationArea = all;
                //         RunObject = page "EDC API Supplier Update Logs";
                //         ToolTip = 'Executes the Supplier Sync Logs action.';
                //     }
                // }

                group("EDC HIS Settlement Staging")
                {
                    Caption = 'Settlement Entries';

                    action("EDC Create HIS Settlement Entries")
                    {
                        AccessByPermission = TableData "EDC HIS Settlement Staging" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Settlement Entries';
                        Image = Archive;
                        RunObject = Page "EDC HIS Settlement Stagging";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Settlement Entries for Companies.';
                    }
                    action("EDC Created HIS Settlement Entries")
                    {
                        AccessByPermission = TableData "EDC HIS Settlement Staging" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Settlement Entries';
                        Image = Archive;
                        RunObject = Page "EDC Posted HIS Sett. Stagging";
                        RunPageMode = Create;
                        ToolTip = 'Check a new Posted Settlement Entries for Companies.';
                    }

                }
                group("EDC HIS Doctor Payout Entries")
                {
                    Caption = 'Doctor Payout Entries';

                    action("EDC Create HIS Doctor Payout Entries")
                    {
                        AccessByPermission = TableData "EDC HIS Doctor Payout" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Doctor Payout Entries';
                        Image = Archive;
                        RunObject = Page "EDC HIS Doctor Payout Entries";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Doctor Payout Entries for Companies.';
                    }
                    action("EDC Created Doctor Payout Entries")
                    {
                        AccessByPermission = TableData "EDC HIS Doctor Payout" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Doctor Payout Entries';
                        Image = Archive;
                        RunObject = Page "EDC Posted HIS Doctor Payout";
                        RunPageMode = Create;
                        ToolTip = 'Check a new Posted Doctor Payout Entries for Companies.';
                    }

                }

                group("EDC HIS Payroll Entries")
                {
                    Caption = 'Payroll Entries';

                    action("EDC Create HIS Payroll Entries")
                    {
                        AccessByPermission = TableData "EDC HIS Payroll Staging" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Payroll Entries';
                        Image = Archive;
                        RunObject = Page "EDC HIS Payroll Entries";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Payroll Entries for Companies.';
                    }
                    action("EDC Created Payroll Entries")
                    {
                        AccessByPermission = TableData "EDC HIS Payroll Staging" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Payroll Entries';
                        Image = Archive;
                        RunObject = Page "EDC Posted HIS Payroll Entries";
                        RunPageMode = Create;
                        ToolTip = 'Check a new Posted Payroll Entries for Companies.';
                    }

                }
                // group("EDC HIS Opex GRN Entries")
                // {
                //     Caption = 'Opex GRN Entries';

                //     action("EDC HIS Opex GRN")
                //     {
                //         AccessByPermission = TableData "EDC HIS Purchase Header" = IMD;
                //         ApplicationArea = Basic, Suite;
                //         Caption = 'Create Opex GRN';
                //         Image = Archive;
                //         RunObject = Page "EDC HIS GRN Opex List";
                //         RunPageMode = Create;
                //         ToolTip = 'Create a new Opex GRN Entries for Vendor.';
                //     }
                //     action("EDC Created HIS Opex GRN")
                //     {
                //         AccessByPermission = TableData "EDC HIS Purchase Header" = R;
                //         ApplicationArea = Basic, Suite;
                //         Caption = 'Created Opex GRN';
                //         Image = Archive;
                //         RunObject = Page "EDC Posted HIS GRN Opex List";
                //         RunPageMode = Create;
                //         ToolTip = 'Created a Opex GRN Entries for Vendor.';
                //     }
                // }
                group("EDC HIS Capex GRN Entries")
                {
                    Caption = 'Capex GRN Entries';

                    action("EDC HIS Capex GRN")
                    {
                        AccessByPermission = TableData "EDC HIS Purchase Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Capex GRN';
                        Image = Archive;
                        RunObject = Page "EDC HIS GRN Capex List";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Capex GRN Entries for Vendor.';
                    }
                    action("EDC Created HIS Capex GRN")
                    {
                        AccessByPermission = TableData "EDC HIS Purchase Header" = R;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Capex GRN';
                        Image = Archive;
                        RunObject = Page "EDC Posted HIS GRN Capex List";
                        RunPageMode = Create;
                        ToolTip = 'Created a Capex GRN Entries for Vendor.';
                    }
                }
            }
        }

        addlast("India Taxation")
        {
            group("Excel Report")
            {
                Caption = 'Excel Report';
                action("Account Ledger Excel")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Account Ledger';
                    Image = Report;
                    RunObject = report "Account Ledger Report Excel";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Account Ledger action.';
                }
                action("Purchase Tax Register Excel")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Tax Register';
                    Image = Report;
                    RunObject = report "Purchase Tax Register";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Purchase Tax Register action.';
                }
                action("Sales Tax Register Excel")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Tax Register';
                    Image = Report;
                    RunObject = report "Sales Tax Register";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Sales Tax Register action.';
                }
            }
            group("Ledger Report")
            {
                Caption = 'Ledger Report';
                action("Voucher Print-Posted")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Voucher Print New';
                    Image = Report;
                    RunObject = report "Posted Voucher - Post Voucher";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Voucher Print-Posted action.';
                }
                action("Vendor Ledger Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendor Ledger Report';
                    Image = Report;
                    RunObject = report "Vendor Ledger Report";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Vendor Ledger Report action.';
                }
                action("Customer Ledger Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer Ledger Report';
                    Image = Report;
                    RunObject = report "Customer Ledger Report";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Customer Ledger Report action.';
                }
                action("Bank Reconciliation Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Reconciliation Report';
                    Image = Report;
                    RunObject = report "Print Bank Reconciliatio Rep.";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Bank Reconciliation Report action.';
                }
                action("TDS Register Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'TDS Register Report';
                    Image = Report;
                    RunObject = report "TDS Register Report";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the TDS Register Report action.';
                }
                action("Vendor - Payment Advice")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendor - Payment Advice';
                    Image = Report;
                    RunObject = report "EDC Vendor - Payment Advice";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Vendor - Payment Advice action.';
                }
                action("Employee Ledger Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Employee Ledger Report';
                    Image = Report;
                    RunObject = report "Employee Ledger";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Employee Ledger Report action.';
                }
                action("Purchase Order Print")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Order Print';
                    Image = Report;
                    RunObject = report "Purchase Order Print";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Purchase Order Print action.';
                }
                // action("Posted Sales Invoice Print")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Posted Sales Invoice Print';
                //     Image = Report;
                //     RunObject = report "GST Sales Invoice Print";
                //     RunPageMode = Edit;
                // }
                action("TCS Register")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'TCS Register';
                    Image = Report;
                    RunObject = report "TCS Register Report";
                    RunPageMode = Edit;
                    ToolTip = 'Executes the TCS Register action.';
                }
            }

            group("Balance Report")
            {
                Caption = 'Balance Report';

                action("Vendor Balance")
                {
                    Caption = 'Vendor Balance';
                    ApplicationArea = All;
                    RunObject = Page "Vendor Balance";
                    ToolTip = 'Executes the Vendor Balance action.';
                }
                action("Customer Balance")
                {
                    Caption = 'Customer Balance';
                    ApplicationArea = All;
                    RunObject = Page "Customer Balance";
                    ToolTip = 'Executes the Customer Balance action.';
                }
                action("Bank Balance")
                {
                    Caption = 'Bank Balance';
                    ApplicationArea = All;
                    RunObject = Page "Bank Balance";
                    ToolTip = 'Executes the Bank Balance action.';
                }
                action("Employee Balance")
                {
                    Caption = 'Employee Balance';
                    ApplicationArea = All;
                    RunObject = Page "Employee Balance";
                    ToolTip = 'Executes the Employee Balance action.';
                }
                action("Update UTR No./RTGS")
                {
                    Caption = 'Update UTR No./RTGS';
                    ApplicationArea = All;
                    RunObject = Page "Update UTR No./RTGS";
                    ToolTip = 'Executes the Update UTR No./RTGS action.';
                }
            }
        }


        //}
        //}
        addbefore(Action39)
        {
            group("LIMS Interface")
            {
                Caption = 'LIMS Interface';

                group("LIMS Setup")
                {
                    Caption = 'LIMS Integration Setup';
                    action("LIMS Setups")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Integration Setup';
                        Image = Setup;
                        RunObject = Page "EDC Integration Setup";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Integration Setup action.';
                    }
                    group("Masters Setups")
                    {
                        Caption = 'LIMS Setups';
                        action("MOP Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'LIMS MOP Setup';
                            Image = Setup;
                            RunObject = Page "EDC LIMS MOP Revenue Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the MOP Setup action.';
                        }
                        action("LIMS Collection Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'LIMS Collection Setup';
                            Image = Setup;
                            RunObject = Page "EDC LIMS Coll. Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Collection Setup action.';
                        }
                        action("LIMS Revenue Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'LIMS Revenue Setup';
                            Image = Setup;
                            RunObject = Page "EDC LIMS Revenue Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Revenue Setup action.';
                        }
                        action("LIMS Post Bill Disc Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Post Bill Disc Setup';
                            Image = Setup;
                            RunObject = Page "LIMS Post Bill Discount Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Post Bill Discount Setup action.';
                        }
                    }
                }
                group("LIMS Collection Staging")
                {
                    Caption = 'LIMS Collection Entries';

                    action("Create LIMS Collection Entries")
                    {
                        AccessByPermission = TableData "EDC HIS Collection Staging" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Collection Entries';
                        Image = Archive;
                        RunObject = Page "EDC HIS Collection Stagging";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Collection Entries for Companies.';
                    }
                    action("Create LIMS Revenue Entries")
                    {
                        AccessByPermission = TableData "EDC HIS Collection Staging" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Revenue Entries';
                        Image = Archive;
                        RunObject = Page "EDC LIMS Revenue Stagging";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Revenue Entries for Companies.';
                    }
                    action("Create LIMS Revenue CN Entries")
                    {
                        AccessByPermission = TableData "EDC HIS Collection Staging" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Revenue Cancel Entries';
                        Image = Archive;
                        RunObject = Page "EDC LIMS Revenue CN Entries";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Revenue Cancel Entries for Companies.';
                    }
                    action("LIMS Created Collection Entries")
                    {
                        AccessByPermission = TableData "EDC HIS Collection Staging" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Collection Entries';
                        Image = Archive;
                        RunObject = Page "EDC Posted HIS Coll. Stagging";
                        RunPageMode = Create;
                        ToolTip = 'Check a new Collection Entries for Companies.';
                    }

                }
                group("LIMS Revenue Invoice Entries")
                {
                    Caption = 'Revenue Invoice Entries';
                    action("LIMS Revenue Invoice")
                    {
                        AccessByPermission = TableData "EDC LIMS Revenue Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Revenue Invoice';
                        Image = Archive;
                        RunObject = Page "EDC LIMS Revenue List";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Create Revenue Invoice action.';
                    }
                    action("LIMS Created Revenue Invoice")
                    {
                        AccessByPermission = TableData "EDC LIMS Revenue Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Image = Archive;
                        RunObject = Page "EDC Posted LIMS Revenue List";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Created Revenue Invoice action.';
                        Caption = 'Created Revenue Invoice';
                    }
                }
                group("LIMS Revenue Cancel Entries")
                {
                    Caption = 'Revenue Cancel Entries';
                    action("LIMS Revenue Cancel")
                    {
                        AccessByPermission = TableData "EDC LIMS Revenue Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Image = Archive;
                        RunObject = Page "EDC LIMS Revenue Cancel List";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Revenue Cancel action.';
                        Caption = 'Create Revenue Cancel';
                    }
                    action("LIMS Created Revenue Cancel")
                    {
                        AccessByPermission = TableData "EDC LIMS Revenue Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Image = Archive;
                        RunObject = Page "EDC LIMS Posted Rev Can. List";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Created Revenue Cancel action.';
                        Caption = 'Created Revenue Cancel';
                    }
                }
                group("LIMS Post Bill Disc Staging")
                {
                    Caption = 'Post Bill Discount Entries';

                    action("Create Post Bill Disc Entries")
                    {
                        AccessByPermission = TableData "LIMS Post Bill Discount" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Post Bill Disc Entries';
                        Image = Archive;
                        RunObject = Page "LIMS Create Post Bill Discount";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Post Bill Disc Entries for Companies.';
                    }
                    action("Created Post Bill Disc Entries")
                    {
                        AccessByPermission = TableData "LIMS Post Bill Discount" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Post Bill Disc Entries';
                        Image = Archive;
                        RunObject = Page "Created Post Bill Discount";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Post Bill Disc Entries for Companies.';
                    }

                }
            }
        }
    }
}


