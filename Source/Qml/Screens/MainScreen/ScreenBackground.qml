import QtQuick 2.15
import QtQuick.Effects

import HackHeroesProject

Rectangle
{
    anchors.fill: parent
    color: Style.backgroundColor

    function screenMoved(index)
    {
        switch(index)
        {
        case 0:
            if(stripeMoveAnimation.running)
                stripeMoveAnimation.stop()
            stripeMoveAnimation.to = 0

            stripeMoveAnimation.start()
            //stripe.anchors.horizontalCenterOffset = 0
            break;

        case 1:
            if(stripeMoveAnimation.running)
                stripeMoveAnimation.stop()
            stripeMoveAnimation.to = 921 / 4
            stripeMoveAnimation.start()
            //stripe.anchors.horizontalCenterOffset = 921 / 4
            break;

        case 2:
            if(stripeMoveAnimation.running)
                stripeMoveAnimation.stop()
            stripeMoveAnimation.to = -750 / 4
            stripeMoveAnimation.start()
            //stripe.anchors.horizontalCenterOffset = -750 / 4
            break;

        case 3:
            if(stripeMoveAnimation.running)
                stripeMoveAnimation.stop()
            stripeMoveAnimation.to = -1550 / 4
            stripeMoveAnimation.start()
            break;

        default:
            break;
        }
    }




    Item
    {
        id: stripe
        height: 540 / 4
        width: 2600
        opacity: Style.isDarkTheme ? 0.54 : 1.0
        rotation: -57
        anchors
        {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }

        PropertyAnimation
        {
            id: stripeMoveAnimation
            target: stripe
            property: "anchors.horizontalCenterOffset"
            from: stripe.anchors.horizontalCenterOffset
            to: 0
            duration: 500
            easing.type: easing.InOutQuad
        }


        Rectangle
        {
            id: yellowStripe
            width: parent.width
            height: 180 / 4
            color: Style.secondaryColor
            antialiasing: true
        }

        Rectangle
        {
            id: orangeStripe
            width: parent.width
            height: 360 / 4
            color: Style.accentColor
            anchors.top: yellowStripe.bottom
            antialiasing: true
        }

        PropertyAnimation
        {
            id: moveAnimation
            target: stripe
            property: "x"
            from: stripe.x
            to: 0
            duration: 400
            easing.type: easing.InOutCubic
        }

        layer.enabled: true
        layer.effect: MultiEffect
        {
            shadowColor: "black"
            shadowVerticalOffset: 10
            shadowOpacity: 0.4
            shadowEnabled: true
            blurMultiplier: 1
        }
    }
}
