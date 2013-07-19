    <div class="t-pre">
        <div class="page">
            <{include file="pagination.tpl" page_name='����'}>
        </div>
		<div class="t-btn">
<{if !$tmpl}>
        	<a href="<{$base}>/article/<{$bName}>/post" class="a-post button">�»���</a>
<{/if}>
        	<a href="<{$base}>/article/<{$bName}>/tmpl" class="a-post button">ģ�淢��</a>
            <a href="javascript:void(0)" id="a_reply" class="button">��ݻظ�</a>
        </div>
    </div>
	<{capture name=n_left}>��������:&ensp;<{$title}><{/capture}>
	<{capture name=n_right}><span style="color:#eee;vertical-align:bottom" id="a_share" _u="<{$domain}><{$base}>/article/<{$bName}>/<{$gid}>" _c="<{$title}>">����:</span><{/capture}>
	<{include file="s_nav.tpl" nav_left=$smarty.capture.n_left nav_right=$smarty.capture.n_right}>
    	<div class="b-content corner">
<{if count($info) == 0}>
        <div class="corner" style="text-align:center;margin:3px 0;padding:8px 0;border:1px solid #D4E6FC">�������κ�����</div>
<{else}>
<{foreach from=$info item=item}>
	<a name="a<{$item.pos}>"></a>
    <div class="a-wrap corner">
	<table class="article">
		<tr class="a-head">
			<td class="a-left">
<{if !($item.owner)}>
				<span class="a-u-name"><{$item.poster}></span>
				<span class="a-u-sex" > <samp title="����" class="ico-pos-offline-hide" ></samp>
				</span>
<{else}>
				<span class="a-u-name"><a href="<{$base}>/user/query/<{$item.owner.id}>"><{$item.owner.id}></a></span>
				<span class="a-u-sex" >
				<samp
				<{if ($item.owner.gender == -1)}>
					<{if ($item.owner.online)}> title="�Ա���Ŷ ����" class="ico-pos-online-hide" <{else}> title="�Ա���Ŷ ����" class="ico-pos-offline-hide" <{/if}>
				<{elseif $item.owner.gender == 0}>
					<{if ($item.owner.online)}> title="����Ŷ ����" class="ico-pos-online-man" <{else}> title="����Ŷ ����" class="ico-pos-offline-man" <{/if}>
				<{else}>
					<{if ($item.owner.online)}> title="Ů��Ŷ ����" class="ico-pos-online-woman" <{else}> title="Ů��Ŷ ����" class="ico-pos-offline-woman" <{/if}>
				<{/if}>
				></samp>
				</span>
<{/if}>
			</td>
			<td>
				<ul class="a-func">
					<li><samp class="ico-pos-reply"></samp><a href="<{$base}>/article/<{$bName}>/post/<{$item.id}>" class="a-post">�ظ�</a></li>
<{if $item.subject}>
					<li><samp class="ico-pos-template"></samp><a href="<{$base}>/article/<{$bName}>/tmpl?id=<{$item.id}>" class="a-post">ģ��ظ�</a></li>
<{/if}>
					<li><samp class="ico-pos-forward"></samp><a href="<{$base}>/article/<{$bName}>/ajax_forward/<{$item.id}>.json" class="a-func-forward">ת��</a></li>
					<li><samp class="ico-pos-search"></samp><a href="<{$base}>/s/article?b=<{$bName}>&au=<{$item.poster}>">����</a></li>
<{if $au}>
					<li><samp class="ico-pos-user"></samp><a href="<{$base}>/article/<{$bName}>/<{$gid}>?s=<{$item.id}>">չ��</a></li>
<{else}>
					<li><samp class="ico-pos-user"></samp><a href="<{$base}>/article/<{$bName}>/<{$gid}>?au=<{$item.poster}>">ֻ����ID</a></li>
<{/if}>
				<{if $item.op == "1"}>
					<li><samp class="ico-pos-edit"></samp><a href="<{$base}>/article/<{$bName}>/edit/<{$item.id}>">�༭</a></li>
					<li><samp class="ico-pos-del"></samp><a href="<{$base}>/article/<{$bName}>/ajax_delete/<{$item.id}>.json" class="a-func-del">ɾ��</a></li>
				<{/if}>
                <{if $bm}>
                    <li><samp class="ico-pos-deny"></samp><a href="<{$base}>/article/<{$bName}>/ajax_deny/<{$item.id}>.json" class="a-func-deny" _b="<{$bName}>" _u="<{$item.poster}>">���</a></li>
                    <li><samp class="ico-pos-manage"></samp><a href="<{$base}>/article/<{$bName}>/ajax_manage/<{$item.id}>.json" class="a-func-manage" _gid="<{$gid}>">����</a></li>
                <{/if}>
				</ul>
				<span class="a-pos">
					<{if $item.pos == "0"}>
					¥��
					<{else}>
					��<{$item.pos}>¥
					<{/if}>
				</span>
			</td>
		</tr>
		<tr class="a-body">
			<td class="a-left">
