// Tooltip.qml
//
// GPL-3.0 license
//
import QtQuick
import Quickshell
import Quickshell.Widgets

PopupWindow {
    id: root

    // ==================================================================
    // 1. Configuration & Input Variables
    // ==================================================================
    property int fontPixelSize: 14
    property Item target
    property string text: ""
    property bool show: false

    visible: show

    color: "transparent"

    // Standardized Sizing Rule: Compute window bounds directly from text metrics
    implicitWidth: tooltipText.implicitWidth + 10 // Plus 10 for clean internal horizontal padding
    implicitHeight: tooltipText.implicitHeight + 6

    // Structural Window Placement Anchors
    anchor.item: target
    anchor.edges: Edges.Top | Edges.Left
    anchor.gravity: Edges.Bottom | Edges.Left


    // ==================================================================
    // 2. Display Container Layout
    // ==================================================================
    Rectangle {
        id: tooltipBox
        anchors.fill: parent // Automatically syncs with window dimensions
        color: "#FFFFCC"     // Light cream yellow background
        border.color: "#88000000" // Added a subtle translucent black border for crisp separation
        border.width: 1
        radius: 3

        Text {
            id: tooltipText
            anchors.centerIn: parent
            text: root.text
            color: "black"
            font.pixelSize: root.fontPixelSize
        }
    }
}

