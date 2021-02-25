import QtQuick 2.12

PathView {
    id: pathView
    anchors.fill: parent
    model: ContactModel {}
    delegate: PathDelegate {}
    path: Path {
        startX: 300; startY: 300
        PathQuad { x: 120; y: 60; controlX: 260; controlY: 75 }
        PathQuad { x: 120; y: 120; controlX: -20; controlY: 75 }
    }

    focus: true
    Keys.onLeftPressed: decrementCurrentIndex()
    Keys.onRightPressed: incrementCurrentIndex()
}

