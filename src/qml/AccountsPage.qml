import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0

import MeuiKit 1.0 as Meui
import Cutefish.Settings 1.0
import Cutefish.Accounts 1.0

import "./UserPage"

ItemPage {
    headerTitle: qsTr("User")

    UserAccount {
        id: loggedUser
    }

    UsersModel {
        id: userModel
    }

    AccountsManager {
        id: accountsManager
    }

    Scrollable {
        anchors.fill: parent
        anchors.bottomMargin: Meui.Units.largeSpacing
        contentHeight: layout.implicitHeight

        ColumnLayout {
            id: layout
            anchors.fill: parent

            ListView {
                id: _userView
                model: userModel
                Layout.fillWidth: true
                spacing: Meui.Units.largeSpacing
                interactive: false

                Layout.preferredHeight: {
                    var totalHeight = 0
                    for (var i = 0; i < _userView.visibleChildren.length; ++i) {
                        totalHeight += _userView.visibleChildren[i].height
                    }
                    totalHeight += (_userView.count - 1) * _userView.spacing
                    return totalHeight
                }

                property int itemHeight: 64

                delegate: UserDelegateItem {
                    width: _userView.width
                }
            }

            Item {
                height: Meui.Units.smallSpacing
            }

            Button {
                id: _addUserButton
                text: qsTr("Add user")
                onClicked: {
                    var component = Qt.createComponent("AddUserDialog.qml")
                    if (component.status === Component.Ready) {
                        var dialog = component.createObject(rootWindow)
                        dialog.open()
                    }
                }
            }
        }
    }
}
