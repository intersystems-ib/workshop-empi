Class EMPI.BP.VectorizationBP Extends Ens.BusinessProcess
{

Method OnRequest(pInput As EMPI.Message.PatientRequest, Output pOutput As EMPI.Message.PatientResponse) As %Status
{
    try{
        set result = ..VectorizePatient(pInput.Patient.Name, pInput.Patient.Address, pInput.Patient.Contact, pInput.Patient.BirthDateAndSex)
        set pOutput = ##class(EMPI.Message.PatientResponse).%New()
        if (result = 1)
        {
            set sql = "SELECT * FROM (SELECT p1.Name, p1.Address, p1.Contact, p1.BirthDateAndSex, VECTOR_DOT_PRODUCT(p1.VectorizedName, p2.VectorizedName) as SimilarityName, VECTOR_DOT_PRODUCT(p1.VectorizedAddress, p2.VectorizedAddress) as SimilarityAddress, "_
                    "VECTOR_DOT_PRODUCT(p1.VectorizedContact, p2.VectorizedContact) as SimilarityContact, VECTOR_DOT_PRODUCT(p1.VectorizedBirthDateAndSex, p2.VectorizedBirthDateAndSex) as SimilarityBirthDateAndSex "_
                    "FROM EMPI_Object.PatientInfo p1, EMPI_Object.PatientInfo p2 WHERE p2.Name = ? AND p2.Address = ?  AND p2.Contact = ? AND p2.BirthDateAndSex = ?) "_
                    "WHERE SimilarityName > 0.8 AND SimilarityAddress > 0.8 AND SimilarityContact > 0.8 AND SimilarityBirthDateAndSex > 0.8"
            set statement = ##class(%SQL.Statement).%New(), statement.%ObjectSelectMode = 1
            set status = statement.%Prepare(sql)
            if ($$$ISOK(status)) {
                set resultSet = statement.%Execute(pInput.Patient.Name, pInput.Patient.Address, pInput.Patient.Contact, pInput.Patient.BirthDateAndSex)
                if (resultSet.%SQLCODE = 0) {
                    while (resultSet.%Next() '= 0) {
                        set patient = ##class(EMPI.Object.Patient).%New()
                        set patient.Name = resultSet.%GetData(1)
                        set patient.Address = resultSet.%GetData(2)
                        set patient.Contact = resultSet.%GetData(3)
                        set patient.BirthDateAndSex = resultSet.%GetData(4)
                        set patient.SimilarityName = resultSet.%GetData(5)
                        set patient.SimilarityAddress = resultSet.%GetData(6)
                        set patient.SimilarityContact = resultSet.%GetData(7)
                        set patient.SimilarityBirthDateAndSex = resultSet.%GetData(8)
                        do pOutput.Patients.Insert(patient)
                    }
                }
            }
        }
    }
    catch ex {
        do ex.Log()
    }
    return $$$OK
}

Method VectorizePatient(name As %String, address As %String, contact As %String, birthDateAndSex As %String) As %String [ Language = python ]
{
    import iris
    import os
    import sentence_transformers

    try :
        if not os.path.isdir('/iris-shared/model/'):
            model = sentence_transformers.SentenceTransformer('sentence-transformers/all-MiniLM-L6-v2')            
            model.save('/iris-shared/model/')
        model = sentence_transformers.SentenceTransformer("/iris-shared/model/")
        embeddingName = model.encode(name, normalize_embeddings=True).tolist()
        embeddingAddress = model.encode(address, normalize_embeddings=True).tolist()
        embeddingContact = model.encode(contact, normalize_embeddings=True).tolist()
        embeddingBirthDateAndSex = model.encode(birthDateAndSex, normalize_embeddings=True).tolist()

        stmt = iris.sql.prepare("INSERT INTO EMPI_Object.PatientInfo (Name, Address, Contact, BirthDateAndSex, VectorizedName, VectorizedAddress, VectorizedContact, VectorizedBirthDateAndSex) VALUES (?,?,?,?, TO_VECTOR(?,DECIMAL), TO_VECTOR(?,DECIMAL), TO_VECTOR(?,DECIMAL), TO_VECTOR(?,DECIMAL))")
        rs = stmt.execute(name, address, contact, birthDateAndSex, str(embeddingName), str(embeddingAddress), str(embeddingContact), str(embeddingBirthDateAndSex))
        return "1"
    except Exception as err:
        iris.cls("Ens.Util.Log").LogInfo("EMPI.BP.VectorizationBP", "VectorizePatient", repr(err))
        return "0"
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
