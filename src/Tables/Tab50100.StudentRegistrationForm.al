table 50114 "Student Registration Form"
{
    Caption = 'Student Registration Form';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Code[50])
        {
            Caption = 'Entry No.';
            Editable = false;
        }
        field(2; "Full Name"; Text[200])
        {
            Caption = 'Full Name';
            NotBlank = true;

            trigger OnValidate() //Name cannot contain numbers
            var
                i: Integer;
                c: Char;
            begin
                for i := 1 to StrLen("Full Name") do begin
                    c := "Full Name"[i];
                    if (c in ['0'..'9']) then
                        Error('Full Name cannot contain numbers.');
                end;
            end;
        }
        field(3; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
            NotBlank = true;

            trigger OnValidate() //Date of Birth cannot be in the future and must be at least 18 years old
            var
                MinAge: Integer;
                Today: Date;
                MinAllowedDOB: Date;
            begin
                MinAge := 18;
                Today := Today;
                if "Date of Birth" > Today then
                    Error('Date of Birth cannot be in the future.');
                MinAllowedDOB := CalcDate('-16Y', Today);
                if "Date of Birth" > MinAllowedDOB then
                    Error('Student must be at least %1 years old.', MinAge);
            end;
        }
        field(4; Gender; Enum "Gender Enum")
        {
            Caption = 'Gender';
            NotBlank = true;
        }
        field(5; Nationality; Enum "Nationality Enum")
        {
            Caption = 'Nationality';
            NotBlank = true;
        }
        field(6; "Marital Status"; Enum "Marital Status Enum")
        {
            Caption = 'Marital Status';
        }
        field(7; Religion; Enum "Religion Enum")
        {
            Caption = 'Religion';
        }
        field(8; "Identification Number"; Integer)
        {
            Caption = 'Identification Number';
            NotBlank = true;
            trigger OnValidate() //Identification Number must have at least 8 digits.
            begin
                if StrLen(Format("Identification Number")) < 8 then
                    Error('Identification Number must have at least 8 digits.');
            end;
        }
        field(9; "Present Address"; Text[200])
        {
            Caption = 'Present Address';
        }
        field(10; "Permanent Address"; Text[200])
        {
            Caption = 'Permanent Address';
        }
        field(11; "Phone Number"; Integer) 
        {
            Caption = 'Phone Number';
            NotBlank = true;

            trigger OnValidate()//Phone Number must be 9 digits and start with 7
            var
                PhoneStr: Text[20];
            begin
                PhoneStr := Format("Phone Number");
                if StrLen(PhoneStr) <> 9 then
                    Error('Phone Number must have exactly 9 digits.');
                if CopyStr(PhoneStr, 1, 1) <> '7' then
                    Error('Phone Number must start with 7.');
            end;
        }
        field(12; "Email Address"; Text[200])
        {
            Caption = 'Email Address';
            NotBlank = true;

            trigger OnValidate() //Email Address must contain '@' and '.' and cannot be empty
            var
                AtPos: Integer;
                DotPos: Integer;
            begin
                AtPos := StrPos("Email Address", '@');
                DotPos := StrPos("Email Address", '.');

                if (AtPos = 0) or (DotPos = 0) or (AtPos = 1) or (DotPos <= AtPos + 1) or (DotPos = StrLen("Email Address")) then
                    Error('Please enter a valid email address.');
            end;
        }
        field(13; "Emegency Contact Name"; Text[200])
        {
            Caption = 'Emegency Contact Name';
            NotBlank = true;
        }
        field(14; "Emergency Contact Relationship"; Enum "Emergency No Relationship Enum")
        {
            Caption = 'Emergency Contact Relationship';
        }
        field(15; "Emergency Contact Number"; Integer)
        {
            Caption = 'Emergency Contact Number';
            NotBlank = true;

            trigger OnValidate() //Emergency Contact Number must be 9 digits and start with 7
            var
                PhoneStr: Text[20];
            begin
                PhoneStr := Format("Emergency Contact Number");
                if StrLen(PhoneStr) <> 9 then
                    Error('Emergency Contact Number must have exactly 9 digits.');
                if CopyStr(PhoneStr, 1, 1) <> '7' then
                    Error('Emergency Contact Number must start with 7.');
            end;
        }
        field(16; "Admission Number"; Code[100])
        {
            Caption = 'Admission Number';
                        Editable = false;

        }
        field(17; "Course/Program Enrolled"; Enum "Course Enrolled Enum")
        {
            Caption = 'Course/Program Enrolled';
        }
        field(18; Specialization; Text[300])
        {
            Caption = 'Specialization';
        }
        field(19; "Academic Year"; Enum "Academic Year Enum")
        {
            Caption = 'Academic Year';
        }
        field(20; "Enrollment Date"; Date)
        {
            Caption = 'Enrollment Date';
            NotBlank = true;

            trigger OnValidate()
            begin
                if "Enrollment Date" <> Today then
                    Error('Enrollment Date must be the current date.');
            end;
        }
        field(21; "Mode of Study"; Enum "Mode of Study Enum")
        {
            Caption = 'Mode of Study';
        }
        field(22; "Father's Name"; Text[300])
        {
            Caption = 'Father''s Name';
        }
        field(23; "Mother's Name"; Text[300])
        {
            Caption = 'Mother''s Name';
        }
        field(24; "Guardian Name(if applicable)"; Text[300])
        {
            Caption = 'Guardian Name(if applicable)';
        }
        field(25; "Guardian Relationship"; Enum "Guardian Relationship Enum")
        {
            Caption = 'Guardian Relationship(if applicable)';
        }
        field(26; "Parent/Guardian's Occupation"; Text[300])
        {
            Caption = 'Parent/Guardian''s Occupation';
        }
        field(27; "Parent/Guardian Phone Number"; Integer)
        {
            Caption = 'Parent/Guardian Phone Number';

            trigger OnValidate() //Parent/Guardian Phone Number must be 9 digits and start with 7
            var
                PhoneStr: Text[20];
            begin
                PhoneStr := Format("Parent/Guardian Phone Number");
                if StrLen(PhoneStr) <> 9 then
                    Error('Parent/Guardian Phone Number must have exactly 9 digits.');
                if CopyStr(PhoneStr, 1, 1) <> '7' then
                    Error('Parent/Guardian Phone Number must start with 7.');
            end;
        }
        field(28; "Parent/Guardian Email"; Text[300])
        {
            Caption = 'Parent/Guardian Email';
            trigger OnValidate() //Parent/Guardian Email must contain '@' and '.' and cannot be empty
            var
                AtPos: Integer;
                DotPos: Integer;
            begin
                AtPos := StrPos("Parent/Guardian Email", '@');
                DotPos := StrPos("Parent/Guardian Email", '.');

                if (AtPos = 0) or (DotPos = 0) or (AtPos = 1) or (DotPos <= AtPos + 1) or (DotPos = StrLen("Parent/Guardian Email")) then
                    Error('Please enter a valid email address.');
            end;
        }
        field(29; "Upload Passport Photo"; Blob)
        {
            Caption = 'Upload Passport Photo';
            Subtype =Bitmap;
        }
        field(30; "Upload Id Photo"; Blob)
        {
            Caption = 'Upload Id Photo';
            Subtype =Bitmap;
        }
        field(31; "Scholarship/Financial Aid"; Enum "Scholarship/Financial Aid Enum")
        {
            Caption = 'Scholarship/Financial Aid';
        }
        field(32; "Scholarship Details"; Text[300])
        {
            Caption = 'Scholarship Details';
        }
        field(33; "Bank Name"; Enum "Bank Name Enum")
        {
            Caption = 'Bank Name';
        }
        field(34; "Account Number"; Integer)
        {
            Caption = 'Account Number';
        }
        field(35; "Medical Condition(if any)"; Text[300])
        {
            Caption = 'Medical Condition(if any)';
        }
        field(36; "Doctor's Contact"; Integer)
        {
            Caption = 'Doctor''s Contact';
        }
        field(37; "Hostel Accomodation"; Enum "Hostel Accomodation Enum")
        {
            Caption = 'Hostel Accomodation';
        }
        field(38; "Transport Facility"; Enum "Transport Facility Enum")
        {
            Caption = 'Transport Facility';
        }
        field(39; "Extracurricular Interests "; Text[500])
        {
            Caption = 'Extracurricular Interests ';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    
}
