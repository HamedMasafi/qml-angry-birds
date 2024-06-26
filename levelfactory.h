#ifndef LEVELFACTORY_H
#define LEVELFACTORY_H

#include <QtQml>
#include <QObject>

class LevelFactory : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit LevelFactory(QObject *parent = 0);

    Q_INVOKABLE void addLevel(QString name, QString jsonData);
    Q_INVOKABLE QString openLevel(QString name);
    Q_INVOKABLE QStringList levels();
signals:

public slots:
};

#endif // LEVELFACTORY_H
