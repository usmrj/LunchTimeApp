import QtQuick 2.15


Item
{
    id: root
    anchors.fill: parent

    DayTile
    {
        id: mondayTile
        innerText: "Poniedziałek"
        anchors
        {
            left: parent.left
            leftMargin: 100 / 4
            top: parent.top
            topMargin: 300 / 4
        }
    }

    DayTile
    {
        id: tuesdayTile
        innerText: "Wtorek"
        anchors
        {
            top: mondayTile.bottom
            topMargin: 120 / 4
            left: mondayTile.left
        }
    }

    DayTile
    {
        id: wednesdayTile
        innerText: "Środa"
        anchors
        {
            top: tuesdayTile.bottom
            topMargin: 120 / 4
            left: tuesdayTile.left
        }
    }

    DayTile
    {
        id: thursdayTile
        innerText: "Środa"
        anchors
        {
            top: parent.top
            topMargin: 546 / 4
        }
    }

    DayTile
    {
        id: fridayTile
        innerText: "Środa"
        anchors
        {
            top: fridayTile.bottom
            topMargin: 120 / 4
        }
    }

}
