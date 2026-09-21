<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!((messagesPerField.existsError('username','password'))!false) displayInfo=((realm.password)!false && (realm.registrationAllowed)!false && !registrationDisabled??); section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <#if (realm.password)!false>
                    <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="vg-login-form">
                        <#if !usernameEditDisabled??>
                            <div class="vg-form-group">
                                <label for="username" class="vg-label">
                                    <#if !(realm.loginWithEmailAllowed)!false>${msg("username")}<#elseif !(realm.registrationEmailAsUsername)!false>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                                </label>
                                <div class="vg-input-wrapper">
                                    <svg class="vg-field-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                                    </svg>
                                    <input tabindex="1" id="username" class="vg-input" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="username"
                                           placeholder="e.g. adira@vgurukool.com"
                                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
                                </div>
                                <#if messagesPerField.existsError('username','password')>
                                    <span class="vg-field-error" aria-live="polite">
                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                    </span>
                                </#if>
                            </div>
                        </#if>

                        <div class="vg-form-group">
                            <div class="vg-label-row">
                                <label for="password" class="vg-label">${msg("password")}</label>
                                <#if (realm.resetPasswordAllowed)!false>
                                    <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="vg-link-forgot">${msg("doForgotPassword")}</a>
                                </#if>
                            </div>
                            <div class="vg-input-wrapper">
                                <svg class="vg-field-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"/>
                                </svg>
                                <input tabindex="2" id="password" class="vg-input" name="password" type="password" autocomplete="current-password"
                                       placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;"
                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
                                <button type="button" class="vg-toggle-pwd" onclick="var p=document.getElementById('password'); p.type = p.type==='password'?'text':'password';" title="Toggle Password Visibility">
                                    <svg class="vg-eye-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <#if (realm.rememberMe)!false && !usernameEditDisabled??>
                            <div class="vg-checkbox-row">
                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="vg-checkbox" <#if login.rememberMe??>checked</#if>>
                                <label for="rememberMe" class="vg-checkbox-label">${msg("rememberMe")}</label>
                            </div>
                        </#if>

                        <div class="vg-btn-row">
                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if (auth.selectedCredential)?has_content>value="${auth.selectedCredential}"</#if>/>
                            <button tabindex="4" class="vg-btn-primary" name="login" id="kc-login" type="submit">
                                <span>Sign In to Vgurukool</span>
                                <svg class="vg-btn-arrow" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M14 5l7 7m0 0l-7 7m7-7H3"/>
                                </svg>
                            </button>
                        </div>
                    </form>
                </#if>
            </div>
        </div>
    <#elseif section = "info">
        <#if (realm.password)!false && (realm.registrationAllowed)!false && !registrationDisabled??>
            <div id="kc-registration-container" class="vg-register-section">
                <span class="vg-register-text">${msg("noAccount")}</span>
                <a tabindex="6" href="${url.registrationUrl}" class="vg-register-link">${msg("doRegister")}</a>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
