import QtQuick 2.15
import QtQuick.Layouts

import HackHeroesProject

Item
{
    id: root
    anchors.fill: parent

    property real iconHeight: 300/4
    property bool infoBoxOpened: false
    property Image optionSelected
    property bool bShowDish: DateTime.getCurrentDay() > 5
    property int currentDayOfWeek: DateTime.getCurrentDay()
    property bool enableClicks: true
    property bool acceptButtonActive: false

    property string mainDish: ""
    property string secondDish: ""
    property string firstIngr: ""
    property string secondIngr: ""

    Connections
    {
        target: Data
        function onMenuUpdated()
        {
            mainDish = Data.getDish(currentDayOfWeek, 1)
            secondDish = Data.getDish(currentDayOfWeek, 2)
            firstIngr = Data.getDish(currentDayOfWeek, 3)
            secondIngr = Data.getDish(currentDayOfWeek, 4)
        }

        function onSurveyDataUpdated(surveyChoice)
        {
            if(surveyChoice !== 0)
            {
                switch(surveyChoice)
                {
                case 1:
                    optionSelected = bad
                    break
                case 2:
                    optionSelected = middle
                    break
                case 3:
                    optionSelected = bad
                    break
                default:
                    break
                }
                enableClicks = false
            }
        }
    }

    Image
    {
        source: Style.isDarkTheme ? `data:image/svg+xml, <svg width="${height}" height="${height}" viewBox="0 0 70 70" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="35" cy="35" r="35" fill="#D67300"/><path d="M32.9975 56.08C32.9975 56.8267 32.4642 57.2 31.3975 57.2C29.7175 57.2 28.5708 56.88 27.9575 56.24C27.3442 55.5733 27.0375 54.4667 27.0375 52.92C27.0642 50.52 27.7175 46.68 28.9975 41.4C30.3042 36.12 31.5308 32.2 32.6775 29.64C32.9708 28.9733 33.3842 28.3467 33.9175 27.76C34.4508 27.1467 35.1575 26.84 36.0375 26.84C36.4108 26.84 36.7175 27.0667 36.9575 27.52C37.2242 27.9733 37.3575 28.4933 37.3575 29.08C37.3575 29.6667 37.2508 30.5467 37.0375 31.72C36.8242 32.8667 36.5575 34.1867 36.2375 35.68C35.9175 37.1733 35.5575 38.7867 35.1575 40.52C33.7175 47.1067 32.9975 52.2933 32.9975 56.08Z" fill="black"/><circle cx="38" cy="18" r="4" fill="black"/></svg>`
                                  : `data:image/svg+xml, <svg width="${height}" height="${height}" viewBox="0 0 70 70" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="35" cy="35" r="35" fill="#7636FF"/><path d="M32.9975 56.08C32.9975 56.8267 32.4642 57.2 31.3975 57.2C29.7175 57.2 28.5708 56.88 27.9575 56.24C27.3442 55.5733 27.0375 54.4667 27.0375 52.92C27.0642 50.52 27.7175 46.68 28.9975 41.4C30.3042 36.12 31.5308 32.2 32.6775 29.64C32.9708 28.9733 33.3842 28.3467 33.9175 27.76C34.4508 27.1467 35.1575 26.84 36.0375 26.84C36.4108 26.84 36.7175 27.0667 36.9575 27.52C37.2242 27.9733 37.3575 28.4933 37.3575 29.08C37.3575 29.6667 37.2508 30.5467 37.0375 31.72C36.8242 32.8667 36.5575 34.1867 36.2375 35.68C35.9175 37.1733 35.5575 38.7867 35.1575 40.52C33.7175 47.1067 32.9975 52.2933 32.9975 56.08Z" fill="white"/><circle cx="38" cy="18" r="4" fill="white"/></svg>`
        height: iconHeight / 4
        width: height
        anchors
        {
            right: parent.right
            top: parent.top
            topMargin: iconHeight / 1.5
            rightMargin: 5
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                infoBoxOpened = !infoBoxOpened
            }
        }
    }

    OptionHighlight
    {
        parent: good
        imageSource: good.source
        selected: optionSelected == good
        z: -1
    }

    OptionHighlight
    {
        parent: middle
        imageSource: middle.source
        selected: optionSelected == middle
        z: -1
    }

    OptionHighlight
    {
        parent: bad
        imageSource: bad.source
        selected: optionSelected == bad
        z: -1
    }

    ColumnLayout
    {
        width: parent.width * 0.6574074074074074
        anchors
        {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            topMargin: 554 / 4
        }

        Image
        {
            id: good
            source: `data:image/svg+xml, <svg width="${height}" height="${height}" viewBox="0 0 301 301" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M91.4678 195.191L100.427 200.639C131.068 219.271 169.54 219.271 200.181 200.639L209.14 195.191" stroke="#14FF00" stroke-width="10" stroke-linecap="round"/><circle cx="150.308" cy="150.795" r="145" stroke="#14FF00" stroke-width="10"/><circle cx="102.277" cy="124.651" r="16.4147" fill="#14FF00"/><circle cx="199.771" cy="124.651" r="16.4147" fill="#14FF00"/></svg>`
            height: iconHeight
            width: height
            Layout.alignment: Qt.AlignRight

            MouseArea
            {
                anchors.fill: parent
                enabled: enableClicks
                onClicked:
                {
                    console.log(optionSelected)
                    optionSelected = good
                }
            }
        }

        Image
        {
            id: middle
            source: `data:image/svg+xml, <svg width="${height}" height="${height}" viewBox="0 0 301 301" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M91.7974 199.552H205.482" stroke="#FAFF08" stroke-width="10" stroke-linecap="round"/><circle cx="150.218" cy="150.605" r="145" stroke="#FAFF08" stroke-width="10"/><circle cx="101.193" cy="116.503" r="16.4147" fill="#FAFF00"/><circle cx="200.667" cy="116.503" r="16.4147" fill="#FAFF00"/></svg>`
            height: iconHeight
            width: height
            Layout.alignment: Qt.AlignHCenter

            MouseArea
            {
                anchors.fill: parent
                enabled: enableClicks
                onClicked:
                {
                    optionSelected = middle
                }
            }
        }


        Image
        {
            id: bad
            source: `data:image/svg+xml, <svg width="${height}" height="${height}" viewBox="0 0 301 301" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M208.801 201.191L199.842 195.743C169.201 177.111 130.73 177.111 100.088 195.743L91.1288 201.191" stroke="#FF0000" stroke-width="10" stroke-linecap="round"/><circle cx="150.129" cy="150.415" r="145" stroke="#FF0000" stroke-width="10"/><circle cx="101.104" cy="117.746" r="16.4147" fill="#FF0000"/><circle cx="199.38" cy="117.746" r="16.4147" fill="#FF0000"/></svg>`
            height: iconHeight
            width: height
            Layout.alignment: Qt.AlignLeft

            MouseArea
            {
                anchors.fill: parent
                enabled: enableClicks
                onClicked:
                {
                    optionSelected = bad
                }
            }
        }
    }

    onOptionSelectedChanged:
    {
        if(acceptButton.opacity === 0.0)
            d.start()
    }


    PropertyAnimation
    {
        id: d
        target: text2
        property: "opacity"
        from: 1.0
        to: 0.0
        duration: 200

        onFinished:
        {
            acceptButtonActive = true;
            a.start()
            c.start()
        }
    }
    PropertyAnimation
    {
        id: a
        target: text2
        property: "opacity"
        from: 0.0
        to: 1.0
        duration: 200
    }

    PropertyAnimation
    {
        id: c
        target: acceptButton
        property: "opacity"
        from: 0.0
        to: 1.0
        duration: 200
    }


    Text
    {
        id: text2
        text: enableClicks ? (acceptButtonActive ? "Wyślij" : "Oceń dzisiejszy obiad") : (Data.sendingSurvey ? "Wysyłam" : "Wysłano")
        color: Style.isDarkTheme ? Style.secondaryColor : "#995BFF"
        font.pixelSize: 65 / 4
        width: parent.width - 230 / 4
        horizontalAlignment: Text.AlignHCenter
        anchors
        {
            horizontalCenter: dailyFoodbox.horizontalCenter
            bottom: dailyFoodbox.top
            bottomMargin: 93 / 4
        }
    }

    Rectangle
    {
        id: acceptButton
        opacity: 0.0
        anchors.centerIn: text2
        width: 401 / 4
        height: 146 / 4
        color: "transparent"
        radius: 70 / 4

        border
        {
            color: Style.secondaryColor
            width: 4 / 4
        }

        MouseArea
        {
            anchors.fill: parent
            enabled: parent.opacity !== 0.0 && enableClicks
            onClicked:
            {
                enableClicks = false
                //text2.text = "dd"

                let choice = 0

                switch(optionSelected)
                {
                case good:
                    choice = 3
                    break
                case middle:
                    choice = 2
                    break
                case bad:
                    choice = 1
                    break
                default:
                    break
                }

                Data.sendSurvey(choice)
            }
        }

        Rectangle
        {
            anchors.centerIn: parent
            width: 377 / 4
            height: 123 / 4
            color: "transparent"
            radius: 58 / 4

            border
            {
                color: Style.accentColor
                width: 7 / 4
            }
        }
    }

    Rectangle
    {
        id: dailyFoodbox
        width: parent.width - 224 / 4
        height: 300 / 4
        color: Style.backgroundColor
        radius: 51 / 4

        border.color: Style.secondaryColor
        border.width: 4 / 4
        anchors
        {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 310 / 4
        }

        Rectangle
        {
            id: innerRect
            height: parent.height - 24 / 2
            width: parent.width - 24 / 2
            color: "transparent"
            radius: 31 / 4

            anchors.centerIn: parent

            border.color: Style.accentColor
            border.width: 9 / 4

            Loader
            {
                active: bShowDish
                anchors.centerIn: parent
                sourceComponent: Text
                {
                    anchors.centerIn: parent
                    font.pixelSize: 50 / 4
                    color: Style.secondaryColor

                    Component.onCompleted:
                    {
                        var day = currentDayOfWeek === 6 ? "Dziś jest sobota. Nie ma obiadu" : "Dziś jest niedziela. Nie ma obiadu";
                        text = day;
                    }
                }
            }

            ColumnLayout
            {
                visible: !bShowDish
                anchors
                {
                    top: parent.top
                    left: parent.left
                    topMargin: 7
                    leftMargin: 7
                }
                spacing: 2

                Text
                {
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignLeft
                    text: "pierwsze danie"
                    color: Style.isDarkTheme ? "white" : "black"
                    font.pixelSize: 29 / 4
                    Layout.alignment: Qt.AlignHCenter
                }

                Text
                {
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignLeft
                    text: mainDish
                    color: Style.secondaryColor
                    font.pixelSize: 50 / 4
                    Layout.alignment: Qt.AlignHCenter
                }
            }

            ColumnLayout
            {
                visible: !bShowDish
                id: mainDishColumn
                anchors
                {
                    top: parent.top
                    right: parent.right
                    topMargin: 7
                    rightMargin: 7
                }
                spacing: 2

                Text
                {
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignLeft
                    text: "drugie danie"
                    color: Style.isDarkTheme ? "white" : "black"
                    font.pixelSize: 29 / 4
                    Layout.alignment: Qt.AlignHCenter
                }

                Text
                {
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignLeft
                    text: secondDish
                    color: Style.secondaryColor
                    font.pixelSize: 50 / 4
                    Layout.alignment: Qt.AlignHCenter
                }
            }

            ColumnLayout
            {
                visible: !bShowDish
                spacing: -1
                anchors
                {
                    top: mainDishColumn.top
                    horizontalCenter: mainDishColumn.horizontalCenter
                    topMargin: 28
                }

                Text
                {
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignLeft
                    text: firstIngr
                    color: Style.detailColor
                    opacity: 0.76
                    font.pixelSize: 29 / 4
                    Layout.alignment: Qt.AlignHCenter
                }

                Text
                {
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignLeft
                    text: secondIngr
                    color: Style.detailColor
                    opacity: 0.76
                    font.pixelSize: 29 / 4
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }

    Loader
    {
        source: "SurveyInfo.qml"
        active: infoBoxOpened
        anchors.fill: parent
    }
}
