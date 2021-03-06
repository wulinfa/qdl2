/*
 * Copyright (C) 2016 Stuart Howarth <showarth@marxoft.co.uk>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms and conditions of the GNU General Public License,
 * version 3, as published by the Free Software Foundation.
 *
 * This program is distributed in the hope it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
 */

#ifndef RECAPTCHAPLUGIN_H
#define RECAPTCHAPLUGIN_H

#include <QObject>
#include <QVariantList>

class QImage;
class QNetworkAccessManager;

/*!
    \class RecaptchaPlugin
    \brief The base class for recaptcha plugins.
*/
class RecaptchaPlugin : public QObject
{
    Q_OBJECT

public:
    explicit RecaptchaPlugin(QObject *parent = 0) :
        QObject(parent)
    {
    }

    /*!
        \brief Creates an instance of the plugin with the specified parent.
    */
    virtual RecaptchaPlugin* createPlugin(QObject *parent = 0) = 0;

    /*!
        \brief Allows the plugin to share an application QNetworkNetworkManager instance.
        
        The base implementation does nothing. If you choose to re-implement this function,
        the plugin should not take ownership of the QNetworkAccessManager instance.
        
        The QNetworkAccessManager is guaranteed to remain valid for the lifetime of the 
        plugin.
    */
    virtual void setNetworkAccessManager(QNetworkAccessManager*) {}

public Q_SLOTS:
    /*!
        \brief Cancels the current operation.
        
        Should return \c true if successful.
    */
    virtual bool cancelCurrentOperation() = 0;

    /*!
        \brief Retrives a captcha image for the specified key.
    */
    virtual void getCaptcha(const QString &captchaKey) = 0;

Q_SIGNALS:
    /*!
        \brief This signal should be emitted when a captcha image is successfully retrieved.
    */
    void captcha(const QString &captchaChallenge, const QImage &captchaImage);

    /*!
        \brief This signal should be emitted when the plugin is unable to retrieve a captcha image.
    */
    void error(const QString &errorString);

    /*!
        \brief This signal should be emitted when some additional data is required to complete an operation.
                
        The \a callback method will be called when the user submits the settings and should take a QVariantMap
        as its sole argument.
    */
    void settingsRequest(const QString &title, const QVariantList &settings, const QByteArray &callback);
};

Q_DECLARE_INTERFACE(RecaptchaPlugin, "org.qdl2.RecaptchaPlugin")

#endif // RECAPTCHAPLUGIN_H
