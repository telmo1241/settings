/*
 * Copyright (C) 2021 CutefishOS Team.
 *
 * Author:     revenmartin <revenmartin@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import Cutefish.Settings 1.0
import FishUI 1.0 as FishUI
import "../"

ItemPage {
    headerTitle: qsTr("Dock")

    Appearance {
        id: appearance
    }

    Scrollable {
        anchors.fill: parent
        contentHeight: layout.implicitHeight

        ColumnLayout {
            id: layout
            anchors.fill: parent
            spacing: FishUI.Units.largeSpacing * 2

            RoundedItem {
                // Dock
                Label {
                    text: qsTr("Position on screen")
                    color: FishUI.Theme.disabledTextColor
                    bottomPadding: FishUI.Units.smallSpacing
                }

                RowLayout {
                    spacing: FishUI.Units.largeSpacing * 2

                    IconCheckBox {
                        source: "qrc:/images/dock_left.svg"
                        text: qsTr("Left")
                        checked: appearance.dockDirection === 0
                        onClicked: appearance.setDockDirection(0)
                    }

                    IconCheckBox {
                        source: "qrc:/images/dock_bottom.svg"
                        text: qsTr("Bottom")
                        checked: appearance.dockDirection === 1
                        onClicked: appearance.setDockDirection(1)
                    }

                    IconCheckBox {
                        source: "qrc:/images/dock_right.svg"
                        text: qsTr("Right")
                        checked: appearance.dockDirection === 2
                        onClicked: appearance.setDockDirection(2)
                    }
                }
            }

            RoundedItem {
                Label {
                    text: qsTr("Size")
                    color: FishUI.Theme.disabledTextColor
                    bottomPadding: FishUI.Units.smallSpacing
                }

                TabBar {
                    id: dockSizeTabbar
                    Layout.fillWidth: true
                    bottomPadding: FishUI.Units.smallSpacing

                    TabButton {
                        text: qsTr("Small")
                    }

                    TabButton {
                        text: qsTr("Medium")
                    }

                    TabButton {
                        text: qsTr("Large")
                    }

                    TabButton {
                        text: qsTr("Huge")
                    }

                    currentIndex: {
                        var index = 0

                        if (appearance.dockIconSize <= 54)
                            index = 0
                        else if (appearance.dockIconSize <= 64)
                            index = 1
                        else if (appearance.dockIconSize <= 72)
                            index = 2
                        else if (appearance.dockIconSize <= 92)
                            index = 3

                        return index
                    }

                    onCurrentIndexChanged: {
                        var iconSize = 0

                        switch (currentIndex) {
                        case 0:
                            iconSize = 54
                            break;
                        case 1:
                            iconSize = 64
                            break;
                        case 2:
                            iconSize = 72
                            break;
                        case 3:
                            iconSize = 92
                            break;
                        }

                        appearance.setDockIconSize(iconSize)
                    }
                }
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }
}
