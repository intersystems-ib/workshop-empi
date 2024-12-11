Class EMPI.DT.FromADTToPatient Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, EMPI.Message.PatientRequest) ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EMPI.Message.PatientRequest' sourceDocType='2.5.1:ADT_A05' create='new' language='objectscript' >
<assign value='source.{PID:PatientName(1).GivenName}_" "_source.{PID:PatientName(1).FamilyName.Surname}' property='target.Patient.Name' action='set' />
<assign value='source.{PID:PatientAddress(1).StreetAddress.StreetName}_" "_source.{PID:PatientAddress(1).ZiporPostalCode}_" "_source.{PID:PatientAddress(1).City}_" "_source.{PID:PatientAddress(1).StateorProvince}_" "_source.{PID:PatientAddress(1).Country}' property='target.Patient.Address' action='set' />
<assign value='source.{PID:PhoneNumberHome(1).TelephoneNumber}_" "_source.{PID:PhoneNumberHome(1).EmailAddress}' property='target.Patient.Contact' action='set' />
<assign value='source.{PID:DateTimeofBirth.Time}_" "_source.{PID:AdministrativeSex}' property='target.Patient.BirthDateAndSex' action='set' />
</transform>
}

}
