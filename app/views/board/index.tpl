    <div class="t-pre">
        <div class="bmode">
            <span>����ģʽ:</span>
            <a class="tab-normal tab-down" href="<{$base}>/board/<{$bName}>">����</a>
            <a class="tab-normal" href="<{$base}>/board/<{$bName}>/mode/6">ԭ��</a>
            <a class="tab-normal" href="<{$base}>/board/<{$bName}>/mode/0">����</a>
            <a class="tab-normal" href="<{$base}>/board/<{$bName}>/mode/3">����</a>
            <a class="tab-normal" href="<{$base}>/board/<{$bName}>/mode/1">��ժ</a>
<{if $isAdmin || $bm}>
            <a class="tab-normal" href="<{$base}>/board/<{$bName}>/mode/4">����</a>
<{/if}>
<{if $isAdmin}>
            <a class="tab-normal" href="<{$base}>/board/<{$bName}>/mode/5">ֽ¨</a>
<{/if}>
        </div>
		<div class="t-btn">
<{if !$tmpl}>
			<a href="<{$base}>/article/<{$bName}>/post" class="b-post button">�»���</a>
<{/if}>
			<a href="<{$base}>/article/<{$bName}>/tmpl" class="b-post button">ģ�淢��</a>
<{if $hasVote}>
			<a href="<{$base}>/board/<{$bName}>/vote" class="button">����ͶƱ</a>
<{/if}>
			<a href="<{$base}>/elite/path?v=<{$elitePath}>" class="button">������</a>
			<{if $islogin}><a href="javascript:void(0)" id="b_fav" class="button" _b="<{$bName}>">�ղ�</a><{/if}>
			<{if $bm || $isAdmin}><a href="<{$base}>/board/<{$bName}>/denylist" class="button">����б�</a><{/if}>
			<a href="<{$base}>/rss/board-<{$bName}>" class="rss" target="_blank"><samp class="ico-pos-rss"></samp></a>
		</div>
    </div>
	<{capture name=n_left}>���浱ǰ����<{$curNum}>������<{if isset($maxNum)}><span title="������<{$maxTime}>">[���<{$maxNum}>��]</span><{/if}>&emsp;��������<{$todayNum}><{/capture}>
	<{capture name=n_right}>
	����:
		<{foreach from=$bms item=item}>
			&ensp;<{if $item[1]}><a href="<{$base}>/user/query/<{$item[0]}>"><{$item[0]}></a><{else}><{$item[0]}><{/if}>
		<{/foreach}>
	<{/capture}>

	<{include file="s_nav.tpl" nav_left=$smarty.capture.n_left nav_right=$smarty.capture.n_right}>
        <div class="b-content">
            <table class="board-list tiz" cellpadding="0" cellspacing="0">
                <thead>
                <tr>
                    <th class="title_8">״̬</th>
                    <th class="title_9 middle">����</th>
                    <th class="title_10">����ʱ��</th>
                    <th class="title_12">|&ensp;����</th>
                    <th class="title_11 middle">�ظ�</th>
                    <th class="title_10">���»ظ�</th>
                    <th class="title_12">|&ensp;����</th>
            	</tr>
                </thead>
                <tbody>
<{if ($info)}>
<{foreach from=$info item=item}>
				<tr <{if $item.tag == "T"}>class="top"<{/if}>>
					<td class="title_8">
                    <{if $bm || $isAdmin}>
                    <a class="a-func-manage" href="<{$base}>/article/<{$bName}>/ajax_manage/<{$item.gid}>.json" title="����" _gid="<{$item.gid}>">
                    <{else}>
					<a target="_blank" href="<{$base}>/article/<{$bName}>/<{$item.gid}>" title="���´��ڴ򿪴�����">
                    <{/if}>
                    <samp class="tag
					<{if $item.tag == "T"}> ico-pos-article-top
                    <{elseif $item.tag == "B"}> ico-pos-article-b
					<{elseif $item.tag == "M"}> ico-pos-article-m
					<{elseif $item.tag == "G"}> ico-pos-article-g
					<{elseif $item.tag == ";"}> ico-pos-article-lock
					<{elseif $item.tag == "L"}> ico-pos-article-light
                    <{elseif $item.tag == "L2"}> ico-pos-article-fire
                    <{elseif $item.tag == "L3"}> ico-pos-article-huo
					<{else}> ico-pos-article-normal
					<{/if}>"></samp></a></td>
					<td class="title_9">
						<a href="<{$base}>/article/<{$bName}>/<{$item.gid}>"><{$item.title}></a>
                    <{if $item.att}><samp class="tag-att ico-pos-article-attach"></samp><{/if}>
		<{if $item.page>7}>
		<span class="threads-tab">[<{section name=temp loop=7 start=2}><a href="<{$base}>/article/<{$bName}>/<{$item.gid}>?p=<{$smarty.section.temp.index}>"><{$smarty.section.temp.index}></a><{/section}>..<a href="<{$base}>/article/<{$bName}>/<{$item.gid}>?p=<{$item.page}>"><{$item.page}></a>]</span>
		<{elseif $item.page>1}>
		<span class="threads-tab">[<{section name=temp loop=$item.page+1 start=2}><a href="<{$base}>/article/<{$bName}>/<{$item.gid}>?p=<{$smarty.section.temp.index}>"><{$smarty.section.temp.index}></a><{/section}>]</span>
		<{/if}>
					</td>
                    <td class="title_10"><{$item.postTime}></td>
                    <td class="title_12">|&ensp;<a href="<{$base}>/user/query/<{$item.poster}>" class="c63f"><{$item.poster}></a></td>
                    <td class="title_11 middle"><{$item.num}></td>
                    <td class="title_10"><a href="<{$base}>/article/<{$bName}>/<{$item.gid}>?p=<{$item.page}>#a<{$item.num}>" title="��ת�����ظ�"><{$item.replyTime}></a></td>
                    <td class="title_12">|&ensp;<a href="<{$base}>/user/query/<{$item.last}>" class="c09f"><{$item.last}></a></td>
				</tr>
<{/foreach}>
<{else}>
				<tr>
					<td colspan="7" style="text-align:center">�ð���û���κ�����</td>
				</tr>
<{/if}>
                </tbody>
			</table>
    	</div>
    <div class="t-pre-bottom">
        <div class="page">
            <{include file="pagination.tpl" page_name='������'}>
        </div>
    	<div class="t-btn">
        	<form method="get" action="<{$base}>/s/article" id="board_search">
        		<input type="text" class="input-text input" name="t1" placeholder="����ؼ���" size="16"/>
        		<input type="text" class="input-text input" name="au" placeholder="��������ID" size="12"/>
                <input type="checkbox" name="m" id="c_m"/>
                <label for="c_m">������</label>
                <input type="checkbox" name="a" id="c_a"/>
                <label for="c_a">������</label>
                <input type="submit" class="button" value="����" />
				<input type="hidden" name="b" value="<{$bName}>" />
            </form>
        </div>
    </div>
<{if $bm || $isAdmin}><{include file="article/manage.tpl"}><{/if}>
