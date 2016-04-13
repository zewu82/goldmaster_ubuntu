import QtQuick 2.0
import Ubuntu.Components 1.2

/*!
    \brief MainView with a Label and Button elements.
*/

/*!
说明：本代码仅供ubuntu 黑客松 代码示例,不得他用。感谢刘晓国老师在此次活动中给予的指导和帮助。
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "GoldMaster.zewu"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    //    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("GoldMaster.JUST FOR TEST")

        Column{
            id: layout
            spacing: 2
            anchors.fill: parent

                GoldMaster {
                    id:g1
                    width: layout.width;
                    height: g1.mheight
                }

                QuoteList {
                    id:q2
                    width: layout.width;
                    height: q2.myheight
                }
        }
    }
}


