import QtQuick 2.0
import Ubuntu.Components 1.2

Item {
    id:quotelist
    property alias myheight: lvquote.childrenRect.height

    QuoteModel {
        id: quotemodel
        obj: "dyna?obj=Au(T+D).SGE"
    }

    ListView {
        id: lvquote
        anchors.fill: parent
        model: quotemodel.model

        delegate: ListItem {
            id: dyli
            width: lvquote.width
            height: dylic.childrenRect.height + units.gu(1)

            Column {
                id: dylic
                width: lvquote.width
                spacing: units.gu(1)

                //"Open":r.OpenPrice,
                //"High": r.HighestPrice,
                //"Low":r.LowestPrice,
                //"New":r.LastPrice,
                //"Vol":r.Volume,
                //"Amount":r.Amount
                Item {
                    width: parent.width
                    height: mObj.height
                    Label { id: mObj; x: units.gu(1); text: model.Obj; font.bold: index==0}
                    Label { id: mOpen; x: dyli.ListView.view.width*2/9; text: model.Open; font.bold: index==0}
                    Label { id: mHigh; x: dyli.ListView.view.width*3/9; text: model.High; font.bold: index==0 }
                    Label { id: mLow; x: dyli.ListView.view.width*4/9; text: model.Low; font.bold: index==0 }
                    Label { id: mNew; x: dyli.ListView.view.width*5/9; text: model.New; font.bold: index==0 }
                    Label { id: mVol; x: dyli.ListView.view.width*6/9; text: model.Vol; font.bold: index==0 }
                    Label { id: mAmount; text: model.Amount; font.bold: index==0;anchors.right:parent.right;anchors.rightMargin: units.gu(1)}
                }
            }
        }
    }
}

