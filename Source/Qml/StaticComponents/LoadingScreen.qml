import QtQuick 2.15
import QtQuick.Controls

import HackHeroesProject


Item
{
    property real szer: loadingStripe.height * 2
    id: root
    anchors.fill: parent /*&& Style.changeTheme()*/
    Rectangle
    {
        anchors.fill: parent
        color: Style.backgroundColor

        Rectangle
        {
            id: logo
            width: parent.width / 1.75
            height: parent.width / 1.75
            color: Style.mainColor
            radius: 20
            anchors
            {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: parent.height / 5
            }
        }

        Text
        {
            id:loadingText
            font.pixelSize: 28
            color: Style.mainColor
            text: Data.error ? qsTr("Błąd ładowania") : qsTr("Ładowanie")
            anchors
            {
                top: logo.bottom
                topMargin: parent.parent.width / 8
                horizontalCenter: parent.horizontalCenter
            }
        }

        SequentialAnimation
        {
            running: !Data.error
            loops: Animation.Infinite
            PropertyAnimation
            {
                target: loadingText
                property: "text"
                to: "Ładowanie."
                duration: 400
            }
            PropertyAnimation
            {
                target: loadingText
                property: "text"
                to: "Ładowanie.."
                duration: 400
            }
            PropertyAnimation
            {
                target: loadingText
                property: "text"
                to: "Ładowanie..."
                duration: 400
            }
            PropertyAnimation
            {
                target: loadingText
                property: "text"
                to: "Ładowanie"
                duration: 400
            }
        }

        RoundButton
        {
            visible: Data.error
            radius: 78
            width: 510 / 4
            height: 150 / 4
            palette.button: Style.barColor

            contentItem: Text
            {
                text: qsTr("Spróbuj ponownie")
                color: Style.mainColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 13
            }

            anchors.centerIn: loadingBar

            onClicked:
            {
                Data.checkConnection()
            }
        }

        Rectangle
        {
            id: loadingBar
            visible: !Data.error

            anchors
            {
                top: loadingText.bottom
                horizontalCenter: parent.horizontalCenter
                topMargin: loadingText.height * 0.8
            }

            width: parent.width / 1.75
            height: loadingText.height * 0.7
            color: Style.secondaryColor
            border
            {
                width: 4
                color: Style.barColor
            }

            Rectangle
            {
                id:loadingStripe
                anchors.fill: parent
                anchors.margins: parent.border.width
                color: "transparent"
                clip: true
                ParallelAnimation
                {
                    loops: Animation.Infinite
                    running: true
                    NumberAnimation
                    {
                        property: "x"
                        target: rowRow
                        from: 0
                        to: rowRow.width
                        duration: 3500
                    }
                    NumberAnimation
                    {
                        property: "x"
                        target: rowRow1
                        from: -rowRow1.width
                        to: 0
                        duration: 3500
                    }
                }


                Row
                {
                    id: rowRow
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 6
                    width: 14*6+14*6
                    Repeater
                    {
                        model: 14

                        Rectangle
                        {
                            id: mainColorstripe
                            rotation: 30
                            width: 6
                            height: szer
                            color: index % 2 == 0 ? Style.mainColor : Style.barColor
                        }
                    }
                }
                Row
                {
                    id: rowRow1
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 6
                    width: 14*6+14*6
                    Repeater
                    {
                        model: 14

                        Rectangle
                        {
                            id: mainColorstripe1
                            rotation: 30
                            width: 6
                            height: szer
                            color: index % 2 == 0 ? Style.mainColor : Style.barColor
                        }
                    }
                }
            }
        }
    }
    Rectangle
    {
        height: 179 / 4
        width: parent.width
        color: Style.barColor
        anchors.top: parent.top
    }
    Rectangle
    {
        height: 179 / 4
        width: parent.width
        color: Style.barColor
        anchors.bottom: parent.bottom
    }
}

