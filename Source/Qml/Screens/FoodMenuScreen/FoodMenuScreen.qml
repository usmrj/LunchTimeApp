import QtQuick 2.15

import HackHeroesProject

Item
{
    id: root
    anchors.fill: parent

    DayTile
    {
        id: mondayTile
        innerText: "Poniedziałek"

        secondDish: Data.getDish(1, 1)
        mainDish: Data.getDish(1, 2)
        firstIngr: Data.getDish(1, 3)
        secondIngr: Data.getDish(1, 4)

        Component.onCompleted:
        {
            console.log(Data.getDish("Monday", 1))
        }

        anchors
        {
            left: parent.left
            leftMargin: 80 / 4
            top: parent.top
            topMargin: 340 / 4
        }

        onTilePressed: function()
        {
            tuesdayTile.stopAnimation()
            wednesdayTile.stopAnimation()
            thursdayTile.stopAnimation()
            fridayTile.stopAnimation()
        }
    }

    DayTile
    {
        id: wednesdayTile
        innerText: "Środa"

        secondDish: Data.getDish(3, 1)
        mainDish: Data.getDish(3, 2)
        firstIngr: Data.getDish(3, 3)
        secondIngr: Data.getDish(3, 4)

        anchors
        {
            top: mondayTile.bottom
            topMargin: 80 / 4
            left: mondayTile.left
        }

        onTilePressed: function()
        {
            mondayTile.stopAnimation()
            tuesdayTile.stopAnimation()
            thursdayTile.stopAnimation()
            fridayTile.stopAnimation()
        }
    }

    DayTile
    {
        id: fridayTile
        innerText: "Piątek"

        secondDish: Data.getDish(5, 1)
        mainDish: Data.getDish(5, 2)
        firstIngr: Data.getDish(5, 3)
        secondIngr: Data.getDish(5, 4)

        anchors
        {
            top: wednesdayTile.bottom
            topMargin: 80 / 4
            left: wednesdayTile.left
        }

        onTilePressed: function()
        {
            mondayTile.stopAnimation()
            tuesdayTile.stopAnimation()
            wednesdayTile.stopAnimation()
            thursdayTile.stopAnimation()
        }
    }

    DayTile
    {
        id: tuesdayTile
        innerText: "Wtorek"

        secondDish: Data.getDish(2, 1)
        mainDish: Data.getDish(2, 2)
        firstIngr: Data.getDish(2, 3)
        secondIngr: Data.getDish(2, 4)

        anchors
        {
            bottom: thursdayTile.top
            bottomMargin: 80 / 4
            left: wednesdayTile.right
            leftMargin: 100 / 4
        }

        onTilePressed: function()
        {
            mondayTile.stopAnimation()
            wednesdayTile.stopAnimation()
            thursdayTile.stopAnimation()
            fridayTile.stopAnimation()
        }
    }

    DayTile
    {
        id: thursdayTile
        innerText: "Czwartek"

        secondDish: Data.getDish(4, 1)
        mainDish: Data.getDish(4, 2)
        firstIngr: Data.getDish(4, 3)
        secondIngr: Data.getDish(4, 4)

        anchors
        {
            bottom: parent.bottom
            bottomMargin: 1000 / 4
            left: wednesdayTile.right
            leftMargin: 100 / 4
        }

        onTilePressed: function()
        {
            mondayTile.stopAnimation()
            tuesdayTile.stopAnimation()
            wednesdayTile.stopAnimation()
            fridayTile.stopAnimation()
        }
    }
}
