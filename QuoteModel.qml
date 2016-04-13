import QtQuick 2.0
import "search.js" as API

Item {
    id:qmdyna
    property string obj: ""

    property ListModel model : ListModel { id: quoteModel }
    property alias count: quoteModel.count

    function createDyna(r) {
        return {
                "Obj":r.Obj,
                "Open":JSON.stringify(r.Dynas.OpenPrice[0]),
                "High":JSON.stringify(r.Dynas.HighestPrice[0]),
                "Low":JSON.stringify(r.Dynas.LowestPrice[0]),
                "New":JSON.stringify(r.Dynas.LastPrice[0]),
                "Vol":JSON.stringify(r.Dynas.Volume[0]),
                "Amount":JSON.stringify(r.Dynas.Amount[0])
               };
    }

    function update(records) {
        //console.log("records: " + JSON.stringify(records));

        quoteModel.clear();

        //Column 7
        quoteModel.append({"Obj":"Obj","Open":"Open","High":"High","Low":"Low","New":"New","Vol":"Vol","Amount":"Amount"});
        quoteModel.append(createDyna(records.Data[0]));

        console.log("record:" + JSON.stringify(createDyna(records.Data[0])));
    }

    onObjChanged: {
        console.log("Loading Obj " + obj)

        var records = API.Search(obj, qmdyna);
    }
}
