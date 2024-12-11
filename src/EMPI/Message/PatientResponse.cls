Class EMPI.Message.PatientResponse Extends (Ens.Response, %XML.Adaptor)
{

Property Patients As list Of EMPI.Object.Patient;

Storage Default
{
<Data name="PatientResponseDefaultData">
<Subscript>"PatientResponse"</Subscript>
<Value name="1">
<Value>Patients</Value>
</Value>
</Data>
<DefaultData>PatientResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
