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

AppWindow {
    id: appWindow

    showStatusBar: true
    showToolBar: true
    initialPage: MainPage {
        id: mainPage
    }

    MyInfoBanner {
        id: infoBanner
    }
    
    Component.onCompleted: {
        decaptchaPluginManager.load();
        recaptchaPluginManager.load();
        servicePluginManager.load();
        transferModel.restore();
    }

    Connections {
        target: transferModel
        onCaptchaRequest: pageStack.push(Qt.resolvedUrl("CaptchaPage.qml"), {transfer: transfer})
        onSettingsRequest: pageStack.push(Qt.resolvedUrl("SettingsRequestPage.qml"), {transfer: transfer})
    }
}
