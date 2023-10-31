import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Effects

import HackHeroesProject

Item
{
    id: root
    width: parent.width
    height: 179 / 4

    Connections
    {
        target: Data
        function onLoggedIn()
        {
            studentName = Data.getStudentName()
            changeScreenContentText("")
        }
    }

    property string studentName: "Maks"
    property string contentText: ""

    function changeScreenContentText(newText)
    {
        if(newText === "")
            contentText = `<font color="${Style.textColor}">Cześć, </font> <font color="${Style.mainColor}">${studentName}</font>`
        else
            contentText = newText

        textChangeAnimation.start()
    }

    FontLoader
    {
        id: robotoLight
        source: "qrc:/HackHeroesProject/Assets/Fonts/Roboto-Thin.ttf"
    }


    PropertyAnimation
    {
        id: textChangeAnimation
        target: screenContentText
        property: "anchors.verticalCenterOffset"
        from: 0
        to: -root.height + screenContentText.height / 2
        duration: 300
        easing.type: easing.InOutCubic

        onFinished:
        {
            screenContentText.text = contentText
            moveDown.start()
        }
    }

    PropertyAnimation
    {
        id: moveDown
        target: screenContentText
        property: "anchors.verticalCenterOffset"
        from: screenContentText.anchors.verticalCenterOffset
        to: 0
        duration: 300
        easing.type: easing.InOutCubic
    }

    Rectangle
    {
        anchors.top: parent.top
        width: parent.width
        height: parent.height
        color: Style.barColor
        Rectangle
        {
            id: logo
            height: 123 / 4
            width: height
            radius: 41 / 4
            color: Style.mainColor

            anchors
            {
                left: parent.left
                leftMargin: 40 / 4
                verticalCenter: parent.verticalCenter
            }

            Label
            {
                anchors.centerIn: parent
                text: "logo"
                color: "#FFFFFF"
                font.pixelSize: 45 / 4
            }
        }

        Label
        {
            id: timeLabel
            text: DateTime.CurrentTime
            color: Style.textColor
            font
            {
                pixelSize: 54 / 4
                family: robotoLight.font
            }

            anchors
            {
                left: logo.right
                leftMargin: 23 / 4
                bottom: logo.bottom
            }
        }

        Label
        {
            text: DateTime.CurrentDate
            color: Style.textColor
            font
            {
                pixelSize: 30 / 4
                family: robotoLight.font
            }

            anchors
            {
                left: logo.right
                leftMargin: 30 / 4
                bottom: timeLabel.top
            }
        }
        Label
        {
            id: screenContentText
            text: "Zaloguj się"
            color: Style.mainColor
            anchors
            {
                right: parent.right
                rightMargin: 20
                verticalCenter: parent.verticalCenter
            }
            font
            {
                pixelSize: 70 / 4
                family: robotoLight.font
            }
        }

        layer.enabled: true
        layer.effect: MultiEffect
        {
            shadowColor: "black"
            shadowVerticalOffset: 13
            shadowOpacity: 0.3
            shadowEnabled: true
            blurMultiplier: 1
        }
    }
}
