import QtQuick 2.15
import QtQuick.Effects

Item
{
    id: root
    anchors.fill: parent

    required property string imageSource
    required property bool selected

    onSelectedChanged:
    {
        selectAnimation.start()
    }

    PropertyAnimation
    {
        id: selectAnimation
        targets: [blur, doubleBlur]
        property: "opacity"
        from: blur.opacity
        to: blur.opacity === 0.0 ? 1.0 : 0.0
        duration: 200
        easing.type: Easing.InOutQuad
    }

    Image
    {
        id: sourceItem
        source: imageSource
        visible: false
    }

    MultiEffect
    {
        id: blur
        opacity: 0.0
        source: sourceItem
        anchors.fill: sourceItem

        blurEnabled: true
        blurMax: 32
        blur: 0.8
        //blurMultiplier: 2
    }

    MultiEffect
    {
        id: doubleBlur
        opacity: 0.0
        source: sourceItem
        anchors.fill: sourceItem

        blurEnabled: true
        blurMax: 32
        blur: 0.8
        //blurMultiplier: 2
    }
}
