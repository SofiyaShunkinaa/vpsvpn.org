{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {include file="$template/includes/alert.tpl" type="info" msg=$LANG.creditcard3dsecure textcenter=true}

    <br /><br />

    <div class="text-center">

        <div id="frmThreeDAuth" class="hidden">
            {$code}
        </div>

        <iframe name="3dauth" height="500" scrolling="auto" src="about:blank" class="submit-3d"></iframe>

        <br /><br />

    </div>

    <script language="javascript">
        jQuery("#frmThreeDAuth").find("form:first").attr('target', '3dauth');
        setTimeout("autoSubmitFormByContainer('frmThreeDAuth')", 1000);
    </script>
{/if}