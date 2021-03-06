TEMPLATE = subdirs

symbian {
    config.sources = qdl2-porntrex.json
    config.path = !:/qdl2/plugins/services

    icon.sources = qdl2-porntrex.jpg
    icon.path = !:/qdl2/plugins/icons

    plugin.sources = qdl2-porntrex.js
    plugin.path = !:/qdl2/plugins/services

    vendorinfo += "%{\"Stuart Howarth\"}" ":\"Stuart Howarth\""
    porntrex_deployment.pkg_prerules += vendorinfo

    DEPLOYMENT.display_name = QDL Plugins PornTrex
    DEPLOYMENT += \
        porntrex_deployment \
        config \
        icon \
        plugin

} else:unix {
    config.files = qdl2-porntrex.json
    config.path = /opt/qdl2/plugins/services

    icon.files = qdl2-porntrex.jpg
    icon.path = /opt/qdl2/plugins/icons

    plugin.files = qdl2-porntrex.js
    plugin.path = /opt/qdl2/plugins/services
    
    INSTALLS += \
        config \
        icon \
        plugin
}
