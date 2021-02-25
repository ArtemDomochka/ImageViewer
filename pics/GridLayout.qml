import QtQuick 2.12

GridView {
    id: gridView
    anchors.fill: parent
    cellWidth: 120; cellHeight: 120

    model: ContactModel {}
    delegate: GridDelegate {}
    highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
    focus: true
}
