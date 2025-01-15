(() => {
    const arc4 = (function(a,r,c){function p(b){return b[c]==1?"0"+b:b}var t=[];return function(o){var s=[],z=[],j=256,l,x,m=o.msg,k=o.key,i,q=o.method;if(typeof k=="string"){l=k[c];while(j>0)t[--j]=j;for(i=0;i<256;i++){s[i]=t[i]=t[j=(j+(x=t[i])+k[r](i%l))%256];s[j]=t[j]=x}}else{for(i=0;i<256;i++)s[i]=t[i]}if(q=="decryption"){for(var u=i=j=y=0,l=m[c];y<l;y+=2){j+=x=s[i=(i+1)%256];j%=256;u=y%4==0?0:u*256;u+=parseInt(m.substr(y,2),16)^s[((s[i]=s[j])+(s[j]=x))%256];if(y%4!=0)z[a](String.fromCharCode(u))}}else if(q!="init"){var d=[],e;for(i=0;i<m[c];i++)d[a]((e=m[r](i))>255?parseInt(e/256):0,e%256);for(var j=y=0,l=d[c];y<l;z[a](p((d[y++]^s[((s[i]=s[j])+(s[j]=x))%256]).toString(16))))j=(j+(x=s[i=(y+1)%256]))%256}return z.join('')}})("push","charCodeAt","length");
    const myEmail = arc4({
        msg: "452c98d97afd64babf6907b5406bab0df7d825d0b57c7cffb27babf44880cb828804",
        method: "decryption",
        key: "oFKV3WHAO9ra6gjIjTInvW321XbeWfm6"
    });
    document.querySelectorAll('a.email-link').forEach((emailLink) => {
        emailLink.href = "mailto:" + myEmail;
        emailLink.textContent = myEmail;
    });
})();
