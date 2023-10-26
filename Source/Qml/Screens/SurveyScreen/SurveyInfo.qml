import QtQuick 2.15

Item
{
    id: root
    anchors.fill: parent

    property SurveyScreen surveyScreen: parent.parent

    Component.onCompleted: openAnimation.start()

    PropertyAnimation
    {
        id: openAnimation
        target: background
        property: "opacity"
        from: 0
        to: 0.8
        duration: 200
        easing.type: Easing.InOutQuad
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            surveyScreen.infoBoxOpened = false
        }

        onContainsMouseChanged:
        {
            surveyScreen.infoBoxOpened = false
        }
    }

    Rectangle
    {
        id: background
        anchors.fill: parent
        color: "#303030"
        opacity: 0.8
    }

    Rectangle
    {
        id: infobox
        width: parent.width - 224 / 4
        height: 500 / 4
        color: "#303030"
        radius: 51 / 4

        border.color: "#FFB800"
        border.width: 4 / 4
        anchors
        {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 433 / 4
        }

        MouseArea
        {
            anchors.fill: parent
        }

        Rectangle
        {
            id: innerRect
            height: parent.height - 24 / 2
            width: parent.width - 24 / 2
            color: "transparent"
            radius: 31 / 4

            anchors.centerIn: parent

            border.color: "#FF7A00"
            border.width: 9 / 4

            Text
            {
                padding: 7
                width: parent.width - padding
                height: parent.height - padding
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignLeft
                lineHeight: 1.2
                text: " Informacje o ankiecie:
    • Ankieta jest w pełni anonimowa.
    • Wszystkie głosy są wysyłane codziennie,
     o północy, więc śmiało możesz zmienić
     wybór.
    • Wasze głosy pomagają szkole dobierać
     smaczne obiady"
                color: "#FFB800"
                font.pixelSize: 36 / 4
            }

            Image
            {
                source: `data:image/svg+xml, <svg width="58" height="58" viewBox="0 0 58 58" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M14.5 43.5L43.5 14.5" stroke="#FFB800" stroke-width="4"/><path d="M43.5 43.5L14.5 14.5" stroke="#FFB800" stroke-width="4"/></svg>`
                width: 41 / 3
                height: 41 / 3
                anchors
                {
                    top: parent.top
                    right: parent.right
                    topMargin: 7
                    rightMargin: 7
                }

                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        surveyScreen.infoBoxOpened = false
                    }
                }
            }
        }
    }
}
