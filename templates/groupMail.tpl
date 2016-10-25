{**
 * plugins/generic/groupMail/groupMail.tpl
 *
 * Copyright (c) 2016 Language Science Press
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 *}

{strip}
	{if !$contentOnly}
		{include file="common/header.tpl"}
	{/if}
{/strip}

<link rel="stylesheet" href="{$baseUrl}/plugins/generic/groupMail/css/groupMail.css" type="text/css" />

<div id="groupMail">

	<form class="pkp_form" method="post" action="getGroupMailResults">

		<table>
			<tr>
				<th>OR<sup>1</sup></th>
				<th>AND<sup>2</sup></th>
				<th>NOT<sup>3</sup></th>
				<th>{translate key="plugins.generic.groupMail.userGroup"}</th>
			</tr>

			{assign var="count" value=0}
			{foreach from=$userGroups key=userGroupId item=groupName}
				<tr {if $count mod 2} class="even"{else}class="odd"{/if}>
					<td>
						<input id="OR{$userGroupId}" name="OR{$userGroupId}" type="checkbox" {if $postOr.$count}checked{/if}></input>
					</td>
					<td>
						<input id="AND{$userGroupId}" name="AND{$userGroupId}" type="checkbox" {if $postAnd.$count}checked{/if}></input>
					</td>
					<td>
						<input id="NOT{$userGroupId}" name="NOT{$userGroupId}" type="checkbox" {if $postNot.$count}checked{/if}></input>
					</td>
					<td>
						<span>{$groupName}</span>
					</td>
				</tr>
			{assign var=count value=$count+1}
			{/foreach}

		</table> 

		<div id="description">
		<p>{translate key="plugins.generic.groupMail.andInfo"}</p>
		<p>{translate key="plugins.generic.groupMail.orInfo"}</p>
		<p>{translate key="plugins.generic.groupMail.notInfo"}</p>

		</div>

		<div id="chechboxes">
			<input id="getUsernames" name="getUsernames" type="checkbox" {if $getUsernames}checked{/if}><span>{translate key="plugins.generic.groupMail.showUsernames"}</span></input><br>
			<input id="getEmails" name="getEmails" type="checkbox" {if $getEmails}checked{/if}><span>{translate key="plugins.generic.groupMail.showEmails"}</span></input>
		</div>

		<div>

			<button id="buttonSaveToFile" name="buttonSaveToFile" type="submit"
						class="submitFormButton button ui-button ui-widget ui-state-default
						ui-corner-all ui-button-text-only" role="button" >
				<span class="ui-button-text">{translate key="plugins.generic.groupMail.saveResults"}</span>
			</button>
			<button id="buttonShowResults" name="buttonShowResults" type="submit"
					class="submitFormButton button ui-button ui-widget ui-state-default
					ui-corner-all ui-button-text-only" role="button" >
				<span class="ui-button-text">{translate key="plugins.generic.groupMail.showResults"}</span>
			</button>
			<a id="cancelFormButton" class="cancelFormButton" href="{$baseUrl}">Cancel</a>

		</div>
	</form>
	
	{if $results===null}

	{else}
	<div id="results">
		{assign var="noUsers" value=$results|@sizeof}
		<h3>{$noUsers} user{if !$noUsers==1}s{/if} found</h3>
		
		<table>
			{assign var="count" value=0}
			{foreach from=$results key=email item=username}
				<tr style="">
					{if $getUsernames}<td>{$username}</td>{/if}
					{if $getEmails}<td>{$email}</td>{/if}			
				</tr>
			{assign var=count value=$count+1}
			{/foreach}
		</table>
	</div>
	{/if}

</div> 

{strip}
		{include file="common/footer.tpl"}
{/strip}
