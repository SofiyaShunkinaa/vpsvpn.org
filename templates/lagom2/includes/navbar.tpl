
{if file_exists("templates/$template/in1cludes/overwrites/navbar-new.tpl")}
    {include file="{$template}/includes/overwrites/navbar-new.tpl"}
{else}

    

    {foreach $navbar as $item}
        {if $item->getUri() == $currentUrl && isset($navtype) && $navtype == "primary" && !$item->getClass()|strstr:"nav-item-btn"}
            {assign var="activeGroup" value=$item->getName()}
        {/if}       
        {if $item->hasChildren()}
            {foreach $item->getChildren() as $childItem}
                {if $childItem->getUri() == $currentUrl || $currentUrl|strstr:"/ssl-certificates/"}
                    {assign var="activePage" value=$childItem->getName()}
                    {if $currentUrl|strstr:"/ssl-certificates/"}
                        {assign var="activePage" value="symantec"}
                    {/if}
                    {if isset($navtype) && $navtype == "primary"}
                        {assign var="activeGroup" value=$item->getName()}
                        {if $currentUrl|strstr:"/ssl-certificates/"}
                            {assign var="activeGroup" value="Website & Security"}
                        {/if}
                    {/if}
                {/if}       
            {/foreach}
        {/if}
    {/foreach}
    
    {foreach $navbar as $item}
        <li 
            menuItemName="{$item->getName()}" 
            class="{if $item->hasChildren() || $item->getAttribute('languageDropdown') || $item->getAttribute('currencyDropdown')}dropdown{/if}{if $item->getClass()}{$item->getClass()}{/if}{if $item->getName() == $activeGroup} active{/if}{if $RSThemes['layouts']['name'] == 'left-nav-wide' && $item->getName() == $activeGroup && $item->hasChildren()} open{/if}"
            id="{$item->getId()}"
            {if $item->getAttribute('languageDropdown')}data-language-select{/if}
        >
            {if $item->hasBodyHtml()}
                {$item->getBodyHtml()}
            {else}
                <a 
                    {if $item->hasChildren() || $item->getAttribute('languageDropdown') || $item->getAttribute('currencyDropdown')}
                        class="dropdown-toggle" 
                        href="#" 
                        data-toggle="dropdown"
                    {else} 
                        {if $item->getUri()|strstr:"javascript:void" || $item->getUri()|strstr:"tel:" || $item->getUri()|strstr:"mailto:"}
                            href="{$item->getUri()|replace:"/":""}"
                        {else}
                            href="{$item->getUri()}"
                        {/if}      
                    {/if}
                    {if $item->getAttribute('target')} target="{$item->getAttribute('target')}"{/if}
                    {if $RSThemes.layouts.templateLayout ==  "left-nav" && $navtype == "primary" && $item->getUri() && $item->getUri()!= "#" && $item->hasChildren()}data-nav-href="{$item->getUri()}"{/if}
                >
                    {if ($RSThemes.addonSettings.show_gravatar_image == 'hidden' && $item->getName() == 'Account') || ($RSThemes.addonSettings.show_gravatar_image == 'displayed' && !$loggedin && $item->getName() == 'Account')}
                        {if $item->hasIcon()}
                            <i class="{$item->getIcon()}"></i>
                        {elseif $item->hasHeadingHtml()}
                            {$item->getHeadingHtml()}
                        {/if}
                        {elseif $item->hasIcon() && $item->getName() != 'Account'}
                            <i class="{$item->getIcon()}"></i>
                    {elseif $item->hasHeadingHtml() && $item->getName() != 'Account'}
                        {$item->getHeadingHtml()}
                    {/if}
                    {if $item->getName() == 'Account'}
                        {if $loggedin}
                            {if $RSThemes.addonSettings.show_gravatar_image == 'displayed'}
                                <div class="client-avatar client-avatar-sm">
                                    <img src="https://www.gravatar.com/avatar/{$loggedinuser->email|md5}{if $RSThemes.addonSettings.gravatar_placeholder && $RSThemes.addonSettings.gravatar_placeholder != "default"}?d={$RSThemes.addonSettings.gravatar_placeholder}{/if}" alt="Avatar">
                                </div>
                            {/if}
                            {if $item->getLabel() && $item->getLabel() != ""}
                                {if $loggedinuser && !empty($loggedinuser->first_name)}
                                    <div class="active-client">
                                        <span class="item-text">{$loggedinuser->first_name} {$loggedinuser->last_name}</span>
                                        {if $clientsdetails.userid == $clientsdetails.owner_user_id}
                                            <span>{$clientsdetails.companyname}</span>
                                        {/if}
                                    </div>
                                {else}
                                    <div class="active-client">
                                        <span class="item-text">{$clientsdetails.firstname} {$clientsdetails.lastname}</span>
                                        <span>{$clientsdetails.companyname}</span>
                                    </div>
                                {/if}
                            {/if}
                        {elseif $item->getLabel() && $item->getLabel() != ""} 
                            <span class="item-text">{$LANG.myaccount}</span>
                        {/if}
                    {elseif $item->getLabel() && $item->getLabel() != ""} 
                        {if $item->getLabel()=="English"}
                            <span class="item-text item-text--navbar">ENG</span>
                            <div class="dropdown-arrow">
                            <svg width="8" height="4" viewBox="0 0 8 4" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.5 0.5L4 3.5L0.5 0.5" stroke="#FBFBFB" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
                        </div>
                        {elseif $item->getLabel()=="USD"}
                            <span class="item-text item-text--navbar">USD</span>
                                <div class="dropdown-arrow">
                                <svg width="8" height="4" viewBox="0 0 8 4" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M7.5 0.5L4 3.5L0.5 0.5" stroke="#FBFBFB" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
                            </div>
                        {elseif $item->getLabel()=="Русский"}
                        <span class="item-text item-text--navbar">RU</span>
                            <div class="dropdown-arrow">
                            <svg width="8" height="4" viewBox="0 0 8 4" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.5 0.5L4 3.5L0.5 0.5" stroke="#FBFBFB" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
                        </div>
                        {elseif $item->getLabel()=="RUB"}
                        <span class="item-text item-text--navbar">RUB</span>
                            <div class="dropdown-arrow">
                            <svg width="8" height="4" viewBox="0 0 8 4" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.5 0.5L4 3.5L0.5 0.5" stroke="#FBFBFB" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
                        </div>
                        {elseif $item->getLabel()=="EUR"}
                        <span class="item-text item-text--navbar">EUR</span>
                            <div class="dropdown-arrow">
                            <svg width="8" height="4" viewBox="0 0 8 4" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.5 0.5L4 3.5L0.5 0.5" stroke="#FBFBFB" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
                        </div>
                        {else}
                            <span class="item-text">{$item->getLabel()}</span>
                        {/if}
                        
                    {/if}
                    {if $item->hasBadge()}{$item->getBadge()}{/if}
                    {if ($item->hasChildren() || $item->getAttribute('languageDropdown') || $item->getAttribute('currencyDropdown')) && !$item->getAttribute('notificationDropdown')}{/if} {*menu items 4ps*}
                </a>
            {/if}
            {if $item->hasFooterHtml()}
                {$item->getFooterHtml()}
            {/if}
            {if $item->getAttribute('languageDropdown')}
                {include file="$template/includes/common/language-chooser-dropdown.tpl"}
            {elseif $item->getAttribute('currencyDropdown')}
                {include file="$template/includes/common/currency-dropdown.tpl"}    
            {elseif $item->hasChildren()}
                <ul class="dropdown-menu {if $RSThemes.layouts.templateLayout ==  "left-nav-wide" && $navtype == "primary"}{else}has-scroll{/if} {if $item->getName() == "Account" && $loggedin}dropdown-menu-right{/if} {if $item->getAttribute('notificationDropdown')}client-alerts{/if}"> 
                    {if $RSThemes.layouts.vars.type == "navbar-left" && $navtype == "primary"}
                        <li class="dropdown-header">{$item->getLabel()}</li>
                    {/if}
                    {foreach $item->getChildren() as $childItem}
                        {if $childItem->getName() == 'Client Details' && $loggedin}
                            <li class="dropdown-header dropdown-header--account">
                                {if $RSThemes.addonSettings.show_gravatar_image == 'displayed'}
                                    <div class="client-avatar client-avatar-sm">
                                        <img src="https://www.gravatar.com/avatar/{$loggedinuser->email|md5}{if $RSThemes.addonSettings.gravatar_placeholder && $RSThemes.addonSettings.gravatar_placeholder != "default"}?d={$RSThemes.addonSettings.gravatar_placeholder}{/if}" alt="Avatar">
                                    </div>
                                {/if}
                                <div class="dropdown-header-info">
                                    {$childItem->getLabel()}
                                </div>
                            </li>
                        {else}                 
                        <li menuItemName="{$childItem->getName()}" class="{if $childItem->getClass()}{$childItem->getClass()}{/if} {if $childItem->getName() == $activePage}active{/if}" id="{$childItem->getId()}">
                            {if $childItem->hasBodyHtml()}
                                {$childItem->getBodyHtml()}
                            {else}
                                <a 
                                    {if $childItem->getUri()|strstr:"javascript:void" || $childItem->getUri()|strstr:"tel:" || $childItem->getUri()|strstr:"mailto:"}
                                        href="{$childItem->getUri()|replace:"/":""}"
                                    {else}
                                        href="{$childItem->getUri()}"
                                    {/if}    
                                    {if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if}
                                >
                                    {if $childItem->hasIcon()}
                                        <i class="{$childItem->getIcon()}"></i>
                                    {elseif $childItem->hasHeadingHtml()}
                                        {$childItem->getHeadingHtml()}
                                    {/if}
                                    {$childItem->getLabel()}
                                    {if $childItem->hasBadge()}{$childItem->getBadge()}{/if}
                                </a>
                            {/if}
                            {if $childItem->hasFooterHtml()}
                                {$childItem->getFooterHtml()}
                            {/if}
                            
                        </li>
                        {/if}
                    {/foreach}
                </ul>
            {/if}
            
        </li>
    {/foreach}
{/if}