
		
	
		
	
	
	
	
	
	
	
		
Template: LayoutTemplate
*Name		LayoutTemplate
Description:		
ID:		1402096229585
Status:		Edited
Source:		Unavailable
Category:		Banner
Usage:		Element is used as Layout.
For Asset Type:		ACS Global Settings storage, Agilent Asset, Agilent Parent, BoundedSearch Asset, BoundedSearch Parent, Collection, Contact CTA Asset, Contact CTA Parent, Contact Detail Asset, Contact Detail Parent, ContactUSQueries, ContactUs Asset, ContactUs Parent , Content Query, Country Asset, CustomerTestimonial Asset, CustomerTestimonial Parent, DigitalContent Asset, DigitalContent Parent, Download Form Fields, Download Form Labels, FW_Application, FW_View, FirmwareDowload Content, FirmwareDownload Parent, FormField_P, Form_P, GSA Asset, GSA Parent, LibraryContent Asset, LibraryContent Parent, List of URL entries with entitlement, List of entitlement providers, MarketArea Asset, MarketArea Parent , Miscellaneous Asset, Miscellaneous Parent Asset, MultimediaST Asset, MultimediaST Parent, MyAgilent Asset, MyAgilent Parent, News/Announcement Asset, News/Announcement Parent, Newsletter Asset, Newsletter Parent, Page, Part Number, Password Encryptor UI, Products Asset, Products Parent, Promotions Asset, Promotions Parent, Query, Recommendation, Reference Content, Reference Parent, SAMPLEGSA_C, SAMPLEGSA_P, Section Asset, Section_P, Services Content, Services Parent, Site Plan, Slots Asset, Slots_P, Software Download Asset, Software Download Parent, Solution Content Asset, Solution Parent, StoryTelling Asset, StoryTelling Parent, Support Asset, Support Parent, Testing_C, Testing_P, TrainingEvents Asset, TrainingEvents Parent, YouTube Video
Applies to subtypes:		Any
Rootelement:		/LayoutTemplate
ElementCatalog Description:		
Element Storage Path/Filename:		LayoutTemplate,8.jsp
Element Parameters:		tid=1402096229585
Additional Element Parameters:		
Element Logic: 		

<%@page import="com.fatwire.services.util.AssetUtil"

%><%@page import="com.fatwire.assetapi.query.SortOrder"

%><%@page import="com.fatwire.assetapi.query.OpTypeEnum"

%><%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"

%><%@ taglib prefix="asset" uri="futuretense_cs/asset.tld"

%><%@ taglib prefix="assetset" uri="futuretense_cs/assetset.tld"

%><%@ taglib prefix="commercecontext" uri="futuretense_cs/commercecontext.tld"

%><%@ taglib prefix="ics" uri="futuretense_cs/ics.tld"

%><%@ taglib prefix="listobject" uri="futuretense_cs/listobject.tld"

%><%@ taglib prefix="render" uri="futuretense_cs/render.tld"

%><%@ taglib prefix="searchstate" uri="futuretense_cs/searchstate.tld"

%><%@ taglib prefix="siteplan" uri="futuretense_cs/siteplan.tld"

%><%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"

%><%@ page import="java.io.*"

%><%@ page import="com.fatwire.system.Session"

%><%@ page import="com.fatwire.system.SessionFactory"

%><%@ page import="com.openmarket.xcelerate.asset.AssetIdImpl"

%><%@ page import="org.apache.commons.logging.LogFactory"

%><%@ page import="org.apache.commons.logging.Log"

%><%@ page import="com.fatwire.assetapi.data.AssetId"

%><%@ page import="com.fatwire.assetapi.data.*"

%><%@ page import="com.fatwire.assetapi.def.*"

%><%@ page import="org.apache.commons.lang.StringUtils"

%><%@ page import="org.apache.commons.lang.StringEscapeUtils"

%><%@page import="com.fatwire.assetapi.data.AssetDataManagerImpl"

%><%@page import="com.agilent.wcs.AgilentConstants"

%><%@page import="com.agilent.apollo.business.WCSBusinessService"

%><%@page import="com.agilent.apollo.business.impl.WCSBusinessServiceImpl"

%><%@page import="java.net.URLDecoder"

%><%@page import="com.fatwire.assetapi.query.Query,

com.fatwire.assetapi.query.SimpleQuery,

com.fatwire.assetapi.query.Condition,

com.fatwire.assetapi.query.ConditionFactory"

%><%@ page import="COM.FutureTense.Interfaces.*,

COM.FutureTense.Util.ftMessage,

COM.FutureTense.Util.ftErrors,java.text.*,java.net.*,                 

java.io.*,java.util.*,com.fatwire.assetapi.data.*,

java.io.Closeable,java.io.IOException,java.io.InputStream,java.util.Map.Entry,

org.codehaus.jackson.map.DeserializationConfig,

org.codehaus.jackson.map.ObjectMapper,org.codehaus.jackson.map.type.MapType,

org.codehaus.jackson.map.SerializationConfig,

org.json.simple.JSONObject,org.json.simple.JSONArray,

org.json.simple.parser.JSONParser,

org.json.simple.parser.ParseException,javax.servlet.http.*"

%><%@page import="com.fatwire.mda.Dimension"

%><%@page import="com.fatwire.mda.DimensionManager"

%><%@ page import="com.fatwire.mda.DimensionableAssetManager"

%><%@page import="com.agilent.wcs.CountryRegionEntitlement"

%><%@page import="com.agilent.wcs.LocalizedLabels,java.net.URLEncoder"

%><cs:ftcs><%-- /LayoutTemplate

INPUT

OUTPUT

--%><%-- Record dependencies for the Template --%><%

%><ics:if condition='<%=ics.GetVar("tid")!=null%>'><ics:then><render:logdep cid='<%=ics.GetVar("tid")%>' c="Template"/></ics:then></ics:if><%

%><asset:getsubtype type='<%=ics.GetVar("c")%>' objectid='<%=ics.GetVar("cid")%>' output="subType" />

<%!

public String getCookieData(Cookie[]  cookies,String keyName){

	String keyValue="";

	if (cookies != null) {

		for (Cookie cookie : cookies) {

			if (cookie.getName().equals(keyName)) {

				if(!cookie.getValue().equalsIgnoreCase("(null)")){

					keyValue = StringEscapeUtils.escapeHtml(cookie.getValue());

					keyValue = keyValue.replaceAll("'", "&quot;");

				}

			}

		}

	}

	return keyValue;

}



%>

<%

Log log = LogFactory.getLog("Agilent.Web.Pages.Layout");

String strHTMLContent="";

Cookie[] cookies = request.getCookies();

String webChatCountry = getCookieData(cookies,"countryCode");

boolean enableChat =false;

String gtmIFrameScript=ics.GetProperty("cs.gtm.iframe.script", "Environment.ini", true)!=null?ics.GetProperty("cs.gtm.iframe.script", "Environment.ini", true):"";

String googleTMURL="//www.googletagmanager.com";

if(ics.GetProperty("cs.googleTMURL", "WebPagesSectionList.ini", true)!=null){

googleTMURL=ics.GetProperty("cs.googleTMURL", "WebPagesSectionList.ini", true);

}

String verValue= Utilities.goodString(ics.GetProperty("cs.release.version", "WebPagesSectionList.ini", true))?ics.GetProperty("cs.release.version", "WebPagesSectionList.ini", true):"";

String jQPath = Utilities.goodString(ics.GetProperty("cs.jQuery.folder.path", "WebPagesSectionList.ini", true))?ics.GetProperty("cs.jQuery.folder.path", "WebPagesSectionList.ini", true):"/cs/agilent_scripts/";

String dataGridHost="http://datagridstg.cos.agilent.com/ignite?";

if(StringUtils.isNotBlank(ics.GetProperty("cs.dataGridHostName", "WebPagesSectionList.ini", true))){

	dataGridHost=ics.GetProperty("cs.dataGridHostName", "WebPagesSectionList.ini", true);

}

String stepRenderPreview="stepRenderPreview";

if(StringUtils.isNotBlank(ics.GetProperty("cs.stepRenderPreview", "WebPagesSectionList.ini", true))){

	stepRenderPreview=ics.GetProperty("cs.stepRenderPreview", "WebPagesSectionList.ini", true);

}

String stepHostName="http://pimintstg.cos.agilent.com/StepPreview/getProductInfo.jsp?"; 

if(StringUtils.isNotBlank(ics.GetProperty("cs.stepHostName", "WebPagesSectionList.ini", true))){

	stepHostName=ics.GetProperty("cs.stepHostName", "WebPagesSectionList.ini", true);

}

Map<String, Object> data=new HashMap<String, Object>();

//ics.getIServlet().getServletResponse().setHeader("X-FRAME-OPTIONS", "SAMEORIGIN");

CountryRegionEntitlement CountryRegionEntitlementObject = new CountryRegionEntitlement();

LocalizedLabels LocalizedLabelsObject = new LocalizedLabels();

LinkedHashMap<String,String> miscMap=new LinkedHashMap<String,String>();

String masterLocale="en_GLOBAL";

if(StringUtils.isNotBlank(ics.GetProperty("cs.masterLocale", "WebPagesSectionList.ini", true))){

	masterLocale=ics.GetProperty("cs.masterLocale", "WebPagesSectionList.ini", true);

}

String reqServer=request.getServerName(),dMain=".agilent.com",chinaCookieDomain=ics.GetProperty("cs.chinaCookieDomain", "WebPagesSectionList.ini", true), seoURLDomain="",chinaDomain=ics.GetProperty("cs.chinaDomain", "WebPagesSectionList.ini", true),googleCNId = Utilities.goodString(ics.GetProperty("cs.CN.google.site.verification", "WebPagesSectionList.ini", true))?ics.GetProperty("cs.CN.google.site.verification", "WebPagesSectionList.ini", true):"XrCOANBHDz4mZ0eTqGZZ1wEIxrH0OXBKP0NQumOxhPA";

String googleENId = Utilities.goodString(ics.GetProperty("cs.EN.google.site.verification", "WebPagesSectionList.ini", true))?ics.GetProperty("cs.EN.google.site.verification", "WebPagesSectionList.ini", true):"XrCOANBHDz4mZ0eTqGZZ1wEIxrH0OXBKP0NQumOxhPA";

if(StringUtils.isNotBlank(ics.GetProperty("cs.seoUrlDomain", "WebPagesSectionList.ini", true))){

	seoURLDomain=ics.GetProperty("cs.seoUrlDomain", "WebPagesSectionList.ini", true);

}

if(reqServer!= null && reqServer.indexOf(chinaDomain) !=-1){

	dMain=chinaCookieDomain;

	if(Utilities.goodString(ics.GetProperty("cs.seoUrlDomain.cn", "WebPagesSectionList.ini", true))){

		seoURLDomain=ics.GetProperty("cs.seoUrlDomain.cn", "WebPagesSectionList.ini", true);

	}

}

String browserTitle="",breadcrumbText="",pageUrlElement="",localeString="", regulatoryLocaleString="",localeForLiteratureSort="";

String metaKeyword="",metaDescription="",whiteListCountries="",pageTitle="",assetName = "",isRegulatory="No";

Boolean toStartDisplay=true, toStopDisplay=false, isseeallpage = false;

Boolean isseeallservicepage = false,isCalculatorpage = false, isprodcomparisonpage = false;

Boolean isboundedsearchpage = false, ispersonalizedpage = false, isACQLandingPage = false;

Boolean isACQFallOutPage = false, isSupportLandingPage=false,contactUspage=false;

Boolean contactUsForm=false, contactusSubmit = false, isGlobalOptOut=false, isXcelligencePage=false;

Boolean isNovoExpressPage=false, technologyPage =false;

Calendar cal = Calendar.getInstance();

String assetIdObj=ics.GetVar("cid");

String assetTypeObj=ics.GetVar("c");

if(Utilities.goodString(assetTypeObj) 

	&& (assetTypeObj.equalsIgnoreCase("Page") 

	|| assetTypeObj.equalsIgnoreCase("Agilent_C") 

	|| assetTypeObj.equalsIgnoreCase("BoundedSearch_C")  

	|| assetTypeObj.equalsIgnoreCase("GSA_C"))){

	enableChat = true;

}

long startTime=0;

long endTime=0;

Boolean isGenericPage=false,noHeaderFooter=false,isGenericGSA=false,isGenericNoIframeGSA = false;

String webChat="", enablePardot="No",pardotAId="105652",pardotCampId="8690",pardotVideoCampId="9642";

//code added for APP-10070 & APP-10071

String seoNoFollow="No",seoNoIndex="No",seoCanonicalUrl="",vanityURL = "",eloquaScriptUrl="",actualStepId = "",assetTitle= "";

boolean enableNewPCPLayout = false, enableNewPDPLayout = false,isStepPreview = false;

String boundedSearchKeyword=ics.GetVar("keyword"),boundedSearchKeyword2=ics.GetVar("keyword2"),boundedSearchTabName=ics.GetVar("tabname");

String templates = "";

//end of code added for APP-10070 & APP-10071

if(StringUtils.isNotBlank(ics.GetProperty("pardotAId", "WebPagesSectionList.ini", true))){

	pardotAId=ics.GetProperty("pardotAId", "WebPagesSectionList.ini", true);

}



if(StringUtils.isNotBlank(ics.GetProperty("pardotCampId", "WebPagesSectionList.ini", true))){

	pardotCampId=ics.GetProperty("pardotCampId", "WebPagesSectionList.ini", true);

}

if(StringUtils.isNotBlank(ics.GetProperty("pardotVideoCampId", "WebPagesSectionList.ini", true))){

	pardotVideoCampId=ics.GetProperty("pardotVideoCampId", "WebPagesSectionList.ini", true);

}

if(StringUtils.isNotBlank(ics.GetProperty("eloquaScriptUrl", "WebPagesSectionList.ini", true))){

	eloquaScriptUrl=ics.GetProperty("eloquaScriptUrl", "WebPagesSectionList.ini", true);

}

