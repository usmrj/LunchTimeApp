import QtQuick 2.15

Item
{
    id: root
    width: parent.width
    height: parent.height / 3 * 2

    Rectangle
    {
        anchors.fill: parent
        color: "red"

        Text
        {
            text: "Scan screen"
            anchors.centerIn: parent
        }
    }
}
