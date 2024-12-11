Class EMPI.Object.PatientInfo Extends %Persistent
{

Property Name As %String(MAXLEN = 1000);

Property Address As %String(MAXLEN = 1000);

Property Contact As %String(MAXLEN = 1000);

Property BirthDateAndSex As %String(MAXLEN = 1000);

Property VectorizedName As %Vector(DATATYPE = "DECIMAL", LEN = 384);

Property VectorizedAddress As %Vector(DATATYPE = "DECIMAL", LEN = 384);

Property VectorizedContact As %Vector(DATATYPE = "DECIMAL", LEN = 384);

Property VectorizedBirthDateAndSex As %Vector(DATATYPE = "DECIMAL", LEN = 384);

Storage Default
{
<Data name="PatientInfoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Address</Value>
</Value>
<Value name="4">
<Value>Contact</Value>
</Value>
<Value name="5">
<Value>BirthDateAndSex</Value>
</Value>
<Value name="6">
<Value>VectorizedName</Value>
</Value>
<Value name="7">
<Value>VectorizedAddress</Value>
</Value>
<Value name="8">
<Value>VectorizedContact</Value>
</Value>
<Value name="9">
<Value>VectorizedBirthDateAndSex</Value>
</Value>
</Data>
<DataLocation>^EMPI.Object.PatientInfoD</DataLocation>
<DefaultData>PatientInfoDefaultData</DefaultData>
<IdLocation>^EMPI.Object.PatientInfoD</IdLocation>
<IndexLocation>^EMPI.Object.PatientInfoI</IndexLocation>
<StreamLocation>^EMPI.Object.PatientInfoS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
