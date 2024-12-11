/// 
Class EMPI.BP.FromHL7ToPatientRequestBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' response='EMPI.Message.PatientResponse' height='2000' width='2000' >
<context>
<property name='patientRequest' type='EMPI.Message.PatientRequest' instantiate='1' />
</context>
<sequence xend='200' yend='318' >
<transform name='From HL7 to Patient' class='EMPI.DT.FromADTToPatient' source='request' target='context.patientRequest' xpos='423' ypos='225' />
</sequence>
</process>
}

}
