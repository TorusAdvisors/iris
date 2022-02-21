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

ClassMethod ChunkInsert(gn, jsonString) As %Status
{
    set sc = $$$OK

    set gn = "^"_gn_".1"

    set json = {}.%FromJSON(jsonString)
    set itr = json.%GetIterator()
    while itr.%GetNext(.key,.val) {
        set itrval=val.%GetIterator()
        set lbvalue=""
        while itrval.%GetNext(.lbkey,.lbval) {
            set lbvalue=lbvalue_$lb(lbval)
        }
        set @gn@($i(@gn)) = lbvalue
    }
    return "ok"
}

}
