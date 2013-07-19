/* SYS */
window.SYS = {
    domain: window.location.host,
    cookie_domain: window.location.host,
    base: "",
    home: "/default",
    prefix: "nforum",
    mWidth: 1000,
    iframe:true,
    allowFrame:"/att/.*|/user/face",
    protocol:"http://",
    redirect:3,
    session:{
        timeout:30
    },
    ajax:{
        session:'user/ajax_session.json',
        login:'user/ajax_login.json',
        logout:'user/ajax_logout.json',
        valid_id:'user/ajax_valid_id.json',
        user:'user/query',
        section_list:'slist.json',
        favor_list:'flist.json',
        friend_list:'friend/ajax_list.json'
    },
    widget:{
        widgets:{
            board:{rss:true},
            topten:{rss:true},
            recommend:{rss:true},
            bless:{rss:true}
        },
        url:"/widget/set.json",
        persistent:false
    },
    //cache value via key,if value null return value of key
    cache: function(key, value){
        if(typeof key !== 'string') return this._cache;
        if(typeof value !== 'undefined') return this._cache[key] = value;
        if(this._cache[key]) return this._cache[key];
        return null;
    },
    //clear cache via key,if key null,clear all
    clear: function(key){
        var ret = false;;
        if(typeof key !== 'string'){
            ret = this._cache;
            delete this._cache;
            this._cache = {};
        }else if(this._cache[key]){
            ret = this._cache[key];
            delete this._cache[key];
        }
        return ret;
    },
    _cache:{}
};
if(typeof sys_merge != 'undefined') SYS = $.extend(true, SYS, window.sys_merge);
SYS.code = {
    COM_OK:'ȷ��',
    COM_CANCAL:'ȡ��',
    COM_SUBMIT:'�ύ',
    COM_TITLE:'��ʾ',
    COM_COMFIRM:'ȷ��',
    COM_DETAIL:'��ϸ��Ϣ',
    COM_REDIRECT:'�������°�ť������ת��',
    COM_PREVIEW:'Ԥ��',
    COM_COLOR:'��ɫ',
    COM_LOADING:'���Ժ�...',
    MSG_SYSERROR:'ϵͳ��������!',
    MSG_LOADING:'���ݼ�����...',
    MSG_USER:'�������û���',
    MSG_PWD:'����������',
    MSG_LOGIN:'����δ��¼,���ȵ�¼!',
    MSG_NOPERM:'��û�з���Ȩ��!',
    MSG_SUBJECT:'���������!',
    MSG_REPEAT:'�벻Ҫ�ظ�����!',
    MSG_NULL:'��Ҫ�ظ���������!',
    MSG_UNLOAD:'��ǰ���ݽ�������,��ȷ���뿪��ҳ?',
    MSG_DELETE:'ȷ��ɾ������?',
    WIG_LAST:'��ֻʣ��һ��ģ����!',
    WIG_DEL:'ģ��ɾ���������������"������ҳ����"���������',
    WIG_NONE:'��Ӧ�ò����ڻ򱻹ر�',
    WIG_ERROR:'��ȡ���ݷ�������',
    MSG_JOKE:'WTF'
};
if(typeof code_merge != 'undefined') SYS.code = $.extend(SYS.code, window.code_merge);
