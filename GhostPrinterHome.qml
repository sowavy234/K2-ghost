import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id: root
    width: 480
    height: 320
    color: "#10101A"

    Image {
      id: logo
      anchors.top: parent.top
      anchors.horizontalCenter: parent.horizontalCenter
      width: 100
      height: 100
      source: "ghostprinter_logo.png"
    }

    Text {
        text: "GHOST.PRINTER"
        anchors.top: logo.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 36
        color: "#6CF"
        font.bold: true
    }

    Text {
        text: "K2 SE Advanced Console"
        anchors.top: parent.top
        anchors.topMargin: 120
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 20
        color: "#AEE"
    }

    Text {
        text: "Flatness: " + bedFlatness
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 18
        color: "#FFF"
    }

    // Add real-time info blocks here. Example:
    // Adaptive fan, XY temp, mesh status, print status, etc.
    // To be extended based on your actual Python/qml/k2 screen stack.

    property string bedFlatness: "Waiting..."

    Button {
        text: "AUTO BED LEVEL"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: 200
        height: 60
        onClicked: {
            // This should trigger the AUTO_BED_LEVEL macro via REST, serial, or socket
            bedFlatness = "Leveling..."
        }
    }
}