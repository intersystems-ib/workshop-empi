Class EMPI.Object.Patient Extends (%SerialObject, %XML.Adaptor)
{

Property Name As %String(MAXLEN = 1000);

Property Address As %String(MAXLEN = 1000);

Property Contact As %String(MAXLEN = 1000);

Property BirthDateAndSex As %String(MAXLEN = 100);

Property SimilarityName As %Double;

Property SimilarityAddress As %Double;

Property SimilarityContact As %Double;

Property SimilarityBirthDateAndSex As %Double;

Storage Default
{
<Data name="PatientState">
<Value name="1">
<Value>Name</Value>
</Value>
<Value name="2">
<Value>Address</Value>
</Value>
<Value name="3">
<Value>Contact</Value>
</Value>
<Value name="4">
<Value>BirthDateAndSex</Value>
</Value>
<Value name="5">
<Value>SimilarityName</Value>
</Value>
<Value name="6">
<Value>SimilarityAddress</Value>
</Value>
<Value name="7">
<Value>SimilarityContact</Value>
</Value>
<Value name="8">
<Value>SimilarityBirthDateAndSex</Value>
</Value>
</Data>
<State>PatientState</State>
<StreamLocation>^EMPI.Object.PatientS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
