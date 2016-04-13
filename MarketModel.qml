import QtQuick 2.0
import "search.js" as API

Item {
    id:qm
    property string market: ""

    property ListModel model : ListModel { id: quoteModel }
    property alias count: quoteModel.count

    function update(records) {
        console.log("records: " + JSON.stringify(records));

        quoteModel.clear();
        quoteModel.append({"Id":"代码","Name":"名称"});
        for ( var i = 0; i < records.length; i++ ) {

            var r = JSON.stringify(records[i]).split(',');
            if ( r.length === 2 ){
                console.log("record: " + i + " "  + records[i].Id+records[i].Name);
                console.log("record: " + i + " "  + JSON.stringify(records[i]));
                quoteModel.append(records[i]);
            }
        }
    }

    onMarketChanged: {
        console.log("Loading " + market)

        var records = API.Search(market, qm);
    }
}
