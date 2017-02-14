java -cp h2/bin/h2*.jar org.h2.tools.Server \
	 -web -webAllowOthers -webPort 8081 \
	 -tcp -tcpAllowOthers -tcpPort 1521 \
	 -baseDir $1 &
