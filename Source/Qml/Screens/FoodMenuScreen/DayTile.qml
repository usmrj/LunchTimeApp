import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Item
{
    height: normalHeight
    width: normalHeight
    id: root

    readonly property real toggledHeight: 742 / 4
    readonly property real normalHeight: 371 / 4
    readonly property real innerToggledHeight: 646 / 4
    readonly property real innerNormalHeight: 323 / 4


    property string mainDish: ""
    property string secondDish: ""
    property string fistIngr: ""
    property string secondIngr: ""

    property string innerText
    signal tilePressed()

    function stopAnimation()
    {
        if(root.height !== normalHeight)
        {
            if(enlargeAnimation.running)
                enlargeAnimation.stop()
            enlargeAnimation.start()
        }
    }

    //    states:
    //        State
    //        {
    //            name: "reanchored"
    //            AnchorChanges
    //            {
    //                target: dayName
    //                anchors.verticalCenter: root.top
    ////                anchors.horizontalCenter: undefined
    ////                anchors.top: root.top
    //            }
    //        }

    transitions: Transition
    {
        // smoothly reanchor myRect and move into new position
        AnchorAnimation { duration: 1000 }
    }

    Rectangle
    {
        id: outerRect
        height: parent.height
        width: parent.width
        color: "transparent"
        radius: 51 / 4

        border.color: "#FFB800"
        border.width: 4 / 4

        Rectangle
        {
            id: innerRect
            height: innerNormalHeight
            width: innerNormalHeight
            color: "transparent"
            radius: 31 / 4

            anchors.centerIn: parent

            border.color: "#FF7A00"
            border.width: 9 / 4

            Label
            {
                id: dayName
                text: innerText
                color: "#FFB800"
                font
                {
                    pixelSize: 50 / 4
                }

                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ColumnLayout
            {
                anchors
                {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                    topMargin: 50 / 4
                }

                spacing: 16 / 4
                Label
                {
                    text: "główne danie"
                    color: "#FFFFFF"
                    font
                    {
                        pixelSize: 29 / 4
                    }

                    Layout.alignment: Qt.AlignHCenter
                }

                Label
                {
                    text: mainDish
                    color: "#FFB800"
                    font
                    {
                        pixelSize: 50 / 4
                    }

                    Layout.alignment: Qt.AlignHCenter
                }
            }


        }

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                tilePressed()
                enlargeAnimation.start()
            }
        }



        ParallelAnimation
        {
            id: enlargeAnimation
            PropertyAnimation
            {
                id: outerRectAnimation
                target: root
                property: "height"
                from: root.height
                to: root.height === 371 / 4 ? toggledHeight : normalHeight
                duration: 500
                easing.type: easing.InOutCubic
            }
            PropertyAnimation
            {
                id: innerRectAnimation
                target: innerRect
                property: "height"
                from: innerRect.height
                to: innerRect.height === innerNormalHeight ? innerToggledHeight + (outerRect.width - innerRect.width) : innerNormalHeight
                duration: 500
                easing.type: easing.InOutCubic
            }
        }
    }
}
