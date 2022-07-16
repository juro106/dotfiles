let b:snippets = {
    \ 'front': "---\n"
    \    ."title: '${1}'\n"
    \    ."h1: ''\n"
    \    ."description: ''\n"
    \    ."datePublished: '".strftime("%Y-%m-%dT%H:%M:%S+09:00")."'\n"
    \    ."dateModified: ''\n"
    \    ."---",
    \ 'fm': "---\n"
    \    ."datePublished: '".strftime("%Y-%m-%dT%H:%M:%S+09:00")."'\n"
    \    ."dateModified: ''\n"
    \    ."title: '${1}'\n"
    \    ."description: ''\n"
    \    ."tags:\n"
    \    ."  - \n"
    \    ."summary: |-\n"
    \    ."\n"
    \    ."---",
    \ 'ads': "{{<ads>}}${1}",
    \ 'block': "<blockquote>${1}</blockquote>",
    \ 'titans': "{{<titans name=\"${1}\">}}",
    \ 'bio': "{{<bio name=\"${1}\">}}",
    \ 'go': "{{- ${1} -}}",
    \ 'end': "{{- end -}}${1}",
    \ 'img': "<img src=\"${1}\" alt=\"\" decoding=\"async\">",
    \ 'imgs': "{{<img src=\"${1}\" alt=\"\">}}",
    \ 'gocomm': "{{-/*<!-- ${1} -->*/}}",
    \ 'comm': "<!-- ${1} -->",
    \ 'pp': "<% ${1} %>",
    \ 'pe': "<%= ${1} %>",
    \ '!': "<!DOCTYPE html>\n"
    \    ."<html lang=\"ja\">\n"
    \    ."<head>\n"
    \    ."\t<meta charset=\"utf-8\">\n"
    \    ."\t<meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n"
    \    ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
    \    ."\t<meta name=\"description\" content=\"\">\n"
    \    ."\t<title></title>\n"
    \    ."</head>\n"
    \    ."<body>\n\t${1}\n</body>\n"
    \    ."</html>",
    \ }
