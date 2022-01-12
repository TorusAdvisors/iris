Class dc.torus.Storage
{

ClassMethod Test() As %Status
{
    return "It works!"
}

ClassMethod Sql(data) As %Status
{
    set sc = $$$OK

    set buffer=##class(%Stream.TmpCharacter).%New()

    set sc=##class(%ZEN.Auxiliary.jsonSQLProvider).%WriteJSONStreamFromSQL(buffer, data, "tw", 0, 1)

    If $$$ISERR(sc) {
       return $SYSTEM.Status.GetErrorText(sc)
    }

    return buffer.Read()
}

}
