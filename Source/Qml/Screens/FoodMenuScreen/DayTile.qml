import QtQuick 2.15
import QtQuick.Controls

Item
{
    height: 371 / 4
    width: height

    property string innerText

    Rectangle
    {
        height: parent.height
        width: height
        color: "transparent"
        radius: 51 / 4

        border.color: "#FFB800"
        border.width: 4 / 4

        Rectangle
        {
            height: 323 / 4
            width: height
            color: "transparent"
            radius: 31 / 4

            anchors.centerIn: parent

            border.color: "#FF7A00"
            border.width: 9 / 4

            Label
            {
                text: innerText
                color: "#FFB800"
                font
                {
                    pixelSize: 50 / 4
                }

                anchors.centerIn: parent
            }
        }
    }
}
