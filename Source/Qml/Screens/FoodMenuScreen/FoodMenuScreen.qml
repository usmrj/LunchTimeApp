import QtQuick 2.15


Item
{
    id: root
    anchors.fill: parent

    DayTile
    {
        id: mondayTile
        innerText: "Poniedziałek"

        mainDish: "Zupa grzybowa"

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