String csAgilentRequired="false";

if(StringUtils.isNotBlank(ics.GetProperty("cs.csagilent", "WebPagesSectionList.ini", true)))

{

	csAgilentRequired=ics.GetProperty("cs.csagilent", "WebPagesSectionList.ini", true);

}

//log.debug("Enter layout template isRegulatory-->"+isRegulatory);

startTime=System.currentTimeMillis();

String HomeCountryCode = "";

String regulatoryFlag="false";

boolean Agilent404Flag=false;

boolean PageUnavailableFlag=false;

String envHost=ics.GetProperty("cs.envHostForHeaderFooterService", "WebPagesSectionList.ini", true);



String regulatoryAssetTypes = ics.GetProperty("cs.regulatoryAssetTypes", "WebPagesSectionList.ini", true);

String redirectURL =ics.GetProperty("cs.countryselectionpage", "WebPagesSectionList.ini", true);

if(StringUtils.isBlank(redirectURL)){

	redirectURL="/cs/ContentServer?d=&pagename=Agilent/Utilities/CountrySelect";

}

List<String> dakoAssetTypesList=new ArrayList<String>();

if(regulatoryAssetTypes.contains(",")){

dakoAssetTypesList=Arrays.asList(regulatoryAssetTypes.split(","));

}else{

dakoAssetTypesList.add(regulatoryAssetTypes);

}

SimpleDateFormat wcsFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

Date currentDate = cal.getTime();

if(StringUtils.isNotBlank(ics.GetSSVar("__insiteDate"))){

	currentDate = wcsFormatter.parse(ics.GetSSVar("__insiteDate"));

}

String jSessionId = null;



//GetTemplateURL Change 



String lookUpPageString="";

String currentUrlLocale="";

String lookUpPageArray[]=null;

if(StringUtils.isNotBlank(ics.GetVar("lookuppage"))){

	lookUpPageString=ics.GetVar("lookuppage");

}



if(StringUtils.isBlank(lookUpPageString)){

	lookUpPageString=request.getParameter("lookuppage");

}



if(StringUtils.isNotBlank(lookUpPageString)){

	lookUpPageArray=lookUpPageString.split("/");

	currentUrlLocale=lookUpPageArray[3];

}

//log.debug("lookUpPageString ::"+lookUpPageString +"~ lookUpPageArray::"+lookUpPageArray+"~currentUrlLocale ::"+ currentUrlLocale);

//CR008

boolean botFlag=false;%>

<%

AttributeData dimensionData=null;

Session ses = SessionFactory.getSession();

AssetDataManager mgr =(AssetDataManager) ses.getManager( AssetDataManager.class.getName() );

AssetId currentAssetIdNew = new AssetIdImpl( assetTypeObj, Long.parseLong(assetIdObj));

%><asset:getsubtype type='<%=ics.GetVar("c")%>' objectid='<%=ics.GetVar("cid")%>' output="subType" /><%

%><%if(Utilities.goodString(ics.GetVar("c")) && Utilities.goodString(ics.GetVar("cid"))){ %><%

	%><asset:load name="theCurrentAsset" type='<%=ics.GetVar("c")%>' objectid='<%=ics.GetVar("cid")%>'  /><%

	%><asset:get name="theCurrentAsset" FIELD="updateddate" OUTPUT="assetupdateddate"/><%

%><%

response.addHeader("updated-date",ics.GetVar("assetupdateddate")) ;

response.setHeader("Last-Modified",ics.GetVar("assetupdateddate"));

response.addHeader("updated-date",ics.GetVar("assetupdateddate"));

response.sendRedirect(null);

}

String propertyName = "cs."+ics.GetVar("subType")+"Page";

String subTypeTempName = ics.GetProperty(propertyName, "WebPagesSectionList.ini", true);

//log.debug("PropertyName ............."+propertyName+"subTypeTempName........CURRENT........"+subTypeTempName);

String subTypeTemp = "/"+subTypeTempName;



localeString=null;

HomeCountryCode="US";



String botServer="";

String botServerParameter="";

String botRequestHeader="";



String assetDimension="";



	//String botServer=ics.GetProperty("cs.isBotServerCheck", "WebPagesSectionList.ini", true);

	if(StringUtils.isNotBlank(ics.GetProperty("cs.botServerParameter", "WebPagesSectionList.ini", true))){

		botServerParameter=ics.GetProperty("cs.botServerParameter", "WebPagesSectionList.ini", true);

	}else{

		//log.debug(" botServerParameter is empty in ini ");

	}



	//log.debug("botServerParameter "+botServerParameter);



	if(StringUtils.isNotBlank(botServerParameter)){

		botServer=request.getHeader(botServerParameter);

	}

	//log.debug("botServer from request header "+botServer);



	if(StringUtils.isNotBlank(ics.GetProperty("cs.botRequestHeader", "WebPagesSectionList.ini", true))){

		botRequestHeader=ics.GetProperty("cs.botRequestHeader", "WebPagesSectionList.ini", true);

	}else{

		//log.debug(" botRequestHeader is empty in ini ");

	}

	//log.debug("botRequestHeader "+botRequestHeader);

	

if(StringUtils.isNotBlank(botServer)  && botRequestHeader.equalsIgnoreCase(botServer)){

	botFlag=true;

}

//log.debug("botFlag ::: "+botFlag);



//Added for testing CW functionalities

//botFlag=true; 

//botServer="true";

//log.debug("botFlag set to true  ::: "+botFlag);

//log.debug("botServer set to true  ::: "+botServer);



boolean isCobalt = false;

String stepId=null,prodDescVal = "",prodTitleVal = "",subGrpTitle=null,webchatAtt1 = "web_chat_pxp",webchatAtt2 = "web_chat";



for( AssetData currentAssetData : mgr.read(Collections.singletonList( currentAssetIdNew )))

{

	

	if(currentAssetData.getAttributeData("step_identifier_id")!=null && currentAssetData.getAttributeData("step_identifier_id").getData()!=null){

		stepId=currentAssetData.getAttributeData("step_identifier_id").getData().toString();

		actualStepId = stepId;

		

	}

	if("Product".equalsIgnoreCase(currentAssetData.getAssetTypeDef().getSubtype()) && currentAssetData.getAttributeData("desc_long")!=null 

			&& currentAssetData.getAttributeData("desc_long").getData()!=null){

		prodDescVal=currentAssetData.getAttributeData("desc_long").getData().toString();		

	}else if("Product".equalsIgnoreCase(currentAssetData.getAssetTypeDef().getSubtype()) && currentAssetData.getAttributeData("desc_short")!=null 

			&& currentAssetData.getAttributeData("desc_short").getData()!=null){

		prodDescVal=currentAssetData.getAttributeData("desc_short").getData().toString();

	} 

	if("Category".equalsIgnoreCase(currentAssetData.getAssetTypeDef().getSubtype()) && currentAssetData.getAttributeData("prod_cate_desc")!=null && currentAssetData.getAttributeData("prod_cate_desc").getData()!=null){

		prodDescVal=currentAssetData.getAttributeData("prod_cate_desc").getData().toString();

	} if("Group".equalsIgnoreCase(currentAssetData.getAssetTypeDef().getSubtype()) && currentAssetData.getAttributeData("prod_group_desc")!=null && currentAssetData.getAttributeData("prod_group_desc").getData()!=null){

		prodDescVal=currentAssetData.getAttributeData("prod_group_desc").getData().toString();

	}

	if("SubGroup".equalsIgnoreCase(currentAssetData.getAssetTypeDef().getSubtype()) && currentAssetData.getAttributeData("prod_sub_group_short_desc")!=null && currentAssetData.getAttributeData("prod_sub_group_short_desc").getData()!=null){

		prodDescVal=currentAssetData.getAttributeData("prod_sub_group_short_desc").getData().toString();

	}else if("SubGroup".equalsIgnoreCase(currentAssetData.getAssetTypeDef().getSubtype()) && currentAssetData.getAttributeData("prod_group_desc")!=null && currentAssetData.getAttributeData("prod_group_desc").getData()!=null){

		prodDescVal=currentAssetData.getAttributeData("prod_group_desc").getData().toString();

	}

	if(currentAssetData.getAttributeData("page_title")!=null && currentAssetData.getAttributeData("page_title").getData()!=null){

		assetTitle=currentAssetData.getAttributeData("page_title").getData().toString();

		prodTitleVal=assetTitle;

	}			

	if(!"SkimProduct".equalsIgnoreCase(currentAssetData.getAssetTypeDef().getSubtype())){

		if(currentAssetData.getAttributeData("new_style_category")!=null && currentAssetData.getAttributeData("new_style_category").getData()!=null){

			String enableLayout = currentAssetData.getAttributeData("new_style_category").getData().toString();

			if(Utilities.goodString(enableLayout) && enableLayout.indexOf("Yes")!=-1 ){

				enableNewPCPLayout = true;

			}

		}

	}else{

		if(currentAssetData.getAttributeData("new_style_category")!=null && currentAssetData.getAttributeData("new_style_category").getData()!=null){

			String enableLayout = currentAssetData.getAttributeData("new_style_category").getData().toString();

			if(Utilities.goodString(enableLayout) && enableLayout.indexOf("Yes")!=-1 ){

				enableNewPDPLayout = true;

			}

		}

	}

	if(ics.GetVar("subType").equalsIgnoreCase("SkimSubGroup")){

		if(null !=currentAssetData.getAttributeData("parent_id") && null !=currentAssetData.getAttributeData("parent_id").getData()){

			AssetId parentAssetId = new AssetIdImpl(ics.GetVar("c"),Long.parseLong(currentAssetData.getAttributeData("parent_id").getData().toString()));

			for(AssetData parentDataValue:mgr.read(Collections.singletonList(parentAssetId)))

			{

				stepId = parentDataValue.getAttributeData("step_identifier_id").getData().toString();

			}

		}

		if(currentAssetData.getAttributeData("page_title")!=null && currentAssetData.getAttributeData("page_title").getData()!=null){

			subGrpTitle=currentAssetData.getAttributeData("page_title").getData().toString();

		}

	}

	if(ics.GetVar("subType").equalsIgnoreCase("BoundedSearch")){	

		if(null !=currentAssetData.getAttributeData("parent_product_p") && null !=currentAssetData.getAttributeData("parent_product_p").getData()){

			AssetId catId=(AssetId)currentAssetData.getAttributeData("parent_product_p").getData();

			for(AssetData catDataValue:mgr.read(Collections.singletonList(catId)))

			{

				if(catDataValue.getAssetTypeDef().getSubtype().equalsIgnoreCase("SkimCategory")){

					stepId = catDataValue.getAttributeData("step_identifier_id").getData().toString();

				}

			}

		}

	}

	if(enableNewPCPLayout){

		if(ics.GetVar("subType").equalsIgnoreCase("SkimGroup")){

			if(null !=currentAssetData.getAttributeData("parent_id") && null !=currentAssetData.getAttributeData("parent_id").getData()){

				AssetId categAssetId = new AssetIdImpl(ics.GetVar("c"),Long.parseLong(currentAssetData.getAttributeData("parent_id").getData().toString()));

				for(AssetData catDataValue:mgr.read(Collections.singletonList(categAssetId)))

				{

					stepId = catDataValue.getAttributeData("step_identifier_id").getData().toString();

				}

			}

			if(currentAssetData.getAttributeData("page_title")!=null && currentAssetData.getAttributeData("page_title").getData()!=null){

				subGrpTitle=currentAssetData.getAttributeData("page_title").getData().toString();

			}

		}if(ics.GetVar("subType").equalsIgnoreCase("SkimSubGroup")){

			if(null !=currentAssetData.getAttributeData("parent_id") && null !=currentAssetData.getAttributeData("parent_id").getData()){

				AssetId grpAssetId = new AssetIdImpl(ics.GetVar("c"),Long.parseLong(currentAssetData.getAttributeData("parent_id").getData().toString()));

				for(AssetData grpDataValue:mgr.read(Collections.singletonList(grpAssetId)))

				{

					if(null !=grpDataValue.getAttributeData("parent_id") && null !=grpDataValue.getAttributeData("parent_id").getData()){

						AssetId cattAssetId = new AssetIdImpl(ics.GetVar("c"),Long.parseLong(grpDataValue.getAttributeData("parent_id").getData().toString()));

														

						for(AssetData catDataValue:mgr.read(Collections.singletonList(cattAssetId)))

						{

							stepId = catDataValue.getAttributeData("step_identifier_id").getData().toString();

						}

					}

				}

			}

		}

	}

	if(currentAssetData.getAttributeData("Dimension")!=null && currentAssetData.getAttributeData("Dimension").getData()!=null){

		dimensionData=currentAssetData.getAttributeData("Dimension");

		assetDimension=CountryRegionEntitlementObject.getAssetDimension(dimensionData);

		

		if(botFlag){

			localeString=CountryRegionEntitlementObject.getAssetDimension(dimensionData);

			if(StringUtils.isBlank(localeString)){

				localeString="en_US";

			}

			HomeCountryCode=localeString.substring(localeString.lastIndexOf("_")+1);

			

			if(HomeCountryCode.equalsIgnoreCase("GLOBAL") || StringUtils.isBlank(HomeCountryCode)){

				HomeCountryCode="US";

			}

			//log.debug(" locale string dim "+localeString+"localeString botFlag :::  "+localeString+"HomeCountryCode botFlag :::  "+HomeCountryCode);

		

		}else{

			HomeCountryCode= getCookieData(cookies,"CountryCode");

			localeString= getCookieData(cookies,"agilent_locale");

			jSessionId= getCookieData(cookies,"JSESSIONID");		

			String xLangLocale = request.getHeader("X-LANGUAGE-LOCALE");

				if(xLangLocale!=null && "zh-CN".equalsIgnoreCase(xLangLocale)){

					localeString="zh_CN";

				}

			

			//Set locale to en_US for the locales which are not migrated to WCS

			String localeList=ics.GetProperty("cs.localelist", "WebPagesSectionList.ini", true);

					if(StringUtils.isNotBlank(localeList))

					{

						//log.debug("localeString.........."+localeString);

						if(StringUtils.isNotBlank(localeString)){

							if(!localeList.contains(localeString)){

								localeString="en_US";

							}

						}

					} 

				//log.debug("localeString cookies "+localeString); 

					}

		}

}// end of for assetdata



