#!/bin/bash

# 05.01
#   This script demonstrates the difference bitween MyISAM & InnoDB storage engine of MySQL
#   Source: https://wikibook.co.kr/realmysql801/

set -e
. ../../.env
source <(curl -sL https://raw.githubusercontent.com/haeramkeem/sh-it/main/func/exec_sql.sh) # For Linux
eval "$(curl -sL https://raw.githubusercontent.com/haeramkeem/sh-it/main/func/exec_sql.sh)" # For MacOS

# Create MyISAM managed table
echo ""
echo "*** Create MyISAM managed table:"
cat << EOF | exec_sql
DROP TABLE IF EXISTS myisam;
CREATE TABLE myisam ( pk INT NOT NULL, PRIMARY KEY ( pk ) ) ENGINE=MyISAM;
EOF

# Create InnoDB managed table
echo ""
echo "*** Create InnoDB managed table:"
cat << EOF | exec_sql
DROP TABLE IF EXISTS innodb;
CREATE TABLE innodb ( pk INT NOT NULL, PRIMARY KEY ( pk ) ) ENGINE=InnoDB;
EOF

# Prepare rows
echo ""
echo "*** Prepare rows:"
cat << EOF | exec_sql
INSERT INTO myisam ( pk ) VALUES ( 3 );
INSERT INTO innodb ( pk ) VALUES ( 3 );
EOF

# Scenario 1)
#   In this scnario, add three rows that have 1, 2, 3 for PRIMARY KEY sequentially to the MyISAM table
#   As adding 3 for PRIMARY KEY violates the PRIMARY KEY contstraint, this SQL will fail
#   But because MyISAM storage engine doesn't support transaction, the rows which have 1, 2 for PRIMARY KEY
#   are added even if the SQL execution is failed
echo ""
echo "*** Add PK=1,2,3 to the MyISAM table:"
cat << EOF | exec_sql
INSERT INTO myisam ( pk ) VALUES ( 1 ), ( 2 ), ( 3 );
EOF

echo ""
echo "*** And the result is:"
cat << EOF | exec_sql
SELECT * FROM myisam;
EOF

# Scenario 2)
#   Three rows that have 1, 2, 3 for PRIMARY KEY sequentially are added to the InnoDB table as the scenario 1
#   However, unlike MyISAM, this execution will be rollbacked as InnoDB supports transaction
#   Thus none of the rows are added
echo ""
echo "*** Add PK=1,2,3 to the InnoDB table:"
cat << EOF | exec_sql
INSERT INTO innodb ( pk ) VALUES ( 1 ), ( 2 ), ( 3 );
EOF

echo ""
echo "*** And the result is:"
cat << EOF | exec_sql
SELECT * FROM innodb;
EOF
