import QtQuick 2.15

Rectangle
{
    anchors.fill: parent
    color: "#303030"

    function screenMoved(bLeft)
    {
        if(bLeft)
        moveAnimation.to = stripe.x + 100
        else
        moveAnimation.to = stripe.x - 100
        moveAnimation.start()
    }


    Item
    {
        id: stripe
        height: 540 / 4
        width: 2600 / 4
        opacity: 0.54
        rotation: -57
        anchors.centerIn: parent


        Rectangle
        {
            id: yellowStripe
            width: parent.width
            height: 180 / 4
            color: "#FFB800"
            antialiasing: true
        }

        Rectangle
        {
            id: orangeStripe
            width: parent.width
            height: 360 / 4
            color: "#FF7A00"
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
    }
}