String cookieCurrPageURL = "";

if (cookies != null) {

	for (Cookie reqCookie : cookies) {

			if (reqCookie.getName().equals("currPageURL")) {

				cookieCurrPageURL = reqCookie.getValue();

				cookieCurrPageURL = URLDecoder.decode(cookieCurrPageURL,"utf-8");

				

			}

	}

}



if((ics.GetVar("subType").equalsIgnoreCase("SkimProduct") || ics.GetVar("subType").equalsIgnoreCase("SkimGroup") || ics.GetVar("subType").equalsIgnoreCase("SkimCategory") || ics.GetVar("subType").equalsIgnoreCase("SkimSubGroup") ||  ics.GetVar("subType").equalsIgnoreCase("BoundedSearch") ||enableNewPCPLayout   )){

	String url="";

	if(ics.GetVar("subType").equalsIgnoreCase("SkimProduct") ){

		if(StringUtils.isNotBlank(ics.GetVar("rendermode")) && ics.GetVar("rendermode").contains("stepRenderPreview")){

			isStepPreview = true;

			stepId=ics.GetVar("pdpID");

			if(stepId.indexOf("PRDSET_")!=-1){

				enableNewPDPLayout = true;

			}

			assetDimension=ics.GetVar("context");

			url=stepHostName+"pdpID="+stepId+"&context="+assetDimension;

			if(StringUtils.isNotBlank(assetDimension) && StringUtils.isNotBlank(ics.GetProperty("cs."+assetDimension, "WebPagesSectionList.ini", true))){

				assetDimension=ics.GetProperty("cs."+assetDimension, "WebPagesSectionList.ini", true);

			}

			else{

				assetDimension="en_GLOBAL";

			}

			ics.SetVar("rendermode", "preview");

		}else{

			url=dataGridHost+"cmd=get&cacheName=WebProductsCache&key="+stepId+"_"+assetDimension;

		}

	}else if(ics.GetVar("subType").equalsIgnoreCase("SkimGroup") || ics.GetVar("subType").equalsIgnoreCase("SkimSubGroup") || ics.GetVar("subType").equalsIgnoreCase("SkimCategory") || ics.GetVar("subType").equalsIgnoreCase("BoundedSearch")  ){

		url=dataGridHost+"cmd=get&cacheName=WebClassificationCache&key="+stepId+"_"+assetDimension;

	}

	log.info("url===================>"+url);

	url = url.trim().replaceAll("\uFFFD", "");

	URL obj = new URL(url);

	String USER_AGENT = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36";

	try{

		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		con.setRequestMethod("GET");

		con.setConnectTimeout(15000);

		con.setRequestProperty("User-Agent", USER_AGENT); 

		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));

		String inputLine; 

		StringBuffer strHTMLContentBuffer = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {

		  strHTMLContentBuffer.append(inputLine);

		}

		in.close();

		strHTMLContent = strHTMLContentBuffer.toString();

		if(StringUtils.isNotBlank(strHTMLContent) && strHTMLContent.contains("<lt/>")){

			strHTMLContent=strHTMLContent.replaceAll("<lt/>", "<");

		}

		if(StringUtils.isNotBlank(strHTMLContent) && strHTMLContent.contains("<gt/>")){

			strHTMLContent=strHTMLContent.replaceAll("<gt/>", ">");

		}

	}catch (Exception e) {

		Agilent404Flag=true;

		e.printStackTrace();

		log.error("Data Grid Connection Error-->"+e.getMessage());

	}

	log.info("strHTMLContent Layout===================>"+strHTMLContent);

	JSONParser parser = new JSONParser();

	if(StringUtils.isNotBlank(strHTMLContent))

	{

		try{

			Object objJson = parser.parse(strHTMLContent);

			JSONObject gridJson = (JSONObject) objJson;

			if(gridJson!=null && gridJson.get("response")!=null){

				Object responseJsonObj = parser.parse(gridJson.get("response").toString());



				JSONObject responseJson = (JSONObject) responseJsonObj;

				JSONObject prodJson = (JSONObject) responseJson.get(stepId);

				ObjectMapper mapper = new ObjectMapper();

				MapType type = mapper.getTypeFactory().constructMapType(Map.class, String.class, Object.class);

				if(prodJson!=null){

				data = mapper.readValue(prodJson.toString(), type);

				}

			}

		}catch (ParseException e) {

			e.printStackTrace();

			//log.error("Data Grid ParseException Exception-->"+e.getMessage());

		}

	}

}

String pageDesc = "";

String pageHeadline = "";

String pageTitleDisplay = "";

if(Utilities.goodString(actualStepId) && !actualStepId.equalsIgnoreCase(stepId)){

	String assetHTMLContent  ="";

	Map<String, Object> jsonData=new HashMap<String, Object>();

	if(ics.GetVar("subType").equalsIgnoreCase("SkimGroup") || ics.GetVar("subType").equalsIgnoreCase("SkimSubGroup") || ics.GetVar("subType").equalsIgnoreCase("SkimCategory") ){

		

		String urlcall="";

		urlcall=dataGridHost+"cmd=get&cacheName=WebClassificationCache&key="+actualStepId+"_"+assetDimension;

		log.info("url===================>"+urlcall);

		urlcall = urlcall.trim().replaceAll("\uFFFD", "");

		URL urlObj = new URL(urlcall);

		String USER_AGENT = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36";

	try{

		HttpURLConnection httpCon = (HttpURLConnection) urlObj.openConnection();

		httpCon.setRequestMethod("GET");

		httpCon.setConnectTimeout(15000);

		httpCon.setRequestProperty("User-Agent", USER_AGENT); 

		BufferedReader bf = new BufferedReader(new InputStreamReader(httpCon.getInputStream()));

		String inputVal; 

		StringBuffer strHTMLContentBuf = new StringBuffer();

		while ((inputVal = bf.readLine()) != null) {

			strHTMLContentBuf.append(inputVal);

		}

		bf.close();

		assetHTMLContent = strHTMLContentBuf.toString();

		if(StringUtils.isNotBlank(assetHTMLContent) && assetHTMLContent.contains("<lt/>")){

			assetHTMLContent=assetHTMLContent.replaceAll("<lt/>", "<");

		}

		if(StringUtils.isNotBlank(assetHTMLContent) && assetHTMLContent.contains("<gt/>")){

			assetHTMLContent=assetHTMLContent.replaceAll("<gt/>", ">");

		}

	}catch (Exception e) {

		e.printStackTrace();

		log.error("Data Grid Connection Error-->"+e.getMessage());

	}

	JSONParser parser = new JSONParser();

	if(StringUtils.isNotBlank(assetHTMLContent))

	{

		try{

			Object objectiveJson = parser.parse(assetHTMLContent);

			JSONObject gridValJson = (JSONObject) objectiveJson;

			if(gridValJson!=null && gridValJson.get("response")!=null){

				Object responseValObj = parser.parse(gridValJson.get("response").toString());

				

				JSONObject responseValJson = (JSONObject) responseValObj;

				JSONObject prodValJson = (JSONObject) responseValJson.get(actualStepId);

				ObjectMapper objMapper = new ObjectMapper();

				MapType mapObjType = objMapper.getTypeFactory().constructMapType(Map.class, String.class, Object.class);

				%><render:packargs outstr = "infoArgs"><%

				if(prodValJson!=null){

					jsonData = objMapper.readValue(prodValJson.toString(), mapObjType);

					if( jsonData.get("PrimaryKeywordPhrases")!=null){

						data.put("PrimaryKeywordPhrases",jsonData.get("PrimaryKeywordPhrases"));

					}else if( jsonData.get("MetaKeywords")!=null){

						data.put("MetaKeywords",jsonData.get("MetaKeywords"));

					}

					if(jsonData.get("MetaDescription")!=null){

						data.put("MetaDescription",jsonData.get("MetaDescription"));

					}else if(jsonData.get("WebDescriptionLong")!=null){

						data.put("WebDescriptionLong",jsonData.get("WebDescriptionLong"));

					}

					if(jsonData.get("ProductBrowserTitle")!=null){

						data.put("ProductBrowserTitle",jsonData.get("ProductBrowserTitle"));

					}else if(jsonData.get("WebPageBrowserTitle")!=null){

						data.put("WebPageBrowserTitle",jsonData.get("WebPageBrowserTitle"));

					}

					if(jsonData.get("WebDescriptionLong") !=null){

						pageDesc = jsonData.get("WebDescriptionLong").toString();

						prodDescVal=pageDesc;

						%><render:argument name="pageDesc" value='<%= pageDesc %>'/><%

					}

					if(jsonData.get("WebHeadline") !=null){

						pageHeadline = jsonData.get("WebHeadline").toString();	

						%><render:argument name="pageHeadline" value='<%= pageHeadline %>'/><%					

					}

						pageTitleDisplay = assetTitle;

						prodTitleVal=pageTitleDisplay;

						%><render:argument name="pageTitleDisplay" value='<%= pageTitleDisplay %>'/><%	

				}

				%></render:packargs><%

			}

		}catch (ParseException e) {

			e.printStackTrace();

			log.error("Data Grid ParseException Exception-->"+e.getMessage());

		}

	}

	}

	

}

if(StringUtils.isBlank(localeString)){

	localeString="en_US";

}

//log.debug("localeString final.============........."+localeString);

LinkedHashMap<String,String> acqLandingMap=new LinkedHashMap<String,String>();

acqLandingMap=LocalizedLabelsObject.getTitleMap(ics,localeString,"acqlanding");

miscMap=LocalizedLabelsObject.getTitleMap(ics,localeString,"miscellaneous");

String agilentText="Agilent";

String contactUsText="Contact Us";



if(StringUtils.isNotBlank(miscMap.get("Agilent"))){

	agilentText=miscMap.get("Agilent");

}

if(StringUtils.isNotBlank(miscMap.get("ContactUs"))){

	contactUsText=miscMap.get("ContactUs");

}

if(data.containsKey("ProductBrowserTitle") && data.get("ProductBrowserTitle")!=null){

	browserTitle=data.get("ProductBrowserTitle").toString();

}else if(data.containsKey("WebPageBrowserTitle") && data.get("WebPageBrowserTitle")!=null){

	browserTitle=data.get("WebPageBrowserTitle").toString();

}





