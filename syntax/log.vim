" Vim syntax file 
" Language: log file 
" Maintainer: leaonow yu <box@doloveyou.com> 
" Latest Revision: 2014-05-27 
if exists("b:current_syntax")
	finish 
endif 

syntax case ignore 

syn match log_error '\c.*\<\(FATAL\|ERROR\|CANNOT\|ERRORS\|FAIL\|FAILED\|FAILURE\|SEVERE\|SystemErr\|EXCEPTION\).*' 
syn match log_warning '\(WARNING\|DISABLE\|DISABLED\|CAUSED\|REACHED\|THROWING\|THROW\|THROWS\|WARN\|RETRY\|INVALID\|ILLEGAL\|CAUGHT\|INACCESSABLE\|OCCURRED\|UNCAUGHT\|UNABLE\|UNAUTHORIZED\|UNAUTHENTICATED\|HUNG\|RESET\|RETRYING\)' 
syn match log_debug '\(INFO\|TRACE\|DETAIL\|NOTICE\|DEBUG\)' 

syn keyword log_keyword ffdc FFDC WebContainer JDBC ConnectionManager JMS sib login LTPA WLM launch discover discovered node server ManagedProcess pid NodeAgent nodeagent restart profiles proxy STARTED STOPPED EXIT Entry register running Classpath ClassPath classpath CLASSPATH security principal null Null NULL session Starting started timeout threads thread e-business open successful handshake ssl SSL secure certificate soap Soap SOAP ldap LDAP JNDI *** Finished RSA TLS ClientKeyExchange ClientHello Certificate ServerHello ServerHelloDone CertificateVerify Cipher MD5 SHA1 Compression Subject Signature Validity Issuer SerialNumber DNSName SubjectAlternativeName keyUsage CA Found found X509 CertificateRequest bootstrap cell Cell BusMember transportChain startup WAR JAR Ejb EJB malloc lookup Permission permission TAI synchronization create created user User modified deleted completed changed time reqid ip name Async Sync CoreStack supported join reason max Max Maximum maximum total socket Socket SOCKET loadClass JCA elapsed 

syn match log_phrase '\(Java\sHome\|Web\sServices\sProvider\sdetail\|Servlet\sMessage\|Web\sServices\sRequestor\sdetail\|name\sspace\|Java\sversion\|Java\sCompiler\|Java\sVM\sname\|Host\sOperating\sSystem\sis\|user\.install\.root\|ws\.ext\.dirs\|process\sid\|WebSphere\sPlatform\|Java\sLibrary\spath\|was\.install\.root\)' 
syn region log_string start=/'/ end=/'/ end=/$/ skip=/\\./ 
syn region log_string start=/"/ end=/"/ skip=/\\./ 
syn match log_number '0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*' 

syn match log_date '\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) [ 0-9]\d *' 
syn match log_date '\d\{4}-\d\d-\d\d' 
syn match log_date '\d\+\s\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\)\s\d\{4}' 

syn match log_time '\d\d:\d\d:\d\d\s*' 
syn match log_time '\d\d*:\d\d:\d\d\:\d\{3}' 
syn match log_time '\c\d\d:\d\d:\d\d\(\.\d\+\)\=\([+-]\d\d:\d\d\|Z\)' 

hi def link log_string String 
hi def link log_number Number 
hi def link log_date Constant 
hi def link log_time Type " 
" hi def link log_error ErrorMsg 
hi log_error ctermbg=red ctermfg=black " 
" hi def link log_warning WarningMsg 
hi log_warning ctermbg=brown ctermfg=black 
hi log_debug ctermbg=blue ctermfg=yellow 
hi log_keyword ctermbg=green ctermfg=black 
hi log_phrase ctermbg=green ctermfg=black 
let b:current_syntax = "log"
