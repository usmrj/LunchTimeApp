import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle
    {
        anchors.centerIn: parent
        height:100
        width:height
        color: "green"
    }
}