if(StringUtils.isBlank(localeString)){%>

	<script language="javascript" type="text/javascript" src="<%=jQPath%>jquery.js<%=verValue%>"></script> 

	<script language="javascript" type='text/javascript' src="<%=jQPath%>jquery-ui.min.js<%=verValue%>"></script>

	<script language="javascript" type="text/javascript" src="/cs/agilent_scripts/jquery.cookie.js<%=verValue%>"></script>

    <script type="text/javascript"> 

		$.cookie("currPageURL",window.location.href,{ path: '/', domain: '<%=dMain%>', expires: 90 });

		window.location.href = '<%=redirectURL%>';

	</script>

<%}else{

// XSS vulnerabilities

localeString = StringEscapeUtils.escapeHtml(localeString);

localeString = localeString.replaceAll("'", "&quot;");



String templateName="";

DimensionableAssetManager dimMgr = (DimensionableAssetManager)ses.getManager(DimensionableAssetManager.class.getName());

DimensionManager dam = (DimensionManager)ses.getManager(DimensionManager.class.getName());

AssetId currentAssetId = new AssetIdImpl( assetTypeObj, Long.parseLong(assetIdObj));

String ajaxLoadMenu = ics.GetProperty("cs.l2menu.ajax.load", "WebPagesSectionList.ini", true);

boolean ajaxLoad=Utilities.goodString(ajaxLoadMenu)?Boolean.valueOf(ajaxLoadMenu):false;

				

log.debug("currentAssetId.........."+currentAssetId+"regulatoryAssetTypes.........."+regulatoryAssetTypes+"Asset Type.........."+currentAssetId.getType().toString());

SimpleDateFormat displayFormat = new SimpleDateFormat("dd-MMM-yyyy");

Date parsedDate = new Date();

//long currentDateLoc = System.currentTimeMillis();

String currentDateLoc=displayFormat.format(parsedDate);

//log.debug("currentDateLoc Date----"+currentDateLoc);



//JIRA-19138 code change for skipping redirects

String currAsType="";

String currAsSubType="";

String framedAssetTypeSubType="";

String isRegulatoryVal="";

boolean redirectAllowedBasedOnCountry=true;

String skipRedirectTypes=ics.GetProperty("cs.skipRedirectTypes", "WebPagesSectionList.ini", true);

if(null !=currentAssetId && (StringUtils.isNotBlank(skipRedirectTypes)))

{

currAsType=currentAssetId.getType().toString();





		for(AssetData currAsData:mgr.read(Collections.singletonList(currentAssetId)))

		{ 

			 AssetTypeDef assetdef = currAsData.getAssetTypeDef();

			 currAsSubType = assetdef.getSubtype();

			 //log.debug("Asset Subtype for the obtained current asset list "+currAsSubType);

		 	

			//log.info("AssetType + Subtype combination framed is "+currAsType +":"+currAsSubType);

			framedAssetTypeSubType=currAsType +":"+currAsSubType;	

			if(skipRedirectTypes.contains(framedAssetTypeSubType))

			{

			 //log.debug("Now loading.... isregulatory value , because for now avoiding redirects only for non regulatory assets."); 

			  if(currAsData.getAttributeData("isregulatory")!=null && currAsData.getAttributeData("isregulatory").getData()!=null){

					isRegulatoryVal=currAsData.getAttributeData("isregulatory").getData().toString();

						if(isRegulatoryVal.equalsIgnoreCase("No") || isRegulatoryVal.equalsIgnoreCase("false")){

							redirectAllowedBasedOnCountry=false;

							 log.info("Assettype:Subtype is "+currAsType +":"+currAsSubType+"isregulatory value is "+isRegulatoryVal+" and hence not redirecting urls ..."); 

						} else{

							// regulatory promotion still goes for a redirect

							log.info("Assettype:Subtype is  "+currAsType +":"+currAsSubType+"isregulatory value is "+isRegulatoryVal+" and hence redirects are allowed because it is a regulatory asset ...");

							redirectAllowedBasedOnCountry=true;

						}

				}

		  }	else

		  {

			 redirectAllowedBasedOnCountry=true;

		  }

		}

}



if(data.containsKey("CountryEntitlementConcatenated") && data.get("CountryEntitlementConcatenated")!=null){

	whiteListCountries=data.get("CountryEntitlementConcatenated").toString();

}

if(data.containsKey("RegulatedProduct") && data.get("RegulatedProduct")!=null){

		isRegulatory=data.get("RegulatedProduct").toString();

}

if(data.containsKey("RegulatedClassification") && data.get("RegulatedClassification")!=null){

		isRegulatory=data.get("RegulatedClassification").toString();

} 

if(null!=currentAssetId){

if(regulatoryAssetTypes.contains(currentAssetId.getType().toString()) && redirectAllowedBasedOnCountry){

//log.debug("isRegulatory before countryregion-->"+isRegulatory);

%><%

 %><ics:callelement element="/CountryRegionEntitlement"><%

		%><ics:argument name="assetId" value='<%=assetIdObj%>'/><%

		%><ics:argument name="assetType" value='<%=assetTypeObj%>'/><%

		%><ics:argument name="HomeCountryCode" value='<%=HomeCountryCode%>'/><%

		%><ics:argument name="HomeCountryLocale" value='<%=localeString%>'/><%

		%><ics:argument name="botServer" value='<%=botServer%>'/><%

		%><ics:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/><%

		%><ics:argument name="isRegulatory" value='<%=isRegulatory%>'/><%

		%><ics:argument name="title" value='<%=ics.GetVar("title")%>'/><%

		%><%if(StringUtils.isNotBlank(boundedSearchKeyword)){

			%><ics:argument name="keyword" value='<%=ics.GetVar("boundedSearchKeyword")%>'/><%

		}

		if(StringUtils.isNotBlank(boundedSearchKeyword2)){

			%><ics:argument name="keyword2" value='<%=ics.GetVar("boundedSearchKeyword2")%>'/><%

		}

		if(StringUtils.isNotBlank(boundedSearchTabName)){

			%><ics:argument name="tabname" value='<%=ics.GetVar("boundedSearchTabName")%>'/><%

		}

		if(StringUtils.isNotBlank(whiteListCountries)){

			%><ics:argument name="whiteListCountries" value='<%=whiteListCountries%>'/><%

		}%><%

%></ics:callelement><%



%><ics:callelement element="Agilent/Utilities/GetRedirectURL"><%

	%><ics:argument name="HomeCountryCode" value='<%=HomeCountryCode%>'/><%

%></ics:callelement><%



%><%

// changing the locale to new locale based on localisation

if(StringUtils.isNotBlank(ics.GetVar("localeForLiteratureSort")))

{

	localeForLiteratureSort=ics.GetVar("localeForLiteratureSort");

}

if(StringUtils.isNotBlank(ics.GetVar("regulatoryLocale")))

{

	regulatoryLocaleString=ics.GetVar("regulatoryLocale");;

}

if( StringUtils.isNotBlank(ics.GetVar("RegulatoryFlag")) && "true".equalsIgnoreCase(ics.GetVar("RegulatoryFlag"))){

	regulatoryFlag="true";

}

if(StringUtils.isNotBlank(ics.GetVar("Agilent404Flag")) &&  "true".equalsIgnoreCase(ics.GetVar("Agilent404Flag"))){

	Agilent404Flag=true;

}

if( StringUtils.isNotBlank(ics.GetVar("PageUnavailableFlag")) &&  "true".equalsIgnoreCase(ics.GetVar("PageUnavailableFlag"))){

	PageUnavailableFlag=true;

}

}else{

//log.debug("Coming to else of regulatoryAssetTypes");

}

}



//Code added for loading Dimension based locale starts

/*

log.debug("Generating Preview Mode for "+dimMgr.getRelative( currentAssetId, localeString));

if(!localeString.equalsIgnoreCase("en_US")){

	if(null!=(dimMgr.getRelative( currentAssetId, localeString))){

		currentAssetId = dimMgr.getRelative( currentAssetId, localeString );

		ics.SetVar("cid", String.valueOf(currentAssetId.getId()));

		ics.SetVar("c", currentAssetId.getType());

	}

} 

*/

//Code added for loading Dimension based locale end



for( AssetData currentAssetData : mgr.read(Collections.singletonList( currentAssetId )))

{

	if(currentAssetData.getAttributeData("template")!=null && currentAssetData.getAttributeData("template").getData()!=null){

		templateName=currentAssetData.getAttributeData("template").getData().toString();

		if(templateName.contains("LayoutTemplate")){

			templateName="";

		}

	}

	if(currentAssetData.getAttributeData("meta_keywords")!=null && currentAssetData.getAttributeData("meta_keywords").getData()!=null){

		metaKeyword=currentAssetData.getAttributeData("meta_keywords").getData().toString();

	}else if(data.containsKey("PrimaryKeywordPhrases") && data.get("PrimaryKeywordPhrases")!=null){

		metaKeyword=data.get("PrimaryKeywordPhrases").toString();

	}else if(data.containsKey("MetaKeywords") && data.get("MetaKeywords")!=null){

		metaKeyword=data.get("MetaKeywords").toString();

	}

	if(StringUtils.isNotBlank(metaKeyword) && metaKeyword.contains("|")){

		metaKeyword=metaKeyword.replaceAll("\\|",",");

	} 

	if(currentAssetData.getAttributeData("meta_description")!=null && currentAssetData.getAttributeData("meta_description").getData()!=null){

		metaDescription=currentAssetData.getAttributeData("meta_description").getData().toString();				

	}else if(data.containsKey("ProductMetaDescription") && data.get("ProductMetaDescription")!=null){				

		metaDescription=data.get("ProductMetaDescription").toString();

	}else if(data.containsKey("ProductPositioningStatement") && data.get("ProductPositioningStatement")!=null){				

		metaDescription=data.get("ProductPositioningStatement").toString();

	}else if(data.containsKey("MetaDescription") && data.get("MetaDescription")!=null){

		metaDescription=data.get("MetaDescription").toString();

	}else if(data.containsKey("WebDescriptionLong") && data.get("WebDescriptionLong")!=null){

		metaDescription=data.get("WebDescriptionLong").toString();

	}

	

	

	if(data.containsKey("ProductName") && data.get("ProductName")!=null){

		pageTitle=data.get("ProductName").toString();

	}else if(data.containsKey("WebPageTitle") && data.get("WebPageTitle")!=null){

		pageTitle=data.get("WebPageTitle").toString();

	}else if(currentAssetData.getAttributeData("page_title")!=null && currentAssetData.getAttributeData("page_title").getData()!=null){

		pageTitle=currentAssetData.getAttributeData("page_title").getData().toString();

	}

	if(currentAssetData.getAttributeData("browser_title")!=null && currentAssetData.getAttributeData("browser_title").getData()!=null){

		browserTitle=currentAssetData.getAttributeData("browser_title").getData().toString();

	}

	if(currentAssetData.getAttributeData("browsertitle")!=null && currentAssetData.getAttributeData("browsertitle").getData()!=null){

		browserTitle=currentAssetData.getAttributeData("browsertitle").getData().toString();

	}

	if(Utilities.goodString(actualStepId) && actualStepId.equalsIgnoreCase(stepId)){

		if(data.containsKey("ProductPositioningStatement") && data.get("ProductPositioningStatement")!=null){				

			prodDescVal=data.get("ProductPositioningStatement").toString();

		}else if(data.containsKey("WebDescriptionLong") && data.get("WebDescriptionLong")!=null){

			prodDescVal=data.get("WebDescriptionLong").toString();

		}

		prodTitleVal=pageTitle;

	}



	if(currentAssetData.getAttributeData("name")!=null && currentAssetData.getAttributeData("name").getData()!=null){

		assetName=currentAssetData.getAttributeData("name").getData().toString();

		if ("SeeAllProducts".equalsIgnoreCase(assetName) && "Page".equals(assetTypeObj)) {

			isseeallpage = true; 

			pageTitle = "Products";

			if(StringUtils.isNotBlank(miscMap.get("Products"))){

				pageTitle=miscMap.get("Products");

			}

		}

		if ("SeeAllServices".equalsIgnoreCase(assetName) && "Page".equals(assetTypeObj)) {

			isseeallservicepage = true; 

			pageTitle = "Services";

			if(StringUtils.isNotBlank(miscMap.get("Services"))){

				pageTitle=miscMap.get("Services");

			}

		}

		if ("Calculator".equalsIgnoreCase(assetName) && "Agilent_C".equals(assetTypeObj)) {

			isCalculatorpage = true;			

		}

		if ("ProductComparisionPage".equalsIgnoreCase(assetName) && "Page".equals(assetTypeObj)) {

			isprodcomparisonpage = true; 

			pageTitle = "Product Comparison";

			if(StringUtils.isNotBlank(miscMap.get("ProductComparison"))){

				pageTitle=miscMap.get("ProductComparison");

			}

		}

		if (isprodcomparisonpage && StringUtils.isNotBlank(ics.GetVar("partlist"))) {

			pageTitle = "Part Comparison";

			if(StringUtils.isNotBlank(miscMap.get("PartComparison"))){

				pageTitle=miscMap.get("PartComparison");

			}

			if(StringUtils.isNotBlank(cookieCurrPageURL)){

			%><script>parentPage ='<%=cookieCurrPageURL%>';</script><%

			}

		}

		if ("PersonalizedDownloads".equalsIgnoreCase(assetName) && "Page".equals(assetTypeObj)) {

			ispersonalizedpage = true; 

			pageTitle = "Personalized Downloads";

			if(StringUtils.isNotBlank(miscMap.get("PersonalizedDownloads"))){

				pageTitle=miscMap.get("PersonalizedDownloads");

			}

		}

		if ("SupportLandingPage".equalsIgnoreCase(assetName) && "Page".equals(assetTypeObj)) {

			isSupportLandingPage = true; 

			pageTitle = "Support";

			if(StringUtils.isNotBlank(miscMap.get("Support"))){

				pageTitle=miscMap.get("Support");

			}

		}

		

		boolean loggedIn=false;

		String atgLoginUrl=ics.GetProperty("cs.atgLoginUrl", "ACQForm.ini", true);

		String checkSession=ics.GetVar("checkSession");		

		if ("ACQLandingPage".equalsIgnoreCase(assetName) && "Page".equals(assetTypeObj)) {		

			if (cookies != null) {

					for (Cookie reqCookie : cookies) {			

						if (reqCookie.getName().equals("loginFlag") && reqCookie.getValue().equalsIgnoreCase("true")) {

								//loggedIn=true;			

						%><ics:callelement element="GetATGResponseForACQ"><%

							%><ics:argument name="countryCode" value='<%=HomeCountryCode%>'/><%

							%><ics:argument name="locale" value='<%=localeString%>'/><%

							%><ics:argument name="userInfo" value="true"/><%

							%><ics:argument name="checkSession" value='<%=checkSession%>'/><%

						%></ics:callelement><%				

							if(StringUtils.isNotBlank(ics.GetVar("responseMap"))){

									String responseMap=ics.GetVar("responseMap");

									if(responseMap.contains("{") && responseMap.contains("}")){

											responseMap=responseMap.replaceAll("[\\{\\}\"]", "");

										}

									for(String responseMapStr:responseMap.split(",")){	

										if(responseMapStr.contains("email")){

												   String email=responseMapStr.substring(responseMapStr.indexOf("=")+1);

												   if(StringUtils.isNotBlank(email)){

													   loggedIn=true;

												   }else{

													   loggedIn=false;

												   }

										}

									}

								}								

						}

					}			

			}		

	

			log.info("loggedIn :"+loggedIn);

			//loggedIn=true;

			if(loggedIn){

					isACQLandingPage = true; 

					pageTitle = "ACQ";

					if(StringUtils.isNotBlank(acqLandingMap.get("ACQLandingLabel"))){

						pageTitle=acqLandingMap.get("ACQLandingLabel");

					}		

			}else{				

					%><script>

						var currUrl = location.href;

						var atgLoginUrl = '<%=atgLoginUrl%>'

						window.location.href=atgLoginUrl.concat(currUrl);

					</script><%		

			}	

		}

		if ("ACQFalloutPage".equalsIgnoreCase(assetName) && "Page".equals(assetTypeObj)) {	

			//loggedIn=true;

			if (cookies != null) {

					for (Cookie reqCookie : cookies) {				

						if (reqCookie.getName().equals("loginFlag") && reqCookie.getValue().equalsIgnoreCase("true")) {

								loggedIn=true;

						}

					}			

			}	

			if(loggedIn){

					isACQFallOutPage = true; 

					pageTitle = "ACQ";

					if(StringUtils.isNotBlank(acqLandingMap.get("ACQLandingLabel"))){

						pageTitle=acqLandingMap.get("ACQLandingLabel");

					}		

			}else{				

					%><script>

						var currUrl = location.href;

						var atgLoginUrl = '<%=atgLoginUrl%>'

						window.location.href=atgLoginUrl.concat(currUrl);

					</script><%		

			}	

		}

		

	}

	//DCWCS-7719 - Condition to read Browser field value

	if(isprodcomparisonpage && currentAssetData.getAttributeData("product_browser")!=null && currentAssetData.getAttributeData("product_browser").getData()!=null){

		browserTitle=currentAssetData.getAttributeData("product_browser").getData().toString();

	}

	if(isprodcomparisonpage && StringUtils.isNotBlank(ics.GetVar("partlist")) && currentAssetData.getAttributeData("part_browser")!=null && currentAssetData.getAttributeData("part_browser").getData()!=null){

		browserTitle=currentAssetData.getAttributeData("part_browser").getData().toString();

	}

	if(ics.GetVar("subType").equalsIgnoreCase("Software")){

		if(currentAssetData.getAttributeData("name")!=null && currentAssetData.getAttributeData("name").getData()!=null){

			assetName=currentAssetData.getAttributeData("name").getData().toString();

			if("Novoexpress Software Download".equalsIgnoreCase(assetName)){

				isGenericPage= true;

				templateName = "/SoftwareDownloadTemplate";

			}

			else if("RTCA Software Download".equalsIgnoreCase(assetName)){

				isGenericPage= true;

				templateName = "/RTCASoftwareDownloadTemplate";

			}

		}

	}

	

	if(ics.GetVar("subType").equalsIgnoreCase("PageUrl")){

		if(currentAssetData.getAttributeData("name")!=null && currentAssetData.getAttributeData("name").getData()!=null){

			assetName=currentAssetData.getAttributeData("name").getData().toString();

			pageUrlElement="Agilent/Utilities/"+assetName;

			pageUrlElement.replaceAll(" ","");

			log.debug(assetName+"---Template name pageUrlElement-------------"+pageUrlElement);

			if ("ContactUsPage".equalsIgnoreCase(assetName)){

				contactUspage = true; 

			}

			else if("ContactUsForm".equalsIgnoreCase(assetName)){

				contactUsForm = true; 

			}

			else if ("ContactUsSubmit".equalsIgnoreCase(assetName)){

				contactusSubmit = true; 

			}

			else if("GlobalOptOutPage".equalsIgnoreCase(assetName)){

				pageUrlElement="GlobalOptOut/GlobalOptOutPage";

				isGlobalOptOut=true;

			}

			else if("GlobalOptOutConfirmation".equalsIgnoreCase(assetName)){

				pageUrlElement="GlobalOptOut/ConfirmationPage";

				isGlobalOptOut=true;

			}

			else if("RequestYourDemo".equalsIgnoreCase(assetName)){

				pageUrlElement="/RequestYourDemo";

				isGlobalOptOut=true;

			}

			else if("Download Expiration".equalsIgnoreCase(assetName)){

				templateName="/DownloadExpirationTemplate";

				isGenericPage=true;

			}

			else if("Novoexpress Software Download".equalsIgnoreCase(assetName)){

				//pageUrlElement="/NovoExpressPageTemplate";

				//isGlobalOptOut=true;

				//isNovoExpressPage=true;

				isGenericPage= true;

				templateName = "/SoftwareDownloadTemplate";

			}

			else if("RTCA Software Download".equalsIgnoreCase(assetName)){

				//pageUrlElement="/XcelligencePageTemplate";

				//isGlobalOptOut=true;

				//isXcelligencePage=true;

				isGenericPage= true;

				templateName = "/RTCASoftwareDownloadTemplate";

			}



			else if("RequestDemoSuccess".equalsIgnoreCase(assetName)){

				isGlobalOptOut=true;

			}

			else if("ReachbackForm".equalsIgnoreCase(assetName)){

				pageUrlElement="ScanForm";

				isGlobalOptOut=true;

			}

			else if("ReachbackFormSuccessPage".equalsIgnoreCase(assetName)){

				pageUrlElement="ReachbackFormSuccess";

				isGlobalOptOut=true;

			}

		}

	}

	if (isprodcomparisonpage && StringUtils.isNotBlank(ics.GetVar("partlist"))) {

		webchatAtt2="web_chat_part";

	}else if(isprodcomparisonpage){

		webchatAtt2="web_chat_prod";

	}

	if(ics.GetVar("subType").equalsIgnoreCase("SubGroup") || ics.GetVar("subType").equalsIgnoreCase("Group") || (ics.GetVar("subType").equalsIgnoreCase("category") && !assetTypeObj.equalsIgnoreCase("Page")) || ics.GetVar("subType").equalsIgnoreCase("Product") || ics.GetVar("subType").contains("Skim")){

		if(currentAssetData.getAttributeData(webchatAtt1)!=null && currentAssetData.getAttributeData(webchatAtt1).getData()!=null){

			webChat=currentAssetData.getAttributeData(webchatAtt1).getData().toString();

			if("Cobalt".equalsIgnoreCase(webChat)){

				isCobalt = true;

			}

		}

	}else{

		if(currentAssetData.getAttributeData(webchatAtt2)!=null && currentAssetData.getAttributeData(webchatAtt2).getData()!=null){

			webChat=currentAssetData.getAttributeData(webchatAtt2).getData().toString();

			if("Cobalt".equalsIgnoreCase(webChat)){

				isCobalt = true;

			}

		}

	}

	if(currentAssetData.getAttributeData("enable_pardot_tracking")!=null && currentAssetData.getAttributeData("enable_pardot_tracking").getData()!=null){

		enablePardot=currentAssetData.getAttributeData("enable_pardot_tracking").getData().toString();

	}

	if(currentAssetData.getAttributeData("isregulatory")!=null && currentAssetData.getAttributeData("isregulatory").getData()!=null){

		isRegulatory=currentAssetData.getAttributeData("isregulatory").getData().toString();

	}

		//code added for APP-10070 & APP-10071

	if(currentAssetData.getAttributeData("seo_nofollow")!=null && currentAssetData.getAttributeData("seo_nofollow").getData()!=null){

		seoNoFollow=currentAssetData.getAttributeData("seo_nofollow").getData().toString();

	}

	if(currentAssetData.getAttributeData("seo_noindex")!=null && currentAssetData.getAttributeData("seo_noindex").getData()!=null){

		seoNoIndex=currentAssetData.getAttributeData("seo_noindex").getData().toString();

	}

	if(currentAssetData.getAttributeData("seo_canonical_url")!=null && currentAssetData.getAttributeData("seo_canonical_url").getData()!=null){

		seoCanonicalUrl=currentAssetData.getAttributeData("seo_canonical_url").getData().toString();

		if(reqServer!= null && reqServer.indexOf(chinaDomain) !=-1 && seoCanonicalUrl.indexOf(chinaDomain)==-1 && seoCanonicalUrl.indexOf(".agilent.com")!=-1){

			seoCanonicalUrl = seoCanonicalUrl.replace(".agilent.com",chinaDomain);

		}

	}

	if(currentAssetData.getAttributeData("vanityurl")!=null && currentAssetData.getAttributeData("vanityurl").getData()!=null){

		vanityURL=currentAssetData.getAttributeData("vanityurl").getData().toString();

	}

	//end of code added for APP-10070 & APP-10071

	SimpleDateFormat fwFormatter = new SimpleDateFormat("EEE MMM d HH:mm:ss z yyyy");



	if(null !=currentAssetData.getAttributeData("startdate") && null !=currentAssetData.getAttributeData("startdate").getData()){

		Date startDate = fwFormatter.parse(currentAssetData.getAttributeData("startdate").getData().toString());

		log.debug("Start Date----"+startDate+"Current Date----"+currentDate);

		if(startDate.compareTo(currentDate)>0){

			toStartDisplay=false;

			//log.debug("startDate is after currentDate");

		}else if(startDate.compareTo(currentDate)<0){

			toStartDisplay=true;

			//log.debug("startDate is before currentDate");

		}else if(startDate.compareTo(currentDate)==0){

			toStartDisplay=true;

			//log.debug("startDate is equal to currentDate");

		}else{

			toStartDisplay=false;

			//log.debug("Invalid Date");

		}

		

	}else{

		toStartDisplay=true;

		//log.debug("----------Start Date not given---------");

	}

	

	if(null !=currentAssetData.getAttributeData("enddate") && null !=currentAssetData.getAttributeData("enddate").getData()){

		Date endDate = fwFormatter.parse(currentAssetData.getAttributeData("enddate").getData().toString());

		log.debug("End Date----"+endDate+"Current Date----"+currentDate);

		if(endDate.compareTo(currentDate)>0){

			toStopDisplay=false;

			//log.debug("endDate is after currentDate");

		}else if(endDate.compareTo(currentDate)<0){

			toStopDisplay=true;

			//log.debug("endDate is before currentDate");

		}else if(endDate.compareTo(currentDate)==0){

			toStopDisplay=true;

			//log.debug("endDate is equal to currentDate");

		}else{

			toStopDisplay=false;

			//log.debug("Invalid Date");

		}

	}else{

		toStopDisplay=false;

		//log.debug("----------End Date not given---------");

	}	

}

//19.2 Changes DCWCS-6742

log.info("enableNewPCPLayout : "+enableNewPCPLayout);

if(enableNewPCPLayout){

	subTypeTemp = "/CategoryTemplate";

}

//19.2 Changes DCWCS-6742

if(StringUtils.isNotBlank(ics.GetVar("rendermode")) && (ics.GetVar("rendermode").equalsIgnoreCase("preview") || ics.GetVar("rendermode").equalsIgnoreCase("previewnoinsite"))){

	toStartDisplay=true;

	toStopDisplay=false;

}

log.debug("rendermode----------"+ics.GetVar("rendermode")+"----toStartDisplay------"+toStartDisplay+"-----toStopDisplay----"+toStopDisplay +"--Agilent404Flag"+Agilent404Flag+"--PageUnavailableFlag"+PageUnavailableFlag);

%><render:callelement elementname="Agilent/Security/Check" scoped="global"><%

	%><render:argument name="calledTemplate" value="Agilent/LayoutTemplate" /><%

	%><render:argument name="locale" value='<%=localeString%>'/><%

%></render:callelement><%



%><%log.debug("---********-------Agilent/Security/Check**********---------"+ics.GetVar("EntitlementLayout.allowRender")); %><%

%><ics:if condition='<%= "true".equals(ics.GetVar("EntitlementLayout.allowRender")) %>'><%

%><ics:then><%

if(toStartDisplay && !toStopDisplay && !Agilent404Flag && !PageUnavailableFlag){

	if(assetTypeObj.equalsIgnoreCase("GSA_C") && StringUtils.isNotBlank(subTypeTempName)){

		isGenericGSA=false;

		subTypeTemp = subTypeTempName;

		log.debug("Sub Type Template Name "+subTypeTemp);

	}else if((assetTypeObj.equalsIgnoreCase("Training_Events_C") || assetTypeObj.equalsIgnoreCase("GSA_C") || assetTypeObj.equalsIgnoreCase("Support_C")) && StringUtils.isBlank(templateName)){

		isGenericGSA=true;

	}else if((assetTypeObj.equalsIgnoreCase("Training_Events_C") || assetTypeObj.equalsIgnoreCase("GSA_C") || assetTypeObj.equalsIgnoreCase("Support_C")) && StringUtils.isNotBlank(templateName) && templateName.contains("GenericTemplateWithFourZonesNoIframe")){

		isGenericNoIframeGSA=true;

	}else if((assetTypeObj.equalsIgnoreCase("Training_Events_C") || assetTypeObj.equalsIgnoreCase("GSA_C") || assetTypeObj.equalsIgnoreCase("Support_C")) && StringUtils.isNotBlank(templateName) && templateName.contains("GenericTemplateWithFourZones")){

		isGenericGSA=true;

	}else if((assetTypeObj.equalsIgnoreCase("Training_Events_C") || assetTypeObj.equalsIgnoreCase("GSA_C") || assetTypeObj.equalsIgnoreCase("Support_C")) && StringUtils.isNotBlank(templateName) && templateName.contains("LayoutTemplate")){

		isGenericGSA=true;

	}

	//log.debug("---********-------Agilent/Security/Check  4**********---------"+isGenericGSA +" "+templateName);

	

	if(isGenericGSA){

		templates = "/GenericTemplateWithFourZones";

		%>

		<%

		%><render:calltemplate tname='/GenericTemplateWithFourZones' c='<%=ics.GetVar("c")%>' cid='<%=ics.GetVar("cid")%>'><%

			%><render:argument name="locale" value='<%=localeString%>'/><%

			%><render:argument name="fromTemplate" value="true"/><%

		%></render:calltemplate><%

	

	%><%}else if(isGlobalOptOut){%><render:callelement elementname='<%=pageUrlElement%>'><%

			%><render:argument name="locale" value='<%=localeString%>'/><%

			%><render:argument name="c" value='<%=ics.GetVar("c")%>'/><%

			%><render:argument name="cid" value='<%=ics.GetVar("cid")%>'/><%

		%></render:callelement><%

	%><%}else{

		if(StringUtils.isNotBlank(templateName) && assetTypeObj.equalsIgnoreCase("MultimediaST_C")){

			subTypeTempName="";

		}

	if(StringUtils.isBlank(subTypeTempName)){

		if(StringUtils.isNotBlank(templateName)){

			isGenericPage=true;

				if(templateName.contains("NoFixedWidthNoHeaderFooter") || templateName.equalsIgnoreCase("FixedWidthNoHeaderFooter") || templateName.contains("BlankSlate")){

				noHeaderFooter=true;

				if(templateName.contains("TechnologyPageTemplate")){

					technologyPage=true;

				}

			}

		}

	}

	if(isACQLandingPage){

		isGenericPage= true;

		templateName = "/ACQLandingPageTemplate";

	}

	if(isACQFallOutPage){		

	isGenericPage= true;

	templateName = "/ACQFalloutPageTemplate";

	}

	if(isCalculatorpage){

		isGenericPage= true;

		templateName = "/CalculatorTemplate";

	}



%>

<%





	%><%if(ics.GetVar("subType").equalsIgnoreCase("video") || isGenericPage){

		%><%

		%><render:satellitepage pagename="PopulateHTMLHeader"><%

			%><render:argument name="GenericPage" value="yes"/><%

			%><render:argument name="TemplateName" value='<%=templateName%>'/><%

			%><render:argument name="domain" value='<%=request.getServerName()%>'/><%

			%><render:argument name="assetId" value='<%=assetIdObj%>'/><%

			%><render:argument name="assetType" value='<%=assetTypeObj%>'/><%

		%></render:satellitepage><%

	%><%}else if(contactUsForm || contactUspage){%><%

		%><render:satellitepage pagename="PopulateHTMLHeader"><%

			%><render:argument name="includeContactCSS" value="yes"/><%

			%><render:argument name="TemplateName" value='<%=templateName%>'/><%

			%><render:argument name="domain" value='<%=request.getServerName()%>'/><%

			%><render:argument name="assetId" value='<%=assetIdObj%>'/><%

			%><render:argument name="assetType" value='<%=assetTypeObj%>'/><%

		%></render:satellitepage><%

	%><%}else{%><%

		%><render:callelement elementname="PopulateHTMLHeader"><%

			%><render:argument name="assetId" value='<%=assetIdObj%>'/><%

			%><render:argument name="TemplateName" value='<%=templateName%>'/><%

			%><render:argument name="assetType" value='<%=assetTypeObj%>'/><%

			%><render:argument name="domain" value='<%=request.getServerName()%>'/><%

		%></render:callelement><%

		%><%}if(templateName.startsWith("FixedWidth")||templateName.startsWith("Promotions/FixedWidth")){%>

			<style>

			.promotionContainer,#gsapromopage{

			margin-right: auto;

			margin-left: auto;

			padding-left: 15px;

			padding-right: 15px;

			width: 920px;

			}

			</style>

			<%}if(StringUtils.isNotBlank(metaKeyword)){%>

			<META name="keywords" content="<%=metaKeyword%>">

		<%}if(StringUtils.isNotBlank(metaDescription)){%>

			<META name="description" content="<%=metaDescription%>">

		<%}if(StringUtils.isNotBlank(browserTitle)){%>

			<title><%=browserTitle.replaceAll("\\<.*?>","")%> | <%=agilentText%></title>

		<%}else if(ics.GetVar("subType").equalsIgnoreCase("SkimSubGroup") && StringUtils.isNotBlank(subGrpTitle)){%>

			<title><%=subGrpTitle.replaceAll("\\<.*?>","")%> | <%=agilentText%></title>

		<%}else if(ics.GetVar("subType").equalsIgnoreCase("SkimGroup") && enableNewPCPLayout){%>

			<title><%=subGrpTitle.replaceAll("\\<.*?>","")%> | <%=agilentText%></title>

		<%}else if(StringUtils.isBlank(browserTitle)){

			if(StringUtils.isNotBlank(pageTitle)){%>

				<title><%=pageTitle.replaceAll("\\<.*?>","")%> | <%=agilentText%></title>

		<%}}%>

		<%if(Utilities.goodString(reqServer) && Utilities.goodString(chinaDomain) && reqServer.indexOf(chinaDomain) !=-1){	%>

			<meta name="google-site-verification" content="<%=googleCNId%>" /> 

		<%}else{%>

			<meta name="google-site-verification" content="<%=googleENId%>" /> 		

		<%}%><%

	/*	if(null!=localeString && localeString.equalsIgnoreCase("zh_CN")){

			%><meta http-equiv="Content-Language" content="zh-CN" />

			<meta property="og:locale" content="zh_CN" /><%

		}

*/

		// code added for APP-10070 & APP-10071

		 if(assetTypeObj.equalsIgnoreCase("GSA_C") ){	

		    if(seoNoFollow.equalsIgnoreCase("Yes") && seoNoIndex.equalsIgnoreCase("No")){

				%><meta name="ROBOTS" content="NOFOLLOW"><%

			}else if(seoNoFollow.equalsIgnoreCase("No") && seoNoIndex.equalsIgnoreCase("Yes")){

				%><meta name="ROBOTS" content="NOINDEX"><%

			}else if(seoNoFollow.equalsIgnoreCase("Yes") && seoNoIndex.equalsIgnoreCase("Yes")){

				%><meta name="ROBOTS" content="NOINDEX, NOFOLLOW"><%

			}

		 }

		  if(null!=localeString && localeString.equalsIgnoreCase("zh_CN")){

			String scriptIncludeInfo = ics.GetProperty("cs.chinese.script", "Environment.ini", true);

			if(Utilities.goodString(scriptIncludeInfo)){

				%><%=scriptIncludeInfo%><%

			}

		}

		 

		if(StringUtils.isBlank(seoCanonicalUrl) && StringUtils.isNotBlank(vanityURL)){

			seoCanonicalUrl = vanityURL;

			seoCanonicalUrl = seoURLDomain+seoCanonicalUrl;

		}else if((StringUtils.isBlank(seoCanonicalUrl)) && (isseeallpage)){

			%><ics:callelement element="GenerateTemplateURL"><%

					%><ics:argument name="assetId" value='<%=ics.GetVar("cid")%>'/><%

					%><ics:argument name="assetType" value='<%=ics.GetVar("c")%>'/><%

					%><ics:argument name="tName" value="/LayoutTemplate"/><%

					%><ics:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/><%

				%></ics:callelement><%

			String oLinkUrl = ics.GetVar("oLink");

			if(oLinkUrl.contains("cs/agilent/")) {

				oLinkUrl=oLinkUrl.replace("cs/agilent/","");

			}

			if(oLinkUrl.contains("//")) {

				oLinkUrl=oLinkUrl.replace("//","/");

			}

			if(!StringUtils.isBlank(seoURLDomain)){

				seoURLDomain = seoURLDomain.substring(0,seoURLDomain.length()-1);

			}

			seoCanonicalUrl = seoURLDomain+oLinkUrl;

		}

		if(StringUtils.isNotBlank(seoCanonicalUrl)){

        	%><link rel="canonical" href='<%=seoCanonicalUrl%>'><%}

		// End of code added for APP-10070 & APP-10071

		%>

		<%if(StringUtils.isNotBlank(eloquaScriptUrl)){%>

			<script language="javascript" type="text/plain" class="optanon-category-C0003"  src="<%=eloquaScriptUrl%>"></script>

		<%}%>

		<% if(isCobalt){%>

			<script type="text/javascript" src="https://secure.leadforensics.com/js/23908.js"></script> 

			<noscript><img src="https://secure.leadforensics.com/23908.png" style="display:none;" /></noscript> 

		<%}%><%

		%><ics:callelement element="Agilent/Utilities/GetRedirectURL"><%

			%><ics:argument name="HomeCountryCode" value='<%=HomeCountryCode%>'/><%

		%></ics:callelement><%

		

		%><script>

			<%if(Utilities.goodString(ics.GetVar("contactRedirectPageURL"))){%>

				window.contactRedirectPageURL='<%=ics.GetVar("contactRedirectPageURL")%>';	

				countryCodeTest='<%=HomeCountryCode%>';

			<%}

			if(StringUtils.isNotBlank(boundedSearchKeyword)){%>

			     window.boundedSearchKeyword='<%=boundedSearchKeyword%>';

			<%}

			if(StringUtils.isNotBlank(boundedSearchKeyword2)){%>

			     window.boundedSearchKeyword2='<%=boundedSearchKeyword2%>';

			<%}

			if(StringUtils.isNotBlank(boundedSearchTabName)){%>	

			  window.boundedSearchTabName='<%=boundedSearchTabName%>';

			<% } %>



		</script>



	<script> var seoImageData ="";var seoDesc ="";

	</script>

	</head>

	<%

	//code modified for APP-4088

	if((ics.GetVar("subType").equalsIgnoreCase("video")  || templateName.equalsIgnoreCase("/GenericTemplateWithFourZonesNoIframe") || templateName.startsWith("Promotions/FixedWidth")) && !(templateName.equalsIgnoreCase("/TechnologyPageTemplate")) && !(templateName.equalsIgnoreCase("/PromoCollectionPageTemplate")) ){

	//end of code modified for APP-4088

	    templates = templateName;

		if(StringUtils.isNotBlank(isRegulatory) && isRegulatory.equalsIgnoreCase("Yes")){%>

			<body class="promotionBody notranslate">

		<%}else{%>

			<body class="promotionBody">

	<%} 

	//DCWCS-996

	}else if(ics.GetVar("subType").equalsIgnoreCase("category") || ics.GetVar("subType").equalsIgnoreCase("SolutionCategory") || ics.GetVar("subType").equalsIgnoreCase("SolutionSegment") || ics.GetVar("subType").equalsIgnoreCase("SolutionSubSegment") || ics.GetVar("subType").equalsIgnoreCase("SkimCategory") || ics.GetVar("subType").equalsIgnoreCase("BoundedSearch") || enableNewPCPLayout){

		if(StringUtils.isNotBlank(isRegulatory) && isRegulatory.equalsIgnoreCase("Yes")){%>

			<body class="carousel notranslate">

			<%}else if(templateName.equalsIgnoreCase("/SeeAllServices")){%>			

				<body class="carousel see-all-listed-label">

			<%}else{%>

			<body class="carousel">

		<%}

	}else if(ics.GetVar("subType").equalsIgnoreCase("Downloads")){%>

		<body class="cd-body">

	<%}else if(templateName.equalsIgnoreCase("/ACQLandingPageTemplate") || templateName.equalsIgnoreCase("/ACQFalloutPageTemplate")){%>

		<body class="no-carousel-acq">

	<%}else if(ics.GetVar("subType").equalsIgnoreCase("SupportLandingPage")){%>

		<body class="carousel">

	<%}else if(templateName.equalsIgnoreCase("/CalculatorTemplate")){%>

		<body class="no-carousel-pay-plan">

	<%}else if(templateName.equalsIgnoreCase("/SoftwareDownloadTemplate")){

		%><body class="grey-background request-instruments"><%

	}else if(templateName.equalsIgnoreCase("/RTCASoftwareDownloadTemplate")  ){

		%><body class="grey-background request-instruments"><%

	}

	//DCWCS-996

	else{

		if(StringUtils.isNotBlank(isRegulatory) && isRegulatory.equalsIgnoreCase("Yes")){%>

			<body class="notranslate">

		<%}else if(contactUsForm || contactusSubmit){%>

			<body class="contact_us_body">

		<%}else{%>

			<body>

		<%}

		

	}%>

<%if(Utilities.goodString(gtmIFrameScript)){%>

<%=gtmIFrameScript%>

<%}else{%>

<noscript>

	<iframe src='<%=googleTMURL+"/ns.html?id=GTM-NC3LF7"%>' height="0" width="0" style="display:none;visibility:hidden"></iframe>

</noscript>

<%}%>

	

			<%if(!noHeaderFooter){%>

				<div class="loading"></div>

				<%if(StringUtils.isNotBlank(isRegulatory) && ( templateName.equalsIgnoreCase("/ACQLandingPageTemplate") || templateName.equalsIgnoreCase("/ACQFalloutPageTemplate"))){ %>

					<div class="loader-overlay" style="display: none;">

						<div id="processing-loader">

								<img src="/cs/agilent_images/loader2.gif" alt="loader">

								<div id="loader-msg">

									<span><%=acqLandingMap.get("ACQLoadingMessage1")%></span>

									<p><%=acqLandingMap.get("ACQLoadingMessage2")%></p>

								</div>

						</div>

							

					</div>

					<div class="spinner-overlay" style="display: none;">

						<div id="spinning-loader">

							<img src="/cs/agilent_images/loader2.gif" alt="loader">

						</div>

					</div> 

				<%} %>

<%

				if(StringUtils.isNotBlank(subTypeTempName)){

					templates = subTypeTempName;

				}else if(StringUtils.isNotBlank(templateName)){

					templates = templateName;

				}else if (isseeallpage) {

						templates="/SeeAllProducts";

				} else if (isSupportLandingPage) {

					templates="/SupportLandingPageTemplate";

				} else if (isprodcomparisonpage) {									

					if(StringUtils.isNotBlank(ics.GetVar("partlist"))){

						templates="/PartComparisonTemplate";

					}else{

						templates="/ProductComparisonTemplate";

					}			

				} else if (isseeallservicepage) {

					templates="/SeeAllServices";

				} else if (ispersonalizedpage) {

					templates="/PersonalizedDownloads"; 

				} else if (isACQFallOutPage) {

					templates="/ACQFalloutPageTemplate";

				} else if (isCalculatorpage) {

					templates ="/CalculatorTemplate";

				}else if ((contactUsForm || contactUspage || contactusSubmit) && StringUtils.isNotBlank(pageUrlElement)) {

					templates ="pageUrlElement";

				}else{

					templates="/GenericTemplateWithFourZones";	

				}

				%>



				<header class="affix-top" data-template-name='<%=templates%>'>  <a href="#content" class="sr-only">Skip to main content</a>

				<%				

				if(ajaxLoad){

					%> 

					<render:callelement elementname="Agilent/Utilities/AJAXHeaderSection">

						<render:argument name="locale" value='<%=localeString%>'/>

						<render:argument name="CountryCode" value='<%=HomeCountryCode%>'/>	

					</render:callelement>

					<%

				}else{

					if(StringUtils.isNotBlank(ics.GetVar("rendermode")) && (ics.GetVar("rendermode").equalsIgnoreCase("preview"))){

						String previewHeaderServiceURL=ics.GetProperty("cs.previewHeaderServiceURL", "WebPagesSectionList.ini", true);

						%><script src='<%=previewHeaderServiceURL%>' type="text/javascript"></script><%

					}else{

						String headerServiceURL=ics.GetProperty("cs.headerServiceURL", "WebPagesSectionList.ini", true);

						%><script src='<%=headerServiceURL%>' type="text/javascript"></script><%

					}

				}

			}%>

			<script>

				window.currentDate = '<%=currentDateLoc%>';

			</script>

			<script>

				<%if(enableNewPDPLayout){%>

					window.isChemStdPage = '<%=String.valueOf(enableNewPDPLayout)%>';

				<%}else if(enableNewPCPLayout){%>

					window.isChemStdPage = '<%=String.valueOf(enableNewPCPLayout)%>';

				<%}else{%>

					window.isChemStdPage = 'false';

				<%}%>

			</script>

			<%if(StringUtils.isNotBlank(isRegulatory)){%>

				<script>

					isRegulatory = '<%=isRegulatory%>';

				</script>

			<%}else{%>

				<script>

					isRegulatory = 'No';

				</script><%

			}if(StringUtils.isNotBlank(ics.GetVar("section"))){%>

				<script>

					dispSec='<%=ics.GetVar("section")%>';

				</script>

			<%}					

			log.debug("subTypeTempName:"+subTypeTempName);

			if(StringUtils.isNotBlank(subTypeTempName)){

				log.debug("RegulatoryFlag------------------"+regulatoryFlag+"subGroup: "+ics.GetVar("subGroup")+"subSegment: "+ics.GetVar("subSegment"));

				if(ics.GetVar("subGroup")!=null || ics.GetVar("subSegment")!=null){

					%><render:calltemplate tname='<%=subTypeTemp%>' c='<%=ics.GetVar("c")%>' cid='<%=ics.GetVar("cid")%>'><%

						if(ics.GetVar("subGroup")!=null){

							%><render:argument name="subGroup" value='<%=ics.GetVar("subGroup")%>' /><%

							if(StringUtils.isNotBlank(strHTMLContent)){

								%><render:argument name="stepId" value='<%=stepId%>'/><%

								%><render:argument name="stepData" value='<%=strHTMLContent%>'/><%

							}

						}else if(ics.GetVar("subSegment")!=null){

							%><render:argument name="subSegment" value='<%=ics.GetVar("subSegment")%>' /><%

						}

						%><render:argument name="countryCode" value='<%=HomeCountryCode%>'/><%

						%><render:argument name="locale" value='<%=localeString%>'/><%

						%><render:argument name="fromTemplate" value="true"/><%

						%><render:argument name="sessionId" value='<%= jSessionId %>'/><%

						%><render:argument name="botServer" value='<%=botServer%>'/><%

						%><render:argument name="assetDimension" value='<%=assetDimension%>'/><%

						%><render:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/><%

						%><render:argument name="subType" value='<%=ics.GetVar("subType")%>'/><%

					%></render:calltemplate><%

				}else{

					//log.debug("ELSE---START - Caching Opimization Changes - Using packargs if the template is ProductPageTemplate, else, go with regular existing flow");

					//START - Caching Opimization Changes - Using packargs if the template is ProductPageTemplate, else, go with regular existing flow

					//log.debug("Calling template: "+subTypeTemp+" for asset "+ics.GetVar("c")+":"+ics.GetVar("cid"));

					

					if(null != subTypeTemp && Utilities.goodString(subTypeTemp) 

							&& (subTypeTemp.contains("ProductPageTemplate"))

								|| subTypeTemp.contains("SolutionApplicationPageTemplate")

								|| subTypeTemp.contains("ProductGroupPageTemplate")){

						//START - Caching Opimization Changes - Using packargs

						%><render:packargs outstr = "packedargs"><%

							if(null != localeForLiteratureSort && Utilities.goodString(localeForLiteratureSort)){

								%><render:argument name="localeForLiteratureSort" value="<%= localeForLiteratureSort %>"/><%

							}

							if(null != HomeCountryCode && Utilities.goodString(HomeCountryCode)){

								%><render:argument name="countryCode" value='<%= HomeCountryCode %>'/><%

							}

							if(null != regulatoryFlag && Utilities.goodString(regulatoryFlag)){

								%><render:argument name="RegulatoryFlag" value='<%=regulatoryFlag%>'/><%

							}

							if(null != subTypeTemp && Utilities.goodString(subTypeTemp) 

									&& (subTypeTemp.contains("ProductPageTemplate"))){

										%><render:argument name="stepPreview" value='<%=String.valueOf(isStepPreview)%>'/><%

									}

							%><render:argument name="fromTemplate" value="true"/><%

							if(null != jSessionId && Utilities.goodString(jSessionId)){

								%><render:argument name="sessionId" value='<%=jSessionId%>'/><%

							}

							

							if(null != assetDimension && Utilities.goodString(assetDimension)){

								%><render:argument name="assetDimension" value='<%= assetDimension %>'/><%

							}

							if(null != currentUrlLocale && Utilities.goodString(currentUrlLocale)){

								%><render:argument name="currentUrlLocale" value='<%= currentUrlLocale %>'/><%

							}

							if(null != ics.GetVar("subType") && Utilities.goodString(ics.GetVar("subType"))){

								%><render:argument name="subType" value='<%= ics.GetVar("subType") %>'/><%

								if(ics.GetVar("subType").equalsIgnoreCase("SkimSubGroup")

									&& null != subGrpTitle && Utilities.goodString(subGrpTitle)){

									%><render:argument name="subGrpTitle" value='<%= subGrpTitle %>'/><%

								}

							}

							if(null != strHTMLContent && StringUtils.isNotBlank(strHTMLContent)){

								%><render:argument name="stepData" value='<%= strHTMLContent %>'/><%

								if(null != stepId && StringUtils.isNotBlank(stepId)){

									%><render:argument name="stepId" value='<%= stepId %>'/><%

								}

							}							

						%></render:packargs><%

						

						%><render:calltemplate tname='<%= subTypeTemp %>' c='<%=ics.GetVar("c")%>' cid='<%=ics.GetVar("cid")%>'><%

							%><render:argument name="locale" value='<%= localeString %>'/><%

							%><render:argument name="packedargs" value='<%= ics.GetVar("packedargs") %>'/><%							

						%></render:calltemplate><%

					}

					else{

						%><render:calltemplate tname='<%= subTypeTemp %>' c='<%=ics.GetVar("c")%>' cid='<%=ics.GetVar("cid")%>'><%

							%><render:argument name="locale" value='<%=localeString%>'/><%

							%><render:argument name="localeForLiteratureSort" value="<%=localeForLiteratureSort%>"/><%

							%><render:argument name="countryCode" value='<%=HomeCountryCode%>'/><%

							%><render:argument name="RegulatoryFlag" value='<%=regulatoryFlag%>'/><%

							%><render:argument name="fromTemplate" value="true"/><%

							%><render:argument name="sessionId" value='<%=jSessionId%>'/><%

							%><render:argument name="botServer" value='<%=botServer%>'/><%

							%><render:argument name="assetDimension" value='<%=assetDimension%>'/><%

							%><render:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/><%

							%><render:argument name="subType" value='<%=ics.GetVar("subType")%>'/><%

							if(StringUtils.isNotBlank(strHTMLContent) && StringUtils.isNotBlank(stepId) ){

								%><render:argument name="stepData" value='<%=strHTMLContent%>'/><%

								%><render:argument name="stepId" value='<%=stepId%>'/><%

							}

							if(enableNewPCPLayout){

								%><render:argument name="infoArgs" value='<%=ics.GetVar("infoArgs")%>' /><%

							}

							if(ics.GetVar("subType").equalsIgnoreCase("SkimSubGroup")){

								%><render:argument name="subGrpTitle" value='<%=subGrpTitle%>'/><%

							}

						%></render:calltemplate><%

					}

					//END - Caching Opimization Changes - Using packargs if the template is ProductPageTemplate

				}

			}else{

				log.debug("Template name NOIFRAME ...11..........."+contactUspage+"---"+pageUrlElement);



				if(StringUtils.isNotBlank(templateName)){

					%>

					<render:calltemplate tname='<%=templateName%>' c='<%=ics.GetVar("c")%>' cid='<%=ics.GetVar("cid")%>'>

						<render:argument name="locale" value='<%=localeString%>'/>

						<render:argument name="countryCode" value='<%=HomeCountryCode%>'/>

						<render:argument name="fromTemplate" value="true"/>

						<render:argument name="sessionId" value='<%=jSessionId%>'/>

						<render:argument name="botServer" value='<%=botServer%>'/>

						<render:argument name="assetDimension" value='<%=assetDimension%>'/>

						<render:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/><%

						if(isACQFallOutPage || isACQLandingPage){

							  %><render:argument name="userInfo" value="true"/>

							   <%if(StringUtils.isNotBlank(ics.GetVar("responseMap"))){%>

							  <render:argument name="responseMap" value='<%=ics.GetVar("responseMap")%>'/>								  

							   <%}%>

							  <render:argument name="webquoteid" value='<%=ics.GetVar("webquoteid")%>'/><%

							  if(null!=ics.GetVar("quoteStatus")){

								%><render:argument name="quoteStatus" value='<%=ics.GetVar("quoteStatus")%>'/><%

							  }

							  if(null!=ics.GetVar("getRecipeJson")){

								%><render:argument name="getRecipeJson" value='<%=ics.GetVar("getRecipeJson")%>'/><%

							  }

							  if(null!=ics.GetVar("getPartRecipe")){

								%><render:argument name="getPartRecipe" value='<%=ics.GetVar("getPartRecipe")%>'/><%

							  }

						}

					%></render:calltemplate><%



				 }else if (isseeallpage) {%>

					<render:calltemplate tname='/SeeAllProducts' c='<%=ics.GetVar("c")%>' cid='<%=ics.GetVar("cid")%>'>

						<render:argument name="locale" value='<%=localeString%>'/>

						<render:argument name="countryCode" value='<%=HomeCountryCode%>'/>

						<render:argument name="fromTemplate" value="true"/>

						<render:argument name="botServer" value='<%=botServer%>'/>

						<render:argument name="assetDimension" value='<%=assetDimension%>'/>

						<render:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/>

					</render:calltemplate>

				<%} else if (isSupportLandingPage) {%>

					<render:calltemplate tname='/SupportLandingPageTemplate' c='<%=ics.GetVar("c")%>' cid='<%=ics.GetVar("cid")%>'>

						<render:argument name="locale" value='<%=localeString%>'/>

						<render:argument name="countryCode" value='<%=HomeCountryCode%>'/>

						<render:argument name="fromTemplate" value="true"/>

						<render:argument name="botServer" value='<%=botServer%>'/>

						<render:argument name="assetDimension" value='<%=assetDimension%>'/>

						<render:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/>

					</render:calltemplate>

				<%} else if (isprodcomparisonpage) {									

					if(StringUtils.isNotBlank(ics.GetVar("partlist"))){%>	

					<script>parentPageTitle ='<%=ics.GetVar("title")%>';</script>											

						<render:calltemplate tname='/PartComparisonTemplate' c='<%=ics.GetVar("c")%>' cid='<%=ics.GetVar("cid")%>'>

							<render:argument name="locale" value='<%=localeString%>'/>

							<render:argument name="countryCode" value='<%=HomeCountryCode%>'/>

							<render:argument name="fromTemplate" value="true"/>

							<render:argument name="botServer" value='<%=botServer%>'/>

							<render:argument name="assetDimension" value='<%=assetDimension%>'/>

							<render:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/>

							<render:argument name="productlist" value='<%=ics.GetVar("productlist")%>'/>

							<render:argument name="partlist" value='<%=ics.GetVar("partlist")%>'/>

							<render:argument name="title" value='<%=ics.GetVar("title")%>'/>	

							<render:argument name="parentPageUrl" value='<%=cookieCurrPageURL%>'/>

							<render:argument name="acq" value='<%=ics.GetVar("acq")%>'/><%	

                            if(StringUtils.isNotBlank(ics.GetVar("webquoteid"))){

								%><render:argument name="webquoteid" value='<%=ics.GetVar("webquoteid")%>'/><%

							}							

						%></render:calltemplate><%

					}else{%>

						<render:calltemplate tname='/ProductComparisonTemplate' c='<%=ics.GetVar("c")%>' cid='<%=ics.GetVar("cid")%>'>

							<render:argument name="locale" value='<%=localeString%>'/>

							<render:argument name="countryCode" value='<%=HomeCountryCode%>'/>

							<render:argument name="fromTemplate" value="true"/>

							<render:argument name="botServer" value='<%=botServer%>'/>

							<render:argument name="assetDimension" value='<%=assetDimension%>'/>

							<render:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/>

							<render:argument name="productlist" value='<%=ics.GetVar("productlist")%>'/>

							<render:argument name="partlist" value='<%=ics.GetVar("partlist")%>'/>

							<render:argument name="title" value='<%=ics.GetVar("title")%>'/>					

						</render:calltemplate><%

					}			

				} else if (isseeallservicepage) {%>

					<render:calltemplate tname='/SeeAllServices' c='<%=ics.GetVar("c")%>' cid='<%=ics.GetVar("cid")%>'>

						<render:argument name="locale" value='<%=localeString%>'/>

						<render:argument name="countryCode" value='<%=HomeCountryCode%>'/>

						<render:argument name="fromTemplate" value="true"/>

						<render:argument name="botServer" value='<%=botServer%>'/>

						<render:argument name="assetDimension" value='<%=assetDimension%>'/>

						<render:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/>

					</render:calltemplate>

				<%}else if (ispersonalizedpage) {%>

					<render:calltemplate tname='/PersonalizedDownloads' c='<%=ics.GetVar("c")%>' cid='<%=ics.GetVar("cid")%>'>

						<render:argument name="locale" value='<%=localeString%>'/>

						<render:argument name="countryCode" value='<%=HomeCountryCode%>'/>

						<render:argument name="fromTemplate" value="true"/>

						<render:argument name="botServer" value='<%=botServer%>'/>

						<render:argument name="assetDimension" value='<%=assetDimension%>'/>

						<render:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/>

					</render:calltemplate>

				<%} else if (isACQFallOutPage) {%>

					<render:calltemplate tname='/ACQFalloutPageTemplate' c='<%=ics.GetVar("c")%>' cid='<%=ics.GetVar("cid")%>'>

						<render:argument name="locale" value='<%=localeString%>'/>

						<render:argument name="countryCode" value='<%=HomeCountryCode%>'/>

						<render:argument name="fromTemplate" value="true"/>

						<render:argument name="botServer" value='<%=botServer%>'/>

						<render:argument name="assetDimension" value='<%=assetDimension%>'/>

						<render:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/>

					</render:calltemplate>

				<%} else if (isCalculatorpage) {%>

					<render:calltemplate tname='/CalculatorTemplate' c='<%=ics.GetVar("c")%>' cid='<%=ics.GetVar("cid")%>'>

						<render:argument name="locale" value='<%=localeString%>'/>

						<render:argument name="countryCode" value='<%=HomeCountryCode%>'/>

						<render:argument name="fromTemplate" value="true"/>

						<render:argument name="botServer" value='<%=botServer%>'/>

						<render:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/>

						<render:argument name="assetDimension" value='<%=assetDimension%>'/>

					</render:calltemplate>

				<%}	else if ((contactUsForm || contactUspage || contactusSubmit) && StringUtils.isNotBlank(pageUrlElement)) {

					%>

					<render:callelement elementname='<%=pageUrlElement%>'>

						<render:argument name="locale" value='<%=localeString%>'/>

						<%if(Utilities.goodString(ics.GetVar("m"))) %>

							<render:argument name="m" value='<%=ics.GetVar("m")%>'/>

						<%if(Utilities.goodString(ics.GetVar("firstname"))) %>

							<render:argument name="firstname" value='<%=ics.GetVar("firstname")%>'/>

						<%if(Utilities.goodString(ics.GetVar("lastname"))) %>

							<render:argument name="lastname" value='<%=ics.GetVar("lastname")%>'/>	

						<%if(Utilities.goodString(ics.GetVar("emailId"))) %>

							<render:argument name="emailId" value='<%=ics.GetVar("emailId")%>'/>

						<%if(Utilities.goodString(ics.GetVar("ack"))) %>

							<render:argument name="ack" value='<%=ics.GetVar("ack")%>'/>

						<%if(Utilities.goodString(ics.GetVar("reqId"))) %>

							<render:argument name="reqId" value='<%=ics.GetVar("reqId")%>'/>

					</render:callelement>

				<%}else{%>

					<render:calltemplate tname='/GenericTemplateWithFourZones' c='<%=ics.GetVar("c")%>' cid='<%=ics.GetVar("cid")%>'>

						<render:argument name="locale" value='<%=localeString%>'/>

						<render:argument name="countryCode" value='<%=HomeCountryCode%>'/>

						<render:argument name="fromTemplate" value="true"/>

						<render:argument name="sessionId" value='<%=jSessionId%>'/>

						<render:argument name="botServer" value='<%=botServer%>'/>

						<render:argument name="assetDimension" value='<%=assetDimension%>'/>

						<render:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/>

					</render:calltemplate>

				<%}

			}%>

			<%

if("Products_C".equalsIgnoreCase(assetTypeObj) || 

		"Products_P".equalsIgnoreCase(assetTypeObj)){

	String uId = ics.GetVar("cid");

	if(Utilities.goodString(actualStepId)){

		uId=actualStepId+"_"+assetDimension;

	}

	%>

	<render:callelement elementname="Agilent/Utilities/GetSEOJSON" scoped="global">

		<render:argument name="calledTemplate" value="Agilent/LayoutTemplate" />	

		<render:argument name="pTitle" value="<%=prodTitleVal%>" />

		<render:argument name="uIdentifier" value="<%=uId%>" />	

		<render:argument name="aType" value="<%=assetTypeObj%>" />	

		<render:argument name="prodURL" value='<%=cookieCurrPageURL%>' />

		<render:argument name="seoImgData" value='<%=ics.GetVar("seoImageData")%>' />

	</render:callelement>

<%} %>

		<%

				if(enableChat && !noHeaderFooter && !templateName.equalsIgnoreCase("Promotions/FixedWidthWithHeaderFooter") 

					&& !templateName.equalsIgnoreCase("Promotions/HeaderFooterNoBreadcrumbNoWidth")

				&& !templateName.equalsIgnoreCase("Promotions/HeaderFooterNoWidth")

				&& !templateName.equalsIgnoreCase("Promotions/HeaderFooterWithNoFixedWidth")

				&& !templateName.equalsIgnoreCase("/GenericTemplateWithFourZonesNoIframe") && Utilities.goodString(webChat) && webChat.equalsIgnoreCase("Agilent Global Chat") ){

			%><render:callelement elementname="IncludeWebChat"><%

			%><render:argument name="webChat" value='<%=webChat%>'/><%

				%><render:argument name="countryCode" value ='<%=HomeCountryCode%>'/><%		

			%></render:callelement><%

		}%><%

		if(!noHeaderFooter && !isACQFallOutPage){			

	if(ajaxLoad){

	%>

	<render:callelement elementname="FooterLayoutSection">

		<render:argument name="locale" value='<%=localeString%>'/>

		<render:argument name="subType" value='<%=ics.GetVar("subType")%>'/>

		<render:argument name="webChat" value='<%=webChat%>'/>

		<render:argument name="enableNewPCP" value='<%=String.valueOf(enableNewPCPLayout)%>'/>

		<render:argument name="enableNewPDP" value='<%=String.valueOf(enableNewPDPLayout)%>'/>

		<%if("ACQLandingPage".equalsIgnoreCase(assetName)){%>

			<render:argument name="includeJSType" value="ACQLandingPage"/><%

		}if("Novoexpress Software Download".equalsIgnoreCase(assetName) || "RTCA Software Download".equalsIgnoreCase(assetName)){%>

			<render:argument name="angularInclude" value="demo"/><%

		}

		if(StringUtils.isNotBlank(ics.GetVar("acq"))){%>

			<render:argument name="acq" value='<%=ics.GetVar("acq")%>'/>

		<%}

		if(StringUtils.isNotBlank(subTypeTemp) && subTypeTemp.equalsIgnoreCase("/CategoryTemplate")){%>

			<render:argument name="includeJSType" value="CategoryTemplate"/>

		<%}%>

	</render:callelement>

	<%

}else{	

	if(StringUtils.isNotBlank(ics.GetVar("rendermode")) && (ics.GetVar("rendermode").equalsIgnoreCase("preview"))){

	String previewFooterServiceURL=ics.GetProperty("cs.previewFooterServiceURL", "WebPagesSectionList.ini", true);

	%><script src='<%=previewFooterServiceURL%>' type="text/javascript"></script><%

	}else{

	String footerServiceURL=ics.GetProperty("cs.footerServiceURL", "WebPagesSectionList.ini", true);

	%><script src='<%=footerServiceURL%>' type="text/javascript"></script><%

	}	

%><render:satellitepage pagename="FooterIncludeJS">

					<render:argument name="locale" value='<%=localeString%>'/>

					<render:argument name="subType" value='<%=ics.GetVar("subType")%>'/>

					<render:argument name="webChat" value='<%=webChat%>'/>

					<render:argument name="enableNewPCP" value='<%=String.valueOf(enableNewPCPLayout)%>'/>

					<render:argument name="enableNewPDP" value='<%=String.valueOf(enableNewPDPLayout)%>'/>

					<%if("ACQLandingPage".equalsIgnoreCase(assetName)){%>

						<render:argument name="includeJSType" value="ACQLandingPage"/><%

					}if("Novoexpress Software Download".equalsIgnoreCase(assetName) || "RTCA Software Download".equalsIgnoreCase(assetName)){%>

						<render:argument name="angularInclude" value="demo"/><%

					}

					if(StringUtils.isNotBlank(ics.GetVar("acq"))){%>

						<render:argument name="acq" value='<%=ics.GetVar("acq")%>'/>

					<%}

					if(StringUtils.isNotBlank(subTypeTemp) && subTypeTemp.equalsIgnoreCase("/CategoryTemplate")){%>

					    <render:argument name="includeJSType" value="CategoryTemplate"/>

					<%}%>

					

				</render:satellitepage>

		<%}}%>

		<%-- must be called after Analytics IDs are set --%>

		<%%><render:callelement elementname="Agilent/ACS/Survey/DoProcess">

			<render:argument name="cid" value='<%= assetIdObj %>' />

			<render:argument name="c" value='<%= assetTypeObj %>' />

		</render:callelement><%%>

	<%if(contactUspage){%>

		<script>

			$(document).ready(function() {

				$('#countryselect').change(function(event) {

						var selVal=event.target.value;

						var token =selVal.split("|");

						var assetType='GSA_C';

						var redirectURL=$("input#redirecturl").val();

						//alert(redirectURL);

						//window.location.href = redirectURL+'&cid='+selVal+'&c='+assetType;

						window.location.href = "/cs/agilent/"+token[1];



				});

			});

		</script>

		<script>

				$(window).load(function() {

					<!--doIframe();-->

				$('.loading').fadeOut();

			//        var frame = document.getElementById('your-frame-id');

			//

			//        frame.contentWindow.postMessage('#myIFrame', '*');

			  });

		</script>

	<%}

	if(enablePardot.equalsIgnoreCase("yes")){%>

		<!--Start of Pardot Script-->

		<%if(assetTypeObj.equalsIgnoreCase("MultimediaST_C")){

			pardotCampId=pardotVideoCampId;

		}%>

		<script type="text/javascript">// <![CDATA[

			piAId = '<%=pardotAId%>';

			piCId = '<%=pardotCampId%>';

			(function() {

			function async_load(){

				var s = document.createElement('script'); s.type = 'text/javascript';

				s.src = ('https:' == document.location.protocol ? 'https://pi' : 'http://cdn') + '.pardot.com/pd.js';

				var c = document.getElementsByTagName('script')[0]; c.parentNode.insertBefore(s, c);

			}

			if(window.attachEvent) { window.attachEvent('onload', async_load); }

			else { window.addEventListener('load', async_load, false); }

			})();

		// ]]></script>

		<!--script language="javascript" type="text/javascript" src="/cs/agilent_scripts/pardotscript.js"></script--> 

		<!--End of Pardot Script-->

	<%}%>

		<!--Start of Acton Script-->

		<script language="javascript" type="text/javascript" src="/cs/agilent_scripts/acton.js<%=verValue%>"></script>

		<!--End of Acton Script-->

	</body><%%>

<render:callelement elementname="Agilent/Utilities/CountryPopUp"></render:callelement><%%>

<%

}

}//end of start date and end date



