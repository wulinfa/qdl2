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

#ifndef URLRESULT_H
#define URLRESULT_H

#include <QList>
#include <QString>

struct UrlResult
{
    UrlResult(const QString &u, const QString &f) :
        url(u),
        fileName(f)
    {
    }
    
    QString url;
    QString fileName;
};

typedef QList<UrlResult> UrlResultList;

#endif // URLRESULT_H
