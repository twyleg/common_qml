// Copyright (C) 2024 twyleg
import QtQuick 2.15
import QtQuick.Controls 2.15

import CommonQml.SidebarApp 0.1
import CommonQml.Icons 0.1

SidebarAppView {
    id: baseSettingsView

    viewProperties.name: "Settings"
    viewProperties.closeable: false
    viewProperties.iconUrl: IconLoader.getIconPath("material/settings")

}