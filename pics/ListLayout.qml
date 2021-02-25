import QtQuick 2.12

ListView {
    id: listView
    anchors.fill: parent

    model: ContactModel {}
    delegate: ListDelegate {}
    highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
    focus: true
}


