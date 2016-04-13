import QtQuick 2.0
import Ubuntu.Components 1.2

Item {
    id:marketlist
    property alias mheight: listview.childrenRect.height

    MarketModel {
        id: marketmodel
        market: "markets"
    }

    ListView {
        id: listview
        anchors.fill: parent
        model: marketmodel.model

        delegate: ListItem {
            id: del
            anchors.topMargin: units.gu(2)
            width: listview.width
            height: layout.childrenRect.height + units.gu(1)

            Rectangle {
                anchors.fill: parent
                color: index%2 == 0 ?  "Azure" : "Beige"
            }

            Column {
                id: layout
                width: listview.width
                spacing: units.gu(1)

                Item {
                    width: parent.width
                    height: mID.height
                    Label { id: mID; x: units.gu(1); text: model.Id; font.bold: index==0}
                    Label { id: mName; text: model.Name; font.bold: index==0;anchors.right:parent.right;anchors.rightMargin: units.gu(1)}
                }
            }
        }
    }
}

