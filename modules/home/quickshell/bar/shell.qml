//@ pragma UseQApplication

import Quickshell
import Quickshell.Hyprland
import QtQuick

ShellRoot {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 34
      color: "#1d2021"

      // workspaces
      Row {
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        spacing: 4

        Repeater {
          model: Hyprland.workspaces

          Rectangle {
            required property var modelData

            width: 26
            height: 22
            radius: 4
            color: modelData.focused ? "#b8bb26" : "#3c3836"

            Text {
              anchors.centerIn: parent
              text: modelData.id
              color: modelData.focused ? "#1d2021" : "#ebdbb2"
              font.family: "JetBrainsMono Nerd Font"
              font.pixelSize: 13
            }

            MouseArea {
              anchors.fill: parent
              onClicked: Hyprland.dispatch("workspace " + modelData.id)
            }
          }
        }
      }

      // clock
      SystemClock {
        id: clock
        precision: SystemClock.Seconds
      }

      Text {
        anchors.centerIn: parent
        text: Qt.formatDateTime(clock.date, "ddd d MMM  HH:mm:ss")
        color: "#ebdbb2"
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 13
      }

      Text {
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        text: "quickshell " + Quickshell.screens.length + "  "
        color: "#928374"
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 13
      }
    }
  }
}
