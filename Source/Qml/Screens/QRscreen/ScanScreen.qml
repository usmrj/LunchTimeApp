import QtQuick 2.15

import HackHeroesProject


Item
{
    readonly property Gradient darkGrad:

        Gradient
    {
        GradientStop { position: 0.0; color:  "#FAFF00" }
        GradientStop { position: 0.7; color: "transparent" }
        GradientStop { position: 1; color:  "#C57000"  }
    }
    readonly property Gradient lightGrad:

        Gradient
    {
        GradientStop { position: 0.0; color:  "#D3C5DF" }
        GradientStop { position: 1; color:  "#0D2C98"  }
    }

    id: root
    width: parent.width
    height: parent.height / 1.65

    Rectangle
    {
        anchors.fill: parent
        color: Style.isDarkTheme ? "#F2FF8A00" : "#6F25CD"
        radius: 15
    }
    Rectangle
    {
        anchors.fill: parent
        gradient: Style.isDarkTheme ? darkGrad : lightGrad
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
        color: Style.isDarkTheme ? "red" : "purple"
        opacity: 0.2
    }

    Image
    {
        anchors.centerIn: colorburn

        Component.onCompleted:
        {
            source = `https://api.qrserver.com/v1/create-qr-code/?data=${Data.getQrContent()}&size=${colorburn.height * 0.8}x${colorburn.height * 0.8}&format=svg`
        }
    }
}
