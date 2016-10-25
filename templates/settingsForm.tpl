{**
 * plugins/generic/groupMail/settings.tpl
 *
 * Copyright (c) 2015 Language Science Press
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * The basic setting for the Series Overview plugin.
 *}


<script type="text/javascript">
	$(function() {ldelim}
		// Attach the form handler.
		$('#groupMailSettingsForm').pkpHandler('$.pkp.controllers.form.AjaxFormHandler');
	{rdelim});
</script>


<form class="pkp_form" id="groupMailSettingsForm" method="post" action="{url router=$smarty.const.ROUTE_COMPONENT op="manage" category="generic" plugin=$pluginName verb="settings" save="true"}">

	<input type="hidden" name="tab" value="settings"/>

	{fbvFormArea id="myText" class="border" title="plugins.generic.groupMail.settings.title"}

		{fbvFormSection}
			<p class="pkp_help">{translate key="plugins.generic.groupMail.form.pathIntro"}</p>
			{fbvElement type="text" label="plugins.generic.groupMail.form.path" required="false" id="path" value=$path maxlength="40" size=$fbvStyles.size.MEDIUM}
		{/fbvFormSection}

		{fbvFormButtons submitText="common.save"}

	{/fbvFormArea}

</form>
