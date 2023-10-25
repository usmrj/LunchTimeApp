import QtQuick 2.15
import QtQuick.Layouts

Item {
    id: root
    anchors.fill: parent

    property real iconHeight: 300/4

    ColumnLayout {
        width: parent.width * 0.6990740740740741
        anchors.topMargin: 554 / 4
        anchors.horizontalCenter: parent.horizontalCenter
            Rectangle
            {
                id: good
                height: iconHeight
                width: height
                radius: height / 2
                color: "green"
                Layout.alignment: Qt.AlignRight
            }


            Rectangle
            {
                id: middle
                height: iconHeight
                width: height
                radius: height / 2
                color: "yellow"
                Layout.alignment: Qt.AlignHCenter
            }


            Rectangle
            {
                id: bad
                height: iconHeight
                width: height
                radius: height / 2
                color: "red"
                Layout.alignment: Qt.AlignLeft
            }

    }

//    Rectangle
//    {
//        id: good
//        height: iconHeight
//        width: height
//        radius: height / 2
//        color: "green"
//        anchors.centerIn: parent
//    }

//    Rectangle
//    {
//        id: mid
//        height: iconHeight
//        width: height
//        radius: height / 2
//        color: "yellow"

//        anchors
//        {
//            top: good.bottom
//            topMargin: -width / 2
//            right:good.left
//            rightMargin: -width / 2
//        }
//    }

//    Rectangle
//    {
//        id: bad
//        height: iconHeight
//        width: height
//        radius: height / 2
//        color: "red"

//        anchors
//        {
//            top: mid.bottom
//            right:mid.left
//            rightMargin: -width / 2
//        }
//    }
}
