Class EMPI.Message.PatientRequest Extends (Ens.Request, %XML.Adaptor)
{

Property Patient As EMPI.Object.Patient;

Storage Default
{
<Data name="PatientRequestDefaultData">
<Subscript>"PatientRequest"</Subscript>
<Value name="1">
<Value>Patient</Value>
</Value>
</Data>
<DefaultData>PatientRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
