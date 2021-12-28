#!/bin/sh
echo CSDT Import Utility


# set defaults
export FROM_SITES=FirstSiteII
export DS=cloudwords_install_workspace

csdt() {
	CSDT_CMD=$1
	RESOURCES=$2
	FROM_SITES=$3
	TO_SITES=$4
	
	echo $CSDT_CMD $RESOURCES $FROM_SITES $TO_SITES
	java -classpath $CP com.fatwire.csdt.client.main.CSDT $SVR username=$USR password=$PW resources=$RESOURCES fromSites=$FROM_SITES toSites=$TO_SITES datastore=$DS cmd=$CSDT_CMD
}

doCsdtImport() {

	echo Importing components
	csdt import @ELEMENTCATALOG $FROM_SITES $TO_SITES
	csdt import @SITECATALOG $FROM_SITES $TO_SITES
}


setClasspath() {
        CP=$CSDT_BASE/WEB-INF/lib/csdt-client-11.1.1.8.0.jar
        CP=$CP:$CSDT_BASE/WEB-INF/lib/cas-client-core-3.1.9.jar
        CP=$CP:$CSDT_BASE/WEB-INF/lib/commons-logging-1.1.1.jar
        CP=$CP:$CSDT_BASE/WEB-INF/lib/cs-core.jar
        CP=$CP:$CSDT_BASE/WEB-INF/lib/httpclient-4.1.2.jar
        CP=$CP:$CSDT_BASE/WEB-INF/lib/httpcore-4.1.2.jar
        CP=$CP:$CSDT_BASE/WEB-INF/lib/httpmime-4.1.2.jar
        CP=$CP:$CSDT_BASE/WEB-INF/lib/rest-api-11.1.1.8.0.jar
        CP=$CP:$CSDT_BASE/WEB-INF/lib/sites-security-11.1.1.8.0.jar
        CP=$CP:$CSDT_BASE/WEB-INF/lib/spring-2.5.5.jar
        CP=$CP:$CSDT_BASE/WEB-INF/lib/wem-sso-api-11.1.1.8.0.jar
        CP=$CP:$CSDT_BASE/WEB-INF/lib/wem-sso-api-cas-11.1.1.8.0.jar
        CP=$CP:$CSDT_BASE/WEB-INF/lib/wem-sso-api-oam-11.1.1.8.0.jar
	CP=$CP:$INIPATH/Sun/jws/common/lib/sun-redistribs.jar
        export CP
}




command -v java >/dev/null && continue || { echo "java not found.  Please add java to your path and re-run this script."; exit 1; }

while true; do
	read -p "Enter the path to the WebCenter Sites web application (e.g. /opt/apache-tomcat-7.0.54/webapps/cs): " -i "/opt/apache-tomcat-7.0.54/webapps/cs" -e CSDT_BASE
	if [[ -f $CSDT_BASE/WEB-INF/web.xml ]]
	then
		read -p "Enter the WebCenter Sites home (inipath) (e.g. /opt/sites-11.1.1.8.0): " -i "/opt/sites-11.1.1.8.0" -e INIPATH
		if [[ -f $INIPATH/futuretense.ini ]]
		then
			setClasspath;
			read -p "Enter the URL to WebCenter Sites Satellite (e.g. http://unicorn:80/cs/Satellite): " -i "http://unicorn:80/cs/Satellite" -e SVR
			read -p "Enter WCS admin username: " -i "fwadmin" -e USR
			echo -n "Enter the WCS admin password: "
			read -s -i "xceladmin" -e PW
			echo
			read -p "Enter the WCS Site name(s) (e.g. FirstSiteII,avisports): " -i "FirstSiteII" -e TO_SITES

       			echo Creating $DS
			rm -rf $INIPATH/export/envision/$DS
			mkdir $INIPATH/export/envision/$DS
			echo Copying files to workspace
    		    	cp -R envision/cs_workspace/* $INIPATH/export/envision/$DS/
			echo Entering workspace
        		cd $INIPATH/export/envision
ls 

			doCsdtImport;

			echo Cleaning up $DS
       			rm -rf $INIPATH/export/envision/$DS
			
			break;
		else
			echo "Invalid inipath $INIAPTH.  Please try again."
		fi	
	else
		echo "Invalid path.  Please try again."
	fi
done

