/*
 * Copyright (C) 2016 Stuart Howarth <showarth@marxoft.co.uk>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 1.1
import com.nokia.symbian 1.1
import Qdl 2.0

MyPage {
    id: root

    title: qsTr("Decaptcha")
    tools: ToolBarLayout {
        BackToolButton {}
    }

    MyListView {
        id: view

        anchors.fill: parent
        model: DecaptchaPluginConfigModel {
            id: decaptchaModel
        }
        delegate: PluginDelegate {
            subItemIndicator: true
            onClicked: appWindow.pageStack.push(Qt.resolvedUrl("AboutPluginPage.qml"), {plugin: decaptchaModel.itemData(index)})
        }
    }

    ScrollDecorator {
        flickableItem: view
    }

    Label {
        id: label

        anchors {
            fill: parent
            margins: platformStyle.paddingLarge
        }
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        color: platformStyle.colorNormalMid
        font.bold: true
        font.pixelSize: 32
        text: qsTr("No decaptcha plugins")
        visible: decaptchaModel.count == 0
    }
}