else{

	String pageUrl="";

	String pagename404="Agilent404";

	if(PageUnavailableFlag){

		pagename404="PageUnavailable";

		response.sendError(451, "Page Unavailable" );

	}else{

		response.setStatus(HttpServletResponse.SC_NOT_FOUND);

		response.sendError(404);

	}

	

	if(StringUtils.isNotBlank(ics.GetVar("c"))){

	%>	

	<%%><ics:callelement element="GenerateTemplateURL">

		<ics:argument name="assetId" value='<%=ics.GetVar("cid")%>'/>

		<ics:argument name="assetType" value='<%=ics.GetVar("c")%>'/>

		<ics:argument name="tName" value="/LayoutTemplate"/>

		<ics:argument name="currentUrlLocale" value='<%=currentUrlLocale%>'/>

	</ics:callelement><%%>

	<%

	pageUrl=envHost+ics.GetVar("oLink");

	}

	// XSS vulnerabilities

	pageUrl = StringEscapeUtils.escapeHtml(pageUrl);

	pageUrl = pageUrl.replaceAll("'", "&quot;");

	log.debug("Current Page Url ---"+pageUrl);

	

	String envDetail=envHost+"/cs/agilent/en-us/"+pagename404+"?s="+pageUrl;

	if(csAgilentRequired.equalsIgnoreCase("true")){

		if(envDetail.contains("/cs/agilent")){

			envDetail=envDetail.replaceAll("/cs/agilent","");

		}

	}

	%>

	<script type="text/javascript">

		function ChangeUrl(title, url) {

			if (typeof (history.pushState) != "undefined") {

				var obj = { Title: title, Url: url };

				history.pushState(obj, obj.Title, obj.Url);

			}

		}

		

		ChangeUrl('<%=pagename404%>', '<%=envDetail%>');

	</script><%%>

		<render:satellitepage pagename="<%=pagename404%>">

			<render:argument name="localeString" value='<%=localeString%>'/>

			<render:argument name="assetType" value='<%=ics.GetVar("c")%>'/>

			<render:argument name="pageTitle" value='<%=ics.GetVar("masterPageTitle")%>'/>

		</render:satellitepage><%%>

	<%

}%>

</ics:then>

</ics:if>

<%

endTime=System.currentTimeMillis();

long totaltime=endTime-startTime;

log.debug("Time Taken to Load Page in MilliSec "+totaltime+" for the page with asset type "+assetTypeObj+" assetid "+assetIdObj);

%>

<!-- Time Taken to load the page ---- <%=totaltime%> ms , for the page with type <%=assetTypeObj%> and having assetid <%=assetIdObj%>-->



<!-- Template Selected in asset is --- <%=templateName%> locale loaded <%=localeString%> -->

<%}%>

</cs:ftcs>

Site Entries:
		
	
 	
SiteCatalog Pagename
	 	
Pagelet parameters
	    	
Cache Criteria
	    	
ACL
	    	
Cache Rules
	 
	
Agilent/LayoutTemplate
		
rendermode : live
site : Agilent
sitepfx : Agilent
		
assetDimension, c, cid, context, d, deviceid, p, rendermode, site, sitepfx, ft_ss
		
Any
		
falsefalse
	
	
		
Keywords:		
Referenced by: 		Show
Created:		Friday, January 30, 2015 10:43:23 AM IST by fwadmin
Modified:		Wednesday, September 22, 2021 8:50:13 PM IST by fwadmin
