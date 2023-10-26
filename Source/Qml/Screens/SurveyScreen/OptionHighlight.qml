import QtQuick 2.15
import QtQuick.Effects

Item
{
    id: root
    anchors.fill: parent

    required property string imageSource
    required property bool selected

    Image
    {
        id: sourceItem
        source: imageSource
        visible: false
    }

    MultiEffect
    {
        id: blur
        opacity: selected ? 1.0 : 0.0
        source: sourceItem
        anchors.fill: sourceItem

        blurEnabled: true
        blurMax: 32
        blur: 0.8

        Behavior on opacity
        {
            NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
        }
    }

    MultiEffect
    {
        id: doubleBlur
        opacity: selected ? 1.0 : 0.0
        source: sourceItem
        anchors.fill: sourceItem

        blurEnabled: true
        blurMax: 32
        blur: 0.8


        Behavior on opacity
        {
            NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
        }
    }
}
