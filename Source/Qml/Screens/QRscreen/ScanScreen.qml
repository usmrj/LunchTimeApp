import QtQuick 2.15

Item
{
    id: root
    width: parent.width
    height: parent.height / 1.65

    Rectangle
    {
        anchors.fill: parent
        color: "#F2FF8A00"
        radius: 15
    }
    Rectangle
    {
        anchors.fill: parent
        gradient: Gradient
        {
            GradientStop { position: 0.0; color: "#FAFF00" }
            GradientStop { position: 0.7; color: "transparent" }
            GradientStop { position: 1; color: "#C57000" }
        }
        radius: 15
        opacity: 0.5
    }
    Rectangle
    {
        id: colorburn
        anchors
        {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: parent.height / 7
        }
        width: parent.width /1.2
        height: parent.width /1.2
        radius:  45
        color: "red"
        opacity: 0.2


    }
    Rectangle
    {
        anchors.centerIn: colorburn
        Text
        {
            anchors.centerIn: parent
            text: "QR CODE HERE"
        }
    }


}
