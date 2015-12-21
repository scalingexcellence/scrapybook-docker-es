#!/bin/bash

apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 46095ACC8548582C1A2699A9D27D666CD88E42B4

echo "deb http://packages.elasticsearch.org/elasticsearch/2.x/debian stable main" > /etc/apt/sources.list.d/elasticsearch.list

apt-get update

apt-get install -y --no-install-recommends elasticsearch=2.1.1

for path in \
		/usr/share/elasticsearch/data \
		/usr/share/elasticsearch/logs \
		/usr/share/elasticsearch/config \
		/usr/share/elasticsearch/config/scripts \
	; do \
		mkdir -p "$path"; \
		chown -R elasticsearch:elasticsearch "$path"; \
done

mv /tmp/scripts/config/* /usr/share/elasticsearch/config

# Start ES at boot
mkdir -p /etc/service/es
mv /tmp/scripts/es.sh /etc/service/es/run

rm -rf /var/lib/apt/lists/* /tmp/scripts
