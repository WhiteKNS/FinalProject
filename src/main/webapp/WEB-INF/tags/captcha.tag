<%@ tag import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ tag import="net.tanesha.recaptcha.ReCaptchaFactory" %>

<script type="text/javascript">var RecaptchaOptions = {theme : 'clean'};</script>
<%
    ReCaptcha reCaptcha = ReCaptchaFactory.newReCaptcha("6LdDCRETAAAAAHHOGX38EuCprliopDbhgf_xj4sI", "6LdDCRETAAAAAKJVHKxJH7n63ULCzmT_P9rEHIAR", false);
    out.print(reCaptcha.createRecaptchaHtml(null, null));
%>