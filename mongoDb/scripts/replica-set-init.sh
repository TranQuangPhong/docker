#!/bin/bash

mongosh <<EOF
var config = {
    "_id": "my-replica-set",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "mongo_1:27017",
            "priority": 3
        },
        {
            "_id": 2,
            "host": "mongo_2:27017",
            "priority": 2
        },
        {
            "_id": 3,
            "host": "mongo_3:27017",
            "priority": 1
        }
    ]
};
rs.initiate(config, { force: true });
rs.status();
EOF
