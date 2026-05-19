import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import SddmComponents 2.0

Rectangle {
    id: root
    width: Screen.width
    height: Screen.height
    color: "#221a1a"

    Image {
        id: background
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
    }

    Rectangle {
        anchors.fill: parent
        color: "#221a1a"
        opacity: 0.6
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: Qt.formatTime(new Date(), "hh:mm")
            color: "#f8f8f2"
            font.pixelSize: 80
            font.family: "JetBrainsMono Nerd Font"
            font.bold: true
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: parent.text = Qt.formatTime(new Date(), "hh:mm")
            }
        }

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: Qt.formatDate(new Date(), "dddd dd MMMM yyyy")
            color: "#e0789a"
            font.pixelSize: 18
            font.family: "JetBrainsMono Nerd Font"
        }

        Rectangle {
            Layout.alignment: Qt.AlignHCenter
            width: 300
            height: 1
            color: "#e0789a"
            opacity: 0.5
        }

        Rectangle {
            Layout.alignment: Qt.AlignHCenter
            width: 300
            height: 50
            radius: 10
            color: "#2d2020"
            border.color: "#e0789a"
            border.width: 2

            TextInput {
                id: passwordInput
                anchors.fill: parent
                anchors.margins: 12
                color: "#f8f8f2"
                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 14
                echoMode: TextInput.Password
                verticalAlignment: Text.AlignVCenter
                focus: true
                Keys.onPressed: {
                    if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        sddm.login("joe", passwordInput.text, 0)
                    }
                }
            }

            Text {
                anchors.fill: parent
                anchors.margins: 12
                text: "🔮 Mot de passe..."
                color: "#6b5050"
                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 14
                verticalAlignment: Text.AlignVCenter
                visible: passwordInput.text.length === 0
            }
        }

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: "✦ Grimoire ✦"
            color: "#e0789a"
            font.pixelSize: 13
            font.family: "JetBrainsMono Nerd Font"
            opacity: 0.7
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 12

            Rectangle {
                width: 120
                height: 36
                radius: 8
                color: powerOffHover.containsMouse ? "#e0789a" : "#2d2020"
                border.color: "#e0789a"
                border.width: 1
                Text {
                    anchors.centerIn: parent
                    text: "⏻ Éteindre"
                    color: powerOffHover.containsMouse ? "#221a1a" : "#f8f8f2"
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13
                }
                MouseArea {
                    id: powerOffHover
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: sddm.powerOff()
                }
            }

            Rectangle {
                width: 140
                height: 36
                radius: 8
                color: rebootHover.containsMouse ? "#e0789a" : "#2d2020"
                border.color: "#e0789a"
                border.width: 1
                Text {
                    anchors.centerIn: parent
                    text: "↺ Redémarrer"
                    color: rebootHover.containsMouse ? "#221a1a" : "#f8f8f2"
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13
                }
                MouseArea {
                    id: rebootHover
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: sddm.reboot()
                }
            }
        }
    }

    Component.onCompleted: passwordInput.forceActiveFocus()
}
