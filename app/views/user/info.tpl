    	<div class="mbar">
        	<ul>
                <li class="selected"><a href="<{$base}>/user/info">���������޸�</a></li>
                <li><a href="<{$base}>/user/passwd">�ǳ������޸�</a></li>
                <li><a href="<{$base}>/user/custom">�û��Զ������</a></li>
                <li><a href="<{$base}>/mail">�û��ż�</a></li>
                <li><a href="<{$base}>/refer">��������</a></li>
                <li><a href="<{$base}>/friend">�����б�</a></li>
                <li><a href="<{$base}>/fav">�ղذ���</a></li>
            </ul>					
        </div>
        <div class="b-content corner">
        	<div id="c_content" class="corner">
				<form method="post" action="<{$base}>/user/ajax_info.json">
                <section class="list-block">
                <header>������Ϣ</header>
                <ul>
                    <li>
						<span class="b-left-m">�Ա�:&ensp;</span>
						<input type="radio" name="gender" <{if $gender=="1"}>checked="true"<{/if}> value="1" />&ensp;��&emsp;
						<input type="radio" name="gender" <{if $gender=="2"}>checked="true"<{/if}> value="2" />&ensp;Ů
					</li>
                    <li>
						<span class="b-left-m">��������:&ensp;</span>
						<input class="input-text" size="3" type="text" name="year" value="<{$year}>" />��
						<input size="2" class="input-text" type="text" name="month" value="<{$month}>" />��
						<input size="2" class="input-text" size="2" type="text" name="day" value="<{$day}>" />��
						<span class="b-right-m">����������ȫ������</span></li>
                </ul>
                </section>
                <section class="list-block">
                <header>ͷ������</header>
                <ul>
                    <li class="def">
						<span class="b-left-m">�Զ���ͷ��:&ensp;</span>
                        <div id="face_upload">
                            <input id="face_upload_select" type="button" value="ѡ���ļ�" class="submit" />
                            <span id="face_upload_info"></span>
                        </div>
					</li>
                    <li class="def">
						<span class="b-left-m">&ensp;</span>
                    	<div class="u-img-d">
                    		<div><span>ͷ��λ��:</span><input type="text" class="input-text" value="<{$myface_url}>" id="furl" name="furl"/></div>
							<div><span>��&emsp;&emsp;��:</span><input type="text" class="input-text" value="<{$myface_w}>" id="fwidth" name="fwidth"/></div>
							<div><span>��&emsp;&emsp;��:</span><input type="text" class="input-text" value="<{$myface_h}>" id="fheight" name="fheight"/></div>
                    	</div>
                        <div class="u-img-show">
                            <img src="<{$static}><{$base}><{$myface}>" id="fpreview" <{if $myface_w != ""}>width="<{$myface_w}>px"<{/if}> <{if $myface_h != ""}>height="<{$myface_h}>px"<{/if}> />
                        </div>
                        <div class="clearfix"></div>
                    </li>
                </ul>
                </section>
                <section class="list-block">
                <header>��ϵ��Ϣ</header>
                <ul>
                    <li><span class="b-left-m">QQ:&ensp;</span><input class="input-text" type="text" name="qq" value="<{$qq}>" /><span class="b-right-m">��д����QQ�����������˵���ϵ</span></li>
                    <li><span class="b-left-m">MSN:&ensp;</span><input class="input-text" type="text" name="msn" value="<{$msn}>" /><span class="b-right-m">��д����MSN��ַ�����������˵���ϵ</span></li>
                    <li><span class="b-left-m">��ҳ:&ensp;</span><input class="input-text" type="text" name="homepage" value="<{$homepage}>" /><span class="b-right-m">��д���ĸ�����ҳ��ַ��չʾ�������Ϸ��</span></li>
                    <li><span class="b-left-m">Email:&ensp;</span><input class="input-text" type="text" name="email" value="<{$email}>"/><span class="b-right-m">������Ч�����ʼ���ַ</span></li>
                    <li><span class="b-left-m">ǩ����:&ensp;</span><textarea class="input-text b-textarea" name="signature"><{$sig}></textarea></li>
                    <li class="b-op"><input type="submit" class="button" value="�ύ�޸�" /><input class="button" type="reset" value="��д" /></li>
                </ul>
                </section>
                </form>
            </div>
    	</div>
