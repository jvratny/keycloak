<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">    
    <h1>Welcome to the client section of the portal maintained by<br /> W.A.G. payment solutions, a.s.</h1>
				    <p>After logging in, you have access <strong>to numerous features and comprehensive information</strong> related to the use of Eurowag cards, including overviews of transactions, invoicing, card blocking options and the registration of vehicles for toll systems.</p>

    <#elseif section = "form">
    
				    <div id="LoginLeftBox" class="col col-l">
					    <h2>Client login</h2>
					    <div class="inner" >
                <div class="top">
							    <p>
<#if realm.password && social.providers??>
            <div id="kc-social-providers">
                <ul>
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span class="text">${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <label for="_LoginName" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                        <#if usernameEditDisabled??>
                           <input tabindex="1" id="_LoginName" class="text" name="username" value="${(login.username!'')}" type="text" disabled />
                        <#else>
                           <input  tabindex="1" name="_LoginName" type="text" id="_LoginName" class="text" autofocus autocomplete="off" />
                        </#if>
   &nbsp;
                    <span id="rfvLoginName" class="error" style="color:Red;display:none;">*</span>
							    </p>
							    <p>

                        <label for="_LoginPassword" class="text">${msg("password")}</label>
                        <input tabindex="2" id="_LoginPassword" class="text" name="password" type="password" autocomplete="off" />
                   &nbsp;
                    <span id="rfvLoginPassword" class="error" style="color:Red;display:none;">*</span>
							    </p>
							    <p>

                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                        <label for="rememberMe" class="text">${msg("rememberMe")}</label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked> 
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" tabindex="3">
                                    </#if>
                            </div>
							    </p>
							    <p>
                        </#if>
                            <#if realm.resetPasswordAllowed>
                        <label for="rememberMe" class="text">&nbsp;</label>
                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}" class="text">${msg("doForgotPassword")}</a></span>
                            </#if>
							    </p>
							    <p>
                    <span class="inline-btn btn-blue-light">
                            <input tabindex="4" class="link-button" name="login" id="ButtonLogin" type="submit" value="${msg("doLogIn")}"/>
  </span>
							    </p>

                  <div style="color: Red;">
                    
                    
                    
                    
                    
                    
                    
                    
                    
                  </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        
                    </div>

                </div>

                   </div>
					    </div>
				    </div>

            </form>
        </#if>
        </p></div></div></div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>

        
    </#if>
</@layout.registrationLayout>
