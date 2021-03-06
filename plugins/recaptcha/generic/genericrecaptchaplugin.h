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

#ifndef GENERICRECAPTCHAPLUGIN_H
#define GENERICRECAPTCHAPLUGIN_H

#include "recaptchaplugin.h"

class GenericRecaptchaPlugin : public RecaptchaPlugin
{
    Q_OBJECT

    Q_INTERFACES(RecaptchaPlugin)
#if QT_VERSION >= 0x050000
    Q_PLUGIN_METADATA(IID "org.qdl2.GenericRecaptchaPlugin")
#endif

public:
    explicit GenericRecaptchaPlugin(QObject *parent = 0);
    
    virtual RecaptchaPlugin* createPlugin(QObject *parent = 0);

    virtual void setNetworkAccessManager(QNetworkAccessManager *manager);

public Q_SLOTS:
    virtual bool cancelCurrentOperation();
    
    virtual void getCaptcha(const QString &imageUrl);

private Q_SLOTS:
    void checkCaptchaImage();

Q_SIGNALS:
    void currentOperationCanceled();

private:
    QNetworkAccessManager* networkAccessManager();

    void followRedirect(const QUrl &url);

    static int MAX_REDIRECTS;
    
    QNetworkAccessManager *m_nam;

    QString m_url;

    int m_redirects;

    bool m_ownManager;
};

#endif // KEEPTOSHARERECAPTCHAPLUGIN_H
