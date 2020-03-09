<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0" xmlns:external="http://xsltfunctions.isam.ibm.com">

<!--
	This is a template stylesheet which should be used as a guide when
	using WebSEAL's HTTP Transformation engine. This sample is relevant to
	a request only.
-->

	<!-- Firstly, strip any space elements -->
	<xsl:strip-space elements="*" />

	<!--
		Perform a match on the root of the document. Output the required
		HTTPRequestChange elements and then process templates.
	-->
	<xsl:template match="/">
		<HTTPRequestChange>
			<xsl:apply-templates />

			<!--  Perform Object Name processing here. Output should be in the form
				<ObjectName>VALUE</ObjectName>
			if required. -->

			<!--  Set the ACL bits which are to be used in the
                              authorization decision.  Output should be in the 
                              form
				<AclBits>r</AclBits>
			if required. -->

		</HTTPRequestChange>
	</xsl:template>

	<!--
		Match on the Method. Any Method processing should happen within this
		template.
	-->
	<xsl:template match="//HTTPRequest/RequestLine/Method">
		<xsl:choose>
			<xsl:when test="true">
					<HTTPResponseChange action="replace">
					<Version>HTTP/1.1</Version>
					<StatusCode>200</StatusCode>
					<Reason>OK</Reason>
					<Header name="Content-Type" action="add">text%2Fxml</Header>
					<Header name="Content-Language" action="add">en-US</Header>
					<Body>%3Cs%3AEnvelope%20xmlns%3As%3D%22http%3A%2F%2Fwww.w3.org%2F2003%2F05%2Fsoap-envelope%22%20xmlns%3Aa%3D%22http%3A%2F%2Fwww.w3.org%2F2005%2F08%2Faddressing%22%3E%0A%20%20%3Cs%3AHeader%3E%0A%20%20%20%20%3Ca%3AAction%20s%3AmustUnderstand%3D%221%22%3Ehttp%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2004%2F09%2Ftransfer%2FGetResponse%3C%2Fa%3AAction%3E%0A%20%20%20%20%3Ca%3ARelatesTo%3E1386375951%3C%2Fa%3ARelatesTo%3E%0A%20%20%3C%2Fs%3AHeader%3E%0A%20%20%3Cs%3ABody%3E%0A%20%20%20%20%3CMetadata%20xmlns%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2004%2F09%2Fmex%22%20xmlns%3Axsi%3D%22http%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema-instance%22%20xmlns%3Axsd%3D%22http%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%22%20xmlns%3Awsx%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2004%2F09%2Fmex%22%3E%0A%20%20%20%20%20%20%3Cwsx%3AMetadataSection%20Dialect%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fwsdl%2F%22%20Identifier%3D%22http%3A%2F%2Fschemas.microsoft.com%2Fws%2F2008%2F06%2Fidentity%2Fsecuritytokenservice%22%20xmlns%3D%22%22%3E%0A%20%20%20%20%20%20%20%20%3Cwsdl%3Adefinitions%20name%3D%22SecurityTokenService%22%20targetNamespace%3D%22http%3A%2F%2Fschemas.microsoft.com%2Fws%2F2008%2F06%2Fidentity%2Fsecuritytokenservice%22%20xmlns%3Awsdl%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fwsdl%2F%22%20xmlns%3At%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F02%2Ftrust%22%20xmlns%3Asoapenc%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fsoap%2Fencoding%2F%22%20xmlns%3Asoap%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fwsdl%2Fsoap%2F%22%20xmlns%3Atns%3D%22http%3A%2F%2Fschemas.microsoft.com%2Fws%2F2008%2F06%2Fidentity%2Fsecuritytokenservice%22%20xmlns%3Amsc%3D%22http%3A%2F%2Fschemas.microsoft.com%2Fws%2F2005%2F12%2Fwsdl%2Fcontract%22%20xmlns%3Awsam%3D%22http%3A%2F%2Fwww.w3.org%2F2007%2F05%2Faddressing%2Fmetadata%22%20xmlns%3Asoap12%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fwsdl%2Fsoap12%2F%22%20xmlns%3Awsa%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2004%2F08%2Faddressing%22%20xmlns%3Awsaw%3D%22http%3A%2F%2Fwww.w3.org%2F2006%2F05%2Faddressing%2Fwsdl%22%20xmlns%3Awsap%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2004%2F08%2Faddressing%2Fpolicy%22%20xmlns%3Awsu%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fwss%2F2004%2F01%2Foasis-200401-wss-wssecurity-utility-1.0.xsd%22%20xmlns%3Atrust%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-trust%2F200512%22%20xmlns%3Awsp%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2004%2F09%2Fpolicy%22%20xmlns%3Awsa10%3D%22http%3A%2F%2Fwww.w3.org%2F2005%2F08%2Faddressing%22%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%20wsu%3AId%3D%22UserNameWSTrustBinding_IWSTrustFeb2005Async_policy%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3AExactlyOne%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3AAll%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ATransportBinding%20xmlns%3Asp%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F07%2Fsecuritypolicy%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ATransportToken%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AHttpsToken%20RequireClientCertificate%3D%22false%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3ATransportToken%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AAlgorithmSuite%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ABasic256%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3AAlgorithmSuite%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ALayout%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AStrict%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3ALayout%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AIncludeTimestamp%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3ATransportBinding%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ASignedSupportingTokens%20xmlns%3Asp%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F07%2Fsecuritypolicy%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AUsernameToken%20sp%3AIncludeToken%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F07%2Fsecuritypolicy%2FIncludeToken%2FAlwaysToRecipient%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AWssUsernameToken10%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3AUsernameToken%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3ASignedSupportingTokens%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AEndorsingSupportingTokens%20xmlns%3Asp%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F07%2Fsecuritypolicy%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cmssp%3ARsaToken%20sp%3AIncludeToken%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F07%2Fsecuritypolicy%2FIncludeToken%2FNever%22%20wsp%3AOptional%3D%22true%22%20xmlns%3Amssp%3D%22http%3A%2F%2Fschemas.microsoft.com%2Fws%2F2005%2F07%2Fsecuritypolicy%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ASignedParts%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AHeader%20Name%3D%22To%22%20Namespace%3D%22http%3A%2F%2Fwww.w3.org%2F2005%2F08%2Faddressing%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3ASignedParts%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3AEndorsingSupportingTokens%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AWss11%20xmlns%3Asp%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F07%2Fsecuritypolicy%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AMustSupportRefKeyIdentifier%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AMustSupportRefIssuerSerial%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AMustSupportRefThumbprint%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AMustSupportRefEncryptedKey%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3AWss11%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ATrust10%20xmlns%3Asp%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F07%2Fsecuritypolicy%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AMustSupportIssuedTokens%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ARequireClientEntropy%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ARequireServerEntropy%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3ATrust10%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsaw%3AUsingAddressing%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3AAll%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3AExactlyOne%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%20wsu%3AId%3D%22UserNameWSTrustBinding_IWSTrust13Async_policy%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3AExactlyOne%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3AAll%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ATransportBinding%20xmlns%3Asp%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-securitypolicy%2F200702%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ATransportToken%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AHttpsToken%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3ATransportToken%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AAlgorithmSuite%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ABasic256%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3AAlgorithmSuite%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ALayout%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AStrict%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3ALayout%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AIncludeTimestamp%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3ATransportBinding%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ASignedEncryptedSupportingTokens%20xmlns%3Asp%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-securitypolicy%2F200702%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AUsernameToken%20sp%3AIncludeToken%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-securitypolicy%2F200702%2FIncludeToken%2FAlwaysToRecipient%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AWssUsernameToken10%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3AUsernameToken%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3ASignedEncryptedSupportingTokens%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AEndorsingSupportingTokens%20xmlns%3Asp%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-securitypolicy%2F200702%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AKeyValueToken%20sp%3AIncludeToken%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-securitypolicy%2F200702%2FIncludeToken%2FNever%22%20wsp%3AOptional%3D%22true%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ASignedParts%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AHeader%20Name%3D%22To%22%20Namespace%3D%22http%3A%2F%2Fwww.w3.org%2F2005%2F08%2Faddressing%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3ASignedParts%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3AEndorsingSupportingTokens%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AWss11%20xmlns%3Asp%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-securitypolicy%2F200702%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AMustSupportRefKeyIdentifier%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AMustSupportRefIssuerSerial%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AMustSupportRefThumbprint%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AMustSupportRefEncryptedKey%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3AWss11%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ATrust13%20xmlns%3Asp%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-securitypolicy%2F200702%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3AMustSupportIssuedTokens%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ARequireClientEntropy%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csp%3ARequireServerEntropy%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsp%3ATrust13%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsaw%3AUsingAddressing%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3AAll%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3AExactlyOne%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fwsp%3APolicy%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Atypes%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxsd%3Aschema%20targetNamespace%3D%22http%3A%2F%2Fschemas.microsoft.com%2Fws%2F2008%2F06%2Fidentity%2Fsecuritytokenservice%2FImports%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cxsd%3Aimport%20namespace%3D%22http%3A%2F%2Fschemas.microsoft.com%2FMessage%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cxsd%3Aimport%20namespace%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F02%2Ftrust%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cxsd%3Aimport%20namespace%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-trust%2F200512%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fxsd%3Aschema%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Atypes%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Amessage%20name%3D%22IWSTrustFeb2005Async_TrustFeb2005IssueAsync_InputMessage%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Apart%20name%3D%22request%22%20element%3D%22t%3ARequestSecurityToken%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Amessage%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Amessage%20name%3D%22IWSTrustFeb2005Async_TrustFeb2005IssueAsync_OutputMessage%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Apart%20name%3D%22TrustFeb2005IssueAsyncResult%22%20element%3D%22t%3ARequestSecurityTokenResponse%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Amessage%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Amessage%20name%3D%22IWSTrust13Async_Trust13IssueAsync_InputMessage%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Apart%20name%3D%22request%22%20element%3D%22trust%3ARequestSecurityToken%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Amessage%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Amessage%20name%3D%22IWSTrust13Async_Trust13IssueAsync_OutputMessage%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Apart%20name%3D%22Trust13IssueAsyncResult%22%20element%3D%22trust%3ARequestSecurityTokenResponseCollection%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Amessage%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3AportType%20name%3D%22IWSTrustFeb2005Async%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Aoperation%20name%3D%22TrustFeb2005IssueAsync%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Ainput%20wsaw%3AAction%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F02%2Ftrust%2FRST%2FIssue%22%20message%3D%22tns%3AIWSTrustFeb2005Async_TrustFeb2005IssueAsync_InputMessage%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Aoutput%20wsaw%3AAction%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F02%2Ftrust%2FRSTR%2FIssue%22%20message%3D%22tns%3AIWSTrustFeb2005Async_TrustFeb2005IssueAsync_OutputMessage%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Aoperation%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3AportType%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3AportType%20name%3D%22IWSTrust13Async%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Aoperation%20name%3D%22Trust13IssueAsync%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Ainput%20wsaw%3AAction%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-trust%2F200512%2FRST%2FIssue%22%20message%3D%22tns%3AIWSTrust13Async_Trust13IssueAsync_InputMessage%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Aoutput%20wsaw%3AAction%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-trust%2F200512%2FRSTRC%2FIssueFinal%22%20message%3D%22tns%3AIWSTrust13Async_Trust13IssueAsync_OutputMessage%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Aoperation%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3AportType%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Abinding%20name%3D%22UserNameWSTrustBinding_IWSTrustFeb2005Async%22%20type%3D%22tns%3AIWSTrustFeb2005Async%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicyReference%20URI%3D%22%23UserNameWSTrustBinding_IWSTrustFeb2005Async_policy%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Csoap12%3Abinding%20transport%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fsoap%2Fhttp%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Aoperation%20name%3D%22TrustFeb2005IssueAsync%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csoap12%3Aoperation%20soapAction%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F02%2Ftrust%2FRST%2FIssue%22%20style%3D%22document%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Ainput%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csoap12%3Abody%20use%3D%22literal%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Ainput%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Aoutput%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csoap12%3Abody%20use%3D%22literal%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Aoutput%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Aoperation%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Abinding%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Abinding%20name%3D%22UserNameWSTrustBinding_IWSTrust13Async%22%20type%3D%22tns%3AIWSTrust13Async%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsp%3APolicyReference%20URI%3D%22%23UserNameWSTrustBinding_IWSTrust13Async_policy%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Csoap12%3Abinding%20transport%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fsoap%2Fhttp%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Aoperation%20name%3D%22Trust13IssueAsync%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csoap12%3Aoperation%20soapAction%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-trust%2F200512%2FRST%2FIssue%22%20style%3D%22document%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Ainput%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csoap12%3Abody%20use%3D%22literal%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Ainput%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Aoutput%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csoap12%3Abody%20use%3D%22literal%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Aoutput%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Aoperation%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Abinding%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Aservice%20name%3D%22SecurityTokenService%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Aport%20name%3D%22UserNameWSTrustBinding_IWSTrustFeb2005Async%22%20binding%3D%22tns%3AUserNameWSTrustBinding_IWSTrustFeb2005Async%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csoap12%3Aaddress%20location%3D%22https%3A%2F%2Fidpstg.nycenet.edu%2FTrustServerWST13%2Fservices%2FRequestSecurityToken%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsa10%3AEndpointReference%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsa10%3AAddress%3Ehttps%3A%2F%2Fidpstg.nycenet.edu%2FTrustServerWST13%2Fservices%2FRequestSecurityToken%3C%2Fwsa10%3AAddress%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsa10%3AEndpointReference%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Aport%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsdl%3Aport%20name%3D%22UserNameWSTrustBinding_IWSTrust13Async%22%20binding%3D%22tns%3AUserNameWSTrustBinding_IWSTrust13Async%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csoap12%3Aaddress%20location%3D%22https%3A%2F%2Fidpstg.nycenet.edu%2FTrustServerWST13%2Fservices%2FRequestSecurityToken%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsa10%3AEndpointReference%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cwsa10%3AAddress%3Ehttps%3A%2F%2Fidpstg.nycenet.edu%2FTrustServerWST13%2Fservices%2FRequestSecurityToken%3C%2Fwsa10%3AAddress%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsa10%3AEndpointReference%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Aport%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Aservice%3E%0A%20%20%20%20%20%20%20%20%3C%2Fwsdl%3Adefinitions%3E%0A%20%20%20%20%20%20%3C%2Fwsx%3AMetadataSection%3E%0A%20%20%20%20%20%20%3Cwsx%3AMetadataSection%20Dialect%3D%22http%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%22%20Identifier%3D%22http%3A%2F%2Fschemas.microsoft.com%2FMessage%22%20xmlns%3D%22%22%3E%0A%20%20%20%20%20%20%20%20%3Cxs%3Aschema%20elementFormDefault%3D%22qualified%22%20targetNamespace%3D%22http%3A%2F%2Fschemas.microsoft.com%2FMessage%22%20xmlns%3Axs%3D%22http%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%22%20xmlns%3Atns%3D%22http%3A%2F%2Fschemas.microsoft.com%2FMessage%22%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cxsd%3AcomplexType%20name%3D%22MessageBody%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxsd%3Asequence%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cxsd%3Aany%20minOccurs%3D%220%22%20maxOccurs%3D%22unbounded%22%20namespace%3D%22%23%23any%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fxsd%3Asequence%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fxsd%3AcomplexType%3E%0A%20%20%20%20%20%20%20%20%3C%2Fxs%3Aschema%3E%0A%20%20%20%20%20%20%3C%2Fwsx%3AMetadataSection%3E%0A%20%20%20%20%20%20%3Cwsx%3AMetadataSection%20Dialect%3D%22http%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%22%20Identifier%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F02%2Ftrust%22%20xmlns%3D%22%22%3E%0A%20%20%20%20%20%20%20%20%3Cxs%3Aschema%20elementFormDefault%3D%22qualified%22%20targetNamespace%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F02%2Ftrust%22%20xmlns%3Axs%3D%22http%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%22%20xmlns%3Awst%3D%22http%3A%2F%2Fschemas.xmlsoap.org%2Fws%2F2005%2F02%2Ftrust%22%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cxs%3Aelement%20name%3D%22RequestSecurityToken%22%20type%3D%22wst%3ARequestSecurityTokenType%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cxs%3AcomplexType%20name%3D%22RequestSecurityTokenType%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3Achoice%20minOccurs%3D%220%22%20maxOccurs%3D%22unbounded%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3Aany%20minOccurs%3D%220%22%20maxOccurs%3D%22unbounded%22%20namespace%3D%22%23%23any%22%20processContents%3D%22lax%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fxs%3Achoice%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3Aattribute%20name%3D%22Context%22%20type%3D%22xs%3AanyURI%22%20use%3D%22optional%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3AanyAttribute%20namespace%3D%22%23%23other%22%20processContents%3D%22lax%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fxs%3AcomplexType%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cxs%3Aelement%20name%3D%22RequestSecurityTokenResponse%22%20type%3D%22wst%3ARequestSecurityTokenResponseType%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cxs%3AcomplexType%20name%3D%22RequestSecurityTokenResponseType%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3Achoice%20minOccurs%3D%220%22%20maxOccurs%3D%22unbounded%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3Aany%20minOccurs%3D%220%22%20maxOccurs%3D%22unbounded%22%20namespace%3D%22%23%23any%22%20processContents%3D%22lax%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fxs%3Achoice%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3Aattribute%20name%3D%22Context%22%20type%3D%22xs%3AanyURI%22%20use%3D%22optional%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3AanyAttribute%20namespace%3D%22%23%23other%22%20processContents%3D%22lax%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fxs%3AcomplexType%3E%0A%20%20%20%20%20%20%20%20%3C%2Fxs%3Aschema%3E%0A%20%20%20%20%20%20%3C%2Fwsx%3AMetadataSection%3E%0A%20%20%20%20%20%20%3Cwsx%3AMetadataSection%20Dialect%3D%22http%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%22%20Identifier%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-trust%2F200512%22%20xmlns%3D%22%22%3E%0A%20%20%20%20%20%20%20%20%3Cxs%3Aschema%20elementFormDefault%3D%22qualified%22%20targetNamespace%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-trust%2F200512%22%20xmlns%3Axs%3D%22http%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%22%20xmlns%3Atrust%3D%22http%3A%2F%2Fdocs.oasis-open.org%2Fws-sx%2Fws-trust%2F200512%22%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cxs%3Aelement%20name%3D%22RequestSecurityToken%22%20type%3D%22trust%3ARequestSecurityTokenType%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cxs%3AcomplexType%20name%3D%22RequestSecurityTokenType%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3Achoice%20minOccurs%3D%220%22%20maxOccurs%3D%22unbounded%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3Aany%20minOccurs%3D%220%22%20maxOccurs%3D%22unbounded%22%20namespace%3D%22%23%23any%22%20processContents%3D%22lax%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fxs%3Achoice%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3Aattribute%20name%3D%22Context%22%20type%3D%22xs%3AanyURI%22%20use%3D%22optional%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3AanyAttribute%20namespace%3D%22%23%23other%22%20processContents%3D%22lax%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fxs%3AcomplexType%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cxs%3Aelement%20name%3D%22RequestSecurityTokenResponse%22%20type%3D%22trust%3ARequestSecurityTokenResponseType%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cxs%3AcomplexType%20name%3D%22RequestSecurityTokenResponseType%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3Achoice%20minOccurs%3D%220%22%20maxOccurs%3D%22unbounded%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3Aany%20minOccurs%3D%220%22%20maxOccurs%3D%22unbounded%22%20namespace%3D%22%23%23any%22%20processContents%3D%22lax%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fxs%3Achoice%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3Aattribute%20name%3D%22Context%22%20type%3D%22xs%3AanyURI%22%20use%3D%22optional%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3AanyAttribute%20namespace%3D%22%23%23other%22%20processContents%3D%22lax%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fxs%3AcomplexType%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cxs%3Aelement%20name%3D%22RequestSecurityTokenResponseCollection%22%20type%3D%22trust%3ARequestSecurityTokenResponseCollectionType%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%3Cxs%3AcomplexType%20name%3D%22RequestSecurityTokenResponseCollectionType%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3Asequence%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3Aelement%20minOccurs%3D%221%22%20maxOccurs%3D%22unbounded%22%20ref%3D%22trust%3ARequestSecurityTokenResponse%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fxs%3Asequence%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Cxs%3AanyAttribute%20namespace%3D%22%23%23other%22%20processContents%3D%22lax%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%3C%2Fxs%3AcomplexType%3E%0A%20%20%20%20%20%20%20%20%3C%2Fxs%3Aschema%3E%0A%20%20%20%20%20%20%3C%2Fwsx%3AMetadataSection%3E%0A%20%20%20%20%3C%2FMetadata%3E%0A%20%20%3C%2Fs%3ABody%3E%0A%3C%2Fs%3AEnvelope%3E</Body>
				</HTTPResponseChange>
			</xsl:when>
			<xsl:otherwise />
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
