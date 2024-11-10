import QtQuick 2.0

Item {
    id: sidebarAppViewProperties

    property string name
    property url iconUrl
    property int alignment: SidebarAppView.Alignment.Top
    property bool closeable: true

}