<{if !($item.owner)}>
				&nbsp;
<{else}>
				<div class="a-u-img">
					<img src="<{$static}><{$base}><{$item.owner.furl}>" <{if $item.owner.width != ""}>width="<{$item.owner.width}>px"<{/if}> <{if $item.owner.height != ""}>height="<{$item.owner.height}>px"<{/if}> />
				</div>
				<div class="a-u-uid"><{$item.owner.name}></div>
				<dl class="a-u-info">
					<dt>�ȼ�</dt>
					<dd><{$item.owner.level}></dd>
					<dt>����</dt>
					<dd><{$item.owner.post}></dd>
<{if !($item.owner.hide)}>
					<dt>����</dt>
					<dd><{$item.owner.astro}></dd>
<{/if}>
				</dl>
<{/if}>
			</td>
			<td class="a-content">
				<{$item.content}>
                <{if isset($vinfo) && $item.pos=="0"}>
                    <div id="vote_view" class="corner" style="margin:0;display:inline-block">
                    <{include file="../plugins/vote/views/index/vote.tpl"}>  
                    </div>
                <{/if}>
			</td>
		</tr>
		<tr class="a-bottom">
			<td class="a-left">
<{if !($item.owner)}>
				&nbsp;
<{else}>
				<ul class="a-func a-func-info">
					<li><samp class="ico-pos-query"></samp><a href="<{$base}>/user/query/<{$item.owner.id}>">�鿴</a></li>
					<li><samp class="ico-pos-mess"></samp><a href="<{$base}>/mail/<{$bName}>/reply/<{$item.id}>?id=<{$item.owner.id}>" class="a-post">����</a></li>
					<li><samp class="ico-pos-friend"></samp><a href="<{$base}>/friend/ajax_add.json?id=<{$item.owner.id}>" class="a-func-friend a-post">�Ӻ���</a></li>
				</ul>
<{/if}>
			</td>
			<td>
<{if $bm}>
				<ul class="a-status">
<{if $item.m}><li><samp class="ico-pos-article-m"></samp><{/if}>
<{if $item.g}><li><samp class="ico-pos-article-g"></samp><{/if}>
<{if $item.l}><li><samp class="ico-pos-article-lock"></samp><{/if}>
<{if $item.x}><li>X</li><{/if}>
<{if $item.p}><li>��</li><{/if}>
<{if $item.s}><li>�|</li><{/if}>
				</ul>
<{/if}>
            <a href="#" class="c63f a-back">���ض���</a></td>
		</tr>
	</table>
    </div>
<{/foreach}>
<{/if}>
        </div>
    <div class="t-pre-bottom">
        <div class="page">
            <{include file="pagination.tpl" page_name='������'}>
        </div>
    	<div class="t-btn">
        	<form id="f_search" method="get" action="<{$base}>/s/article">
        		<input type="text" class="input-text input" name="t1" placeholder="����ؼ���" size="16"/>
        		<input type="text" class="input-text input" name="au" placeholder="��������ID" size="12"/>
                <input type="checkbox" name="m" id="c_m"/>
                <label for="c_m">������</label>
                <input type="checkbox" name="a" id="c_a"/>
                <label for="c_a">������</label>
                <input type="submit" class="button" value="����" />
				<!--<input type="hidden" name="d" value="<{$searchDay}>" />-->
				<input type="hidden" name="b" value="<{$bName}>" />
            </form>
        </div>
    </div>
    <!--quick_reply start-->
	<form id="quick_post" method="post" action="<{$base}>/article/<{$bName}>/ajax_post.json" >
    <table id="quick_reply" class="corner">
        <tr>
            <td><textarea id="quick_text" name="content"></textarea></td>
            <td id="quick_submit"><input type="submit" class="button" value="��ݻظ�" /></td>
        </tr>
        <tr>
			<td colspan="2"><div id="em_img"></div></td>
        </tr>
    </table>
	<input type="hidden" name="id" value="<{$reid|default:0}>" />
	<input type="hidden" name="subject" value="<{$reTitle}>" />
	<{if $anony}>
	<input type="hidden" name="anony" value="1" />
	<{/if}>
    </form>
    <!--quick_reply end-->
<{include file="article/forward.tpl"}>
<{if $bm}><{include file="article/manage.tpl"}><{/if}>
<{if isset($syntax)}><{include file="syntax_high_lighter.tpl"}><{/if}>
