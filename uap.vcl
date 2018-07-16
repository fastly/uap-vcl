# uap-vcl
if (req.http.user-agent ~ "(ESPN)[%2520| ]+Radio/(\d+)\.(\d+)\.(\d+) CFNetwork") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Antenna)/(\d+) CFNetwork") {
  set req.http.ua_family = "AntennaPod";
  set req.http.ua_major = re.group.2;
} else if (req.http.user-agent ~ "(TopPodcasts)Pro/(\d+) CFNetwork") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
} else if (req.http.user-agent ~ "(MusicDownloader)Lite/(\d+)\.(\d+)\.(\d+) CFNetwork") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(.*)-iPad/(\d+)\.?(\d+)?.?(\d+)?.?(\d+)? CFNetwork") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(.*)-iPhone/(\d+)\.?(\d+)?.?(\d+)?.?(\d+)? CFNetwork") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(.*)/(\d+)\.?(\d+)?.?(\d+)?.?(\d+)? CFNetwork") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(espn\.go)") {
  set req.http.ua_family = "ESPN";
} else if (req.http.user-agent ~ "(espnradio\.com)") {
  set req.http.ua_family = "ESPN";
} else if (req.http.user-agent ~ "ESPN APP$") {
  set req.http.ua_family = "ESPN";
} else if (req.http.user-agent ~ "(audioboom\.com)") {
  set req.http.ua_family = "AudioBoom";
} else if (req.http.user-agent ~ " (Rivo) RHYTHM") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "(CFNetwork)(?:/(\d+)\.(\d+)\.?(\d+)?)?") {
  set req.http.ua_family = "CFNetwork";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Pingdom.com_bot_version_)(\d+)\.(\d+)") {
  set req.http.ua_family = "PingdomBot";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(PingdomTMS)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "PingdomBot";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(NewRelicPinger)/(\d+)\.(\d+)") {
  set req.http.ua_family = "NewRelicPingerBot";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Tableau)/(\d+)\.(\d+)") {
  set req.http.ua_family = "Tableau";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Salesforce)(?:.)\/(\d+)\.(\d?)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(\(StatusCake\))") {
  set req.http.ua_family = "StatusCakeBot";
} else if (req.http.user-agent ~ "(facebookexternalhit)/(\d+)\.(\d+)") {
  set req.http.ua_family = "FacebookBot";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "Google.*/\+/web/snippet") {
  set req.http.ua_family = "GooglePlusBot";
} else if (req.http.user-agent ~ "via ggpht.com GoogleImageProxy") {
  set req.http.ua_family = "GmailImageProxy";
} else if (req.http.user-agent ~ "(Twitterbot)/(\d+)\.(\d+)") {
  set req.http.ua_family = "TwitterBot";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "/((?:Ant-)?Nutch|[A-z]+[Bb]ot|[A-z]+[Ss]pider|Axtaris|fetchurl|Isara|ShopSalad|Tailsweep)[ \-](\d+)(?:\.(\d+)(?:\.(\d+))?)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "\b(008|Altresium|Argus|BaiduMobaider|BoardReader|DNSGroup|DataparkSearch|EDI|Goodzer|Grub|INGRID|Infohelfer|LinkedInBot|LOOQ|Nutch|PathDefender|Peew|PostPost|Steeler|Twitterbot|VSE|WebCrunch|WebZIP|Y!J-BR[A-Z]|YahooSeeker|envolk|sproose|wminer)/(\d+)(?:\.(\d+)(?:\.(\d+))?)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(MSIE) (\d+)\.(\d+)([a-z]\d?)?;.* MSIECrawler") {
  set req.http.ua_family = "MSIECrawler";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(DAVdroid)/(\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Google-HTTP-Java-Client|Apache-HttpClient|Go-http-client|scalaj-http|http%2520client|Python-urllib|HttpMonitor|TLSProber|WinHTTP|JNLP|okhttp|aihttp|reqwest)(?:[ /](\d+)(?:\.(\d+)(?:\.(\d+))?)?)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Pinterest(?:bot)?)/(\d+)(?:\.(\d+)(?:\.(\d+))?)?[;\s\(]+\+https://www.pinterest.com/bot.html") {
  set req.http.ua_family = "Pinterestbot";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(1470\.net crawler|50\.nu|8bo Crawler Bot|Aboundex|Accoona-[A-z]+-Agent|AdsBot-Google(?:-[a-z]+)?|altavista|AppEngine-Google|archive.*?\.org_bot|archiver|Ask Jeeves|[Bb]ai[Dd]u[Ss]pider(?:-[A-Za-z]+)*|bingbot|BingPreview|blitzbot|BlogBridge|Bloglovin|BoardReader(?: [A-Za-z]+)*|boitho.com-dc|BotSeer|BUbiNG|\b\w*favicon\w*\b|\bYeti(?:-[a-z]+)?|Catchpoint(?: bot)?|[Cc]harlotte|Checklinks|clumboot|Comodo HTTP\(S\) Crawler|Comodo-Webinspector-Crawler|ConveraCrawler|CRAWL-E|CrawlConvera|Daumoa(?:-feedfetcher)?|Feed Seeker Bot|Feedbin|findlinks|Flamingo_SearchEngine|FollowSite Bot|furlbot|Genieo|gigabot|GomezAgent|gonzo1|(?:[a-zA-Z]+-)?Googlebot(?:-[a-zA-Z]+)?|Google SketchUp|grub-client|gsa-crawler|heritrix|HiddenMarket|holmes|HooWWWer|htdig|ia_archiver|ICC-Crawler|Icarus6j|ichiro(?:/mobile)?|IconSurf|IlTrovatore(?:-Setaccio)?|InfuzApp|Innovazion Crawler|InternetArchive|IP2[a-z]+Bot|jbot\b|KaloogaBot|Kraken|Kurzor|larbin|LEIA|LesnikBot|Linguee Bot|LinkAider|LinkedInBot|Lite Bot|Llaut|lycos|Mail\.RU_Bot|masscan|masidani_bot|Mediapartners-Google|Microsoft .*? Bot|mogimogi|mozDex|MJ12bot|msnbot(?:-media *)?|msrbot|Mtps Feed Aggregation System|netresearch|Netvibes|NewsGator[^/]*|^NING|Nutch[^/]*|Nymesis|ObjectsSearch|Orbiter|OOZBOT|PagePeeker|PagesInventory|PaxleFramework|Peeplo Screenshot Bot|PlantyNet_WebRobot|Pompos|Qwantify|Read%2520Later|Reaper|RedCarpet|Retreiver|Riddler|Rival IQ|scooter|Scrapy|Scrubby|searchsight|seekbot|semanticdiscovery|SemrushBot|Simpy|SimplePie|SEOstats|SimpleRSS|SiteCon|Slackbot-LinkExpanding|Slack-ImgProxy|Slurp|snappy|Speedy Spider|Squrl Java|Stringer|TheUsefulbot|ThumbShotsBot|Thumbshots\.ru|Tiny Tiny RSS|TwitterBot|WhatsApp|URL2PNG|Vagabondo|VoilaBot|^vortex|Votay bot|^voyager|WASALive.Bot|Web-sniffer|WebThumb|WeSEE:[A-z]+|WhatWeb|WIRE|WordPress|Wotbox|www\.almaden\.ibm\.com|Xenu(?:.s)? Link Sleuth|Xerka [A-z]+Bot|yacy(?:bot)?|Yahoo[a-z]*Seeker|Yahoo! Slurp|Yandex\w+|YodaoBot(?:-[A-z]+)?|YottaaMonitor|Yowedo|^Zao|^Zao-Crawler|ZeBot_www\.ze\.bz|ZooShot|ZyBorg)(?:[ /]v?(\d+)(?:\.(\d+)(?:\.(\d+))?)?)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "\b(Boto3?|JetS3t|aws-(?:cli|sdk-(?:cpp|go|java|nodejs|ruby2?))|s3fs)/(\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(?:\/[A-Za-z0-9\.]+)? *([A-Za-z0-9 \-_\!\[\]:]*(?:[Aa]rchiver|[Ii]ndexer|[Ss]craper|[Bb]ot|[Ss]pider|[Cc]rawl[a-z]*))/(\d+)(?:\.(\d+)(?:\.(\d+))?)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(?:\/[A-Za-z0-9\.]+)? *([A-Za-z0-9 _\!\[\]:]*(?:[Aa]rchiver|[Ii]ndexer|[Ss]craper|[Bb]ot|[Ss]pider|[Cc]rawl[a-z]*)) (\d+)(?:\.(\d+)(?:\.(\d+))?)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "((?:[A-z0-9]+|[A-z\-]+ ?)?(?: the )?(?:[Ss][Pp][Ii][Dd][Ee][Rr]|[Ss]crape|[A-Za-z0-9-]*(?:[^C][^Uu])[Bb]ot|[Cc][Rr][Aa][Ww][Ll])[A-z0-9]*)(?:(?:[ /]| v)(\d+)(?:\.(\d+)(?:\.(\d+))?)?)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(HbbTV)/(\d+)\.(\d+)\.(\d+) \(") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Chimera|SeaMonkey|Camino|Waterfox)/(\d+)\.(\d+)\.?([ab]?\d+[a-z]*)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "\[FB.*;(FBAV)/(\d+)(?:\.(\d+)(?:\.(\d+))?)?") {
  set req.http.ua_family = "Facebook";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "\[(Pinterest)/[^\]]+\]") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "(Pinterest)(?: for Android(?: Tablet)?)?/(\d+)(?:\.(\d+)(?:\.(\d+))?)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "Mozilla.*Mobile.*(Instagram).(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "Mozilla.*Mobile.*(Flipboard).(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "Mozilla.*Mobile.*(Flipboard-Briefing).(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "Mozilla.*Mobile.*(Onefootball)\/Android.(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Firefox)/(\d+)\.(\d+) Basilisk/(\d+)") {
  set req.http.ua_family = "Basilisk";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(PaleMoon)/(\d+)\.(\d+)\.?(\d+)?") {
  set req.http.ua_family = "Pale Moon";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Fennec)/(\d+)\.(\d+)\.?([ab]?\d+[a-z]*)") {
  set req.http.ua_family = "Firefox Mobile";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Fennec)/(\d+)\.(\d+)(pre)") {
  set req.http.ua_family = "Firefox Mobile";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Fennec)/(\d+)\.(\d+)") {
  set req.http.ua_family = "Firefox Mobile";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(?:Mobile|Tablet);.*(Firefox)/(\d+)\.(\d+)") {
  set req.http.ua_family = "Firefox Mobile";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Namoroka|Shiretoko|Minefield)/(\d+)\.(\d+)\.(\d+(?:pre)?)") {
  set req.http.ua_family = "Firefox (" + re.group.1 ")";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Firefox)/(\d+)\.(\d+)(a\d+[a-z]*)") {
  set req.http.ua_family = "Firefox Alpha";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Firefox)/(\d+)\.(\d+)(b\d+[a-z]*)") {
  set req.http.ua_family = "Firefox Beta";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Firefox)-(?:\d+\.\d+)?/(\d+)\.(\d+)(a\d+[a-z]*)") {
  set req.http.ua_family = "Firefox Alpha";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Firefox)-(?:\d+\.\d+)?/(\d+)\.(\d+)(b\d+[a-z]*)") {
  set req.http.ua_family = "Firefox Beta";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Namoroka|Shiretoko|Minefield)/(\d+)\.(\d+)([ab]\d+[a-z]*)?") {
  set req.http.ua_family = "Firefox (" + re.group.1 ")";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Firefox).*Tablet browser (\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "MicroB";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(MozillaDeveloperPreview)/(\d+)\.(\d+)([ab]\d+[a-z]*)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(FxiOS)/(\d+)\.(\d+)(\.(\d+))?(\.(\d+))?") {
  set req.http.ua_family = "Firefox iOS";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Flock)/(\d+)\.(\d+)(b\d+?)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(RockMelt)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Navigator)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Netscape";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Navigator)/(\d+)\.(\d+)([ab]\d+)") {
  set req.http.ua_family = "Netscape";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Netscape6)/(\d+)\.(\d+)\.?([ab]?\d+)?") {
  set req.http.ua_family = "Netscape";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(MyIBrow)/(\d+)\.(\d+)") {
  set req.http.ua_family = "My Internet Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(UC? ?Browser|UCWEB|U3)[ /]?(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "UC Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Opera Tablet).*Version/(\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Opera Mini)(?:/att)?/?(\d+)?(?:\.(\d+))?(?:\.(\d+))?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Opera)/.+Opera Mobi.+Version/(\d+)\.(\d+)") {
  set req.http.ua_family = "Opera Mobile";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Opera)/(\d+)\.(\d+).+Opera Mobi") {
  set req.http.ua_family = "Opera Mobile";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "Opera Mobi.+(Opera)(?:/|\s+)(\d+)\.(\d+)") {
  set req.http.ua_family = "Opera Mobile";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "Opera Mobi") {
  set req.http.ua_family = "Opera Mobile";
} else if (req.http.user-agent ~ "(Opera)/9.80.*Version/(\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(?:Mobile Safari).*(OPR)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Opera Mobile";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(?:Chrome).*(OPR)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Opera";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Coast)/(\d+).(\d+).(\d+)") {
  set req.http.ua_family = "Opera Coast";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(OPiOS)/(\d+).(\d+).(\d+)") {
  set req.http.ua_family = "Opera Mini";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "Chrome/.+( MMS)/(\d+).(\d+).(\d+)") {
  set req.http.ua_family = "Opera Neon";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(hpw|web)OS/(\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = "webOS Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(luakit)") {
  set req.http.ua_family = "LuaKit";
} else if (req.http.user-agent ~ "(Snowshoe)/(\d+)\.(\d+).(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "Gecko/\d+ (Lightning)/(\d+)\.(\d+)\.?((?:[ab]?\d+[a-z]*)|(?:\d*))") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Firefox)/(\d+)\.(\d+)\.(\d+(?:pre)?) \(Swiftfox\)") {
  set req.http.ua_family = "Swiftfox";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Firefox)/(\d+)\.(\d+)([ab]\d+[a-z]*)? \(Swiftfox\)") {
  set req.http.ua_family = "Swiftfox";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(rekonq)/(\d+)\.(\d+)\.?(\d+)? Safari") {
  set req.http.ua_family = "Rekonq";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "rekonq") {
  set req.http.ua_family = "Rekonq";
} else if (req.http.user-agent ~ "(conkeror|Conkeror)/(\d+)\.(\d+)\.?(\d+)?") {
  set req.http.ua_family = "Conkeror";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(konqueror)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Konqueror";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(WeTab)-Browser") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "(Comodo_Dragon)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Comodo Dragon";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Symphony) (\d+).(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "PLAYSTATION 3.+WebKit") {
  set req.http.ua_family = "NetFront NX";
} else if (req.http.user-agent ~ "PLAYSTATION 3") {
  set req.http.ua_family = "NetFront";
} else if (req.http.user-agent ~ "(PlayStation Portable)") {
  set req.http.ua_family = "NetFront";
} else if (req.http.user-agent ~ "(PlayStation Vita)") {
  set req.http.ua_family = "NetFront NX";
} else if (req.http.user-agent ~ "AppleWebKit.+ (NX)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "NetFront NX";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Nintendo 3DS)") {
  set req.http.ua_family = "NetFront NX";
} else if (req.http.user-agent ~ "(Silk)/(\d+)\.(\d+)(?:\.([0-9\-]+))?") {
  set req.http.ua_family = "Amazon Silk";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Puffin)/(\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "Windows Phone .*(Edge)/(\d+)\.(\d+)") {
  set req.http.ua_family = "Edge Mobile";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(SamsungBrowser)/(\d+)\.(\d+)") {
  set req.http.ua_family = "Samsung Internet";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(SznProhlizec)/(\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = "Seznam prohl%u00ed%u017ee%u010d";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(coc_coc_browser)/(\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = "Coc Coc";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(baidubrowser)[/\s](\d+)(?:\.(\d+)(?:\.(\d+))?)?") {
  set req.http.ua_family = "Baidu Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(FlyFlow)/(\d+)\.(\d+)") {
  set req.http.ua_family = "Baidu Explorer";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(MxBrowser)/(\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = "Maxthon";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Crosswalk)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "; wv\).+(Chrome)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Chrome Mobile WebView";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(CrMo)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Chrome Mobile";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(CriOS)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Chrome Mobile iOS";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Chrome)/(\d+)\.(\d+)\.(\d+)\.(\d+) Mobile(?:[ /]|$)") {
  set req.http.ua_family = "Chrome Mobile";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ " Mobile .*(Chrome)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Chrome Mobile";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(chromeframe)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Chrome Frame";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(SLP Browser)/(\d+)\.(\d+)") {
  set req.http.ua_family = "Tizen Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(SE 2\.X) MetaSr (\d+)\.(\d+)") {
  set req.http.ua_family = "Sogou Explorer";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(MQQBrowser/Mini)(?:(\d+)(?:\.(\d+)(?:\.(\d+))?)?)?") {
  set req.http.ua_family = "QQ Browser Mini";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(MQQBrowser)(?:/(\d+)(?:\.(\d+)(?:\.(\d+))?)?)?") {
  set req.http.ua_family = "QQ Browser Mobile";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(QQBrowser)(?:/(\d+)(?:\.(\d+)\.(\d+)(?:\.(\d+))?)?)?") {
  set req.http.ua_family = "QQ Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Rackspace Monitoring)/(\d+)\.(\d+)") {
  set req.http.ua_family = "RackspaceBot";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(PyAMF)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(YaBrowser)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Yandex Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Chrome)/(\d+)\.(\d+)\.(\d+).* MRCHROME") {
  set req.http.ua_family = "Mail.ru Chromium Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(AOL) (\d+)\.(\d+); AOLBuild (\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(PodCruncher|Downcast)[ /]?(\d+)\.?(\d+)?\.?(\d+)?\.?(\d+)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ " (BoxNotes)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Slack_SSB)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Slack Desktop Client";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(HipChat)/?(\d+)?") {
  set req.http.ua_family = "HipChat Desktop Client";
  set req.http.ua_major = re.group.2;
} else if (req.http.user-agent ~ "\b(MobileIron|FireWeb|Jasmine|ANTGalio|Midori|Fresco|Lobo|PaleMoon|Maxthon|Lynx|OmniWeb|Dillo|Camino|Demeter|Fluid|Fennec|Epiphany|Shiira|Sunrise|Spotify|Flock|Netscape|Lunascape|WebPilot|NetFront|Netfront|Konqueror|SeaMonkey|Kazehakase|Vienna|Iceape|Iceweasel|IceWeasel|Iron|K-Meleon|Sleipnir|Galeon|GranParadiso|Opera Mini|iCab|NetNewsWire|ThunderBrowse|Iris|UP\.Browser|Bunjalloo|Google Earth|Raven for Mac|Openwave|MacOutlook|Electron|OktaMobile)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "Microsoft Office Outlook 12\.\d+\.\d+|MSOffice 12") {
  set req.http.ua_family = "Outlook";
  set req.http.ua_major = "2007";
} else if (req.http.user-agent ~ "Microsoft Outlook 14\.\d+\.\d+|MSOffice 14") {
  set req.http.ua_family = "Outlook";
  set req.http.ua_major = "2010";
} else if (req.http.user-agent ~ "Microsoft Outlook 15\.\d+\.\d+") {
  set req.http.ua_family = "Outlook";
  set req.http.ua_major = "2013";
} else if (req.http.user-agent ~ "Microsoft Outlook (?:Mail )?16\.\d+\.\d+") {
  set req.http.ua_family = "Outlook";
  set req.http.ua_major = "2016";
} else if (req.http.user-agent ~ "Outlook-Express\/7\.0.*") {
  set req.http.ua_family = "Windows Live Mail";
} else if (req.http.user-agent ~ "(Airmail) (\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Thunderbird)/(\d+)\.(\d+)(?:\.(\d+(?:pre)?))?") {
  set req.http.ua_family = "Thunderbird";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Postbox)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Postbox";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Barca(?:Pro)?)/(\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = "Barca";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Lotus-Notes)/(\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = "Lotus Notes";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Vivaldi)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Edge)/(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(brave)/(\d+)\.(\d+)\.(\d+) Chrome") {
  set req.http.ua_family = "Brave";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Chrome)/(\d+)\.(\d+)\.(\d+)[\d.]* Iron[^/]") {
  set req.http.ua_family = "Iron";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "\b(Dolphin)(?: |HDCN/|/INT\-)(\d+)\.(\d+)\.?(\d+)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(HeadlessChrome)(?:/(\d+)\.(\d+)\.(\d+))?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Evolution)/(\d+)\.(\d+)\.(\d+\.\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(RCM CardDAV plugin)/(\d+)\.(\d+)\.(\d+(?:-dev)?)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(bingbot|Bolt|AdobeAIR|Jasmine|IceCat|Skyfire|Midori|Maxthon|Lynx|Arora|IBrowse|Dillo|Camino|Shiira|Fennec|Phoenix|Flock|Netscape|Lunascape|Epiphany|WebPilot|Opera Mini|Opera|NetFront|Netfront|Konqueror|Googlebot|SeaMonkey|Kazehakase|Vienna|Iceape|Iceweasel|IceWeasel|Iron|K-Meleon|Sleipnir|Galeon|GranParadiso|iCab|iTunes|MacAppStore|NetNewsWire|Space Bison|Stainless|Orca|Dolfin|BOLT|Minimo|Tizen Browser|Polaris|Abrowser|Planetweb|ICE Browser|mDolphin|qutebrowser|Otter|QupZilla|MailBar|kmail2|YahooMobileMail|ExchangeWebServices|ExchangeServicesClient|Dragon|Outlook-iOS-Android)/(\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Chromium|Chrome)/(\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(IEMobile)[ /](\d+)\.(\d+)") {
  set req.http.ua_family = "IE Mobile";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(BacaBerita App)\/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(bPod|Pocket Casts|Player FM)$") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "^(AlexaMediaPlayer|VLC)/(\d+)\.(\d+)\.([^.\s]+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(AntennaPod|WMPlayer|Zune|Podkicker|Radio|ExoPlayerDemo|Overcast|PocketTunes|NSPlayer|okhttp|DoggCatcher|QuickNews|QuickTime|Peapod|Podcasts|GoldenPod|VLC|Spotify|Miro|MediaGo|Juice|iPodder|gPodder|Banshee)/(\d+)\.(\d+)\.?(\d+)?\.?(\d+)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(Peapod|Liferea)/([^.\s]+)\.([^.\s]+)?\.?([^.\s]+)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(bPod|Player FM) BMID/(\S+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
} else if (req.http.user-agent ~ "^(Podcast ?Addict)/v(\d+) ") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
} else if (req.http.user-agent ~ "^(Podcast ?Addict) ") {
  set req.http.ua_family = "PodcastAddict";
} else if (req.http.user-agent ~ "(Replay) AV") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "(VOX) Music Player") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "(CITA) RSS Aggregator/(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Pocket Casts)$") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "(Player FM)$") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "(LG Player|Doppler|FancyMusic|MediaMonkey|Clementine) (\d+)\.(\d+)\.?([^.\s]+)?\.?([^.\s]+)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(philpodder)/(\d+)\.(\d+)\.?([^.\s]+)?\.?([^.\s]+)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Player FM|Pocket Casts|DoggCatcher|Spotify|MediaMonkey|MediaGo|BashPodder)") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "(QuickTime)\.(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Kinoma)(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
} else if (req.http.user-agent ~ "(Fancy) Cloud Music (\d+)\.(\d+)") {
  set req.http.ua_family = "FancyMusic";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "EspnDownloadManager") {
  set req.http.ua_family = "ESPN";
} else if (req.http.user-agent ~ "(ESPN) Radio (\d+)\.(\d+)\.?(\d+)? ?(?:rv:(\d+))? ") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(podracer|jPodder) v ?(\d+)\.(\d+)\.?(\d+)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(ZDM)/(\d+)\.(\d+)[; ]?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Zune|BeyondPod) (\d+)\.?(\d+)?[\);]") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(WMPlayer)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(Lavf)") {
  set req.http.ua_family = "WMPlayer";
} else if (req.http.user-agent ~ "^(RSSRadio)[ /]?(\d+)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
} else if (req.http.user-agent ~ "(RSS_Radio) (\d+)\.(\d+)") {
  set req.http.ua_family = "RSSRadio";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Podkicker) \S+/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Podkicker";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(HTC) Streaming Player \S+ / \S+ / \S+ / (\d+)\.(\d+)\.?(\d+)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(Stitcher)/iOS") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "^(Stitcher)/Android") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "^(VLC) .*version (\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ " (VLC) for") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "(vlc)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "VLC";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(foobar)\S+/([^.\s]+)\.([^.\s]+)?\.?([^.\s]+)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(Clementine)\S+ ([^.\s]+)\.([^.\s]+)?\.?([^.\s]+)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(amarok)/([^.\s]+)\.([^.\s]+)?\.?([^.\s]+)?") {
  set req.http.ua_family = "Amarok";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Custom)-Feed Reader") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "(iRider|Crazy Browser|SkipStone|iCab|Lunascape|Sleipnir|Maemo Browser) (\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(iCab|Lunascape|Opera|Android|Jasmine|Polaris|Microsoft SkyDriveSync|The Bat!) (\d+)\.(\d+)\.?(\d+)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Kindle)/(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Android) Donut") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = "1";
  set req.http.ua_minor= "2";
} else if (req.http.user-agent ~ "(Android) Eclair") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = "2";
  set req.http.ua_minor= "1";
} else if (req.http.user-agent ~ "(Android) Froyo") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = "2";
  set req.http.ua_minor= "2";
} else if (req.http.user-agent ~ "(Android) Gingerbread") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = "2";
  set req.http.ua_minor= "3";
} else if (req.http.user-agent ~ "(Android) Honeycomb") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = "3";
} else if (req.http.user-agent ~ "(MSIE) (\d+)\.(\d+).*XBLWP7") {
  set req.http.ua_family = "IE Large Screen";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Nextcloud)") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "(mirall)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(ownCloud-android)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Owncloud";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Obigo)InternetBrowser") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "(Obigo)\-Browser") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "(Obigo|OBIGO)[^\d]*(\d+)(?:.(\d+))?") {
  set req.http.ua_family = "Obigo";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(MAXTHON|Maxthon) (\d+)\.(\d+)") {
  set req.http.ua_family = "Maxthon";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Maxthon|MyIE2|Uzbl|Shiira)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = "0";
} else if (req.http.user-agent ~ "(BrowseX) \((\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(NCSA_Mosaic)/(\d+)\.(\d+)") {
  set req.http.ua_family = "NCSA Mosaic";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(POLARIS)/(\d+)\.(\d+)") {
  set req.http.ua_family = "Polaris";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Embider)/(\d+)\.(\d+)") {
  set req.http.ua_family = "Polaris";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(BonEcho)/(\d+)\.(\d+)\.?([ab]?\d+)?") {
  set req.http.ua_family = "Bon Echo";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(iPod|iPhone|iPad).+Version/(\d+)\.(\d+)(?:\.(\d+))?.*[ +]Safari") {
  set req.http.ua_family = "Mobile Safari";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(iPod|iPod touch|iPhone|iPad);.*CPU.*OS[ +](\d+)_(\d+)(?:_(\d+))?.* AppleNews\/\d+\.\d+\.\d+?") {
  set req.http.ua_family = "Mobile Safari UI/WKWebView";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(iPod|iPhone|iPad).+Version/(\d+)\.(\d+)(?:\.(\d+))?") {
  set req.http.ua_family = "Mobile Safari UI/WKWebView";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(iPod|iPod touch|iPhone|iPad);.*CPU.*OS[ +](\d+)_(\d+)(?:_(\d+))?.*Mobile.*[ +]Safari") {
  set req.http.ua_family = "Mobile Safari";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(iPod|iPod touch|iPhone|iPad);.*CPU.*OS[ +](\d+)_(\d+)(?:_(\d+))?.*Mobile") {
  set req.http.ua_family = "Mobile Safari UI/WKWebView";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(iPod|iPhone|iPad).* Safari") {
  set req.http.ua_family = "Mobile Safari";
} else if (req.http.user-agent ~ "(iPod|iPhone|iPad)") {
  set req.http.ua_family = "Mobile Safari UI/WKWebView";
} else if (req.http.user-agent ~ "(Outlook-iOS)/\d+\.\d+\.prod\.iphone \((\d+)\.(\d+)\.(\d+)\)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(AvantGo) (\d+).(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(OneBrowser)/(\d+).(\d+)") {
  set req.http.ua_family = "ONE Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Avant)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = "1";
} else if (req.http.user-agent ~ "(QtCarBrowser)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = "1";
} else if (req.http.user-agent ~ "^(iBrowser/Mini)(\d+).(\d+)") {
  set req.http.ua_family = "iBrowser Mini";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "^(iBrowser|iRAPP)/(\d+).(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "^(Nokia)") {
  set req.http.ua_family = "Nokia Services (WAP) Browser";
} else if (req.http.user-agent ~ "(NokiaBrowser)/(\d+)\.(\d+).(\d+)\.(\d+)") {
  set req.http.ua_family = "Nokia Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(NokiaBrowser)/(\d+)\.(\d+).(\d+)") {
  set req.http.ua_family = "Nokia Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(NokiaBrowser)/(\d+)\.(\d+)") {
  set req.http.ua_family = "Nokia Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(BrowserNG)/(\d+)\.(\d+).(\d+)") {
  set req.http.ua_family = "Nokia Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Series60)/5\.0") {
  set req.http.ua_family = "Nokia Browser";
  set req.http.ua_major = "7";
  set req.http.ua_minor= "0";
} else if (req.http.user-agent ~ "(Series60)/(\d+)\.(\d+)") {
  set req.http.ua_family = "Nokia OSS Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(S40OviBrowser)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Ovi Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Nokia)[EN]?(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
} else if (req.http.user-agent ~ "(PlayBook).+RIM Tablet OS (\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "BlackBerry WebKit";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Black[bB]erry|BB10).+Version/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "BlackBerry WebKit";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Black[bB]erry)\s?(\d+)") {
  set req.http.ua_family = "BlackBerry";
  set req.http.ua_major = re.group.2;
} else if (req.http.user-agent ~ "(OmniWeb)/v(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Blazer)/(\d+)\.(\d+)") {
  set req.http.ua_family = "Palm Blazer";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Pre)/(\d+)\.(\d+)") {
  set req.http.ua_family = "Palm Pre";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(ELinks)/(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(ELinks) \((\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Links) \((\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(QtWeb) Internet Browser/(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(PhantomJS)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(AppleWebKit)/(\d+)\.?(\d+)?\+ .* Safari") {
  set req.http.ua_family = "WebKit Nightly";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Version)/(\d+)\.(\d+)(?:\.(\d+))?.*Safari/") {
  set req.http.ua_family = "Safari";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Safari)/\d+") {
  set req.http.ua_family = re.group.1;
} else if (req.http.user-agent ~ "(OLPC)/Update(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(OLPC)/Update()\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = "0";
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(SEMC\-Browser)/(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Teleca)") {
  set req.http.ua_family = "Teleca Browser";
} else if (req.http.user-agent ~ "(Phantom)/V(\d+)\.(\d+)") {
  set req.http.ua_family = "Phantom Browser";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Trident)/(7|8)\.(0)") {
  set req.http.ua_family = "IE";
  set req.http.ua_major = "11";
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Trident)/(6)\.(0)") {
  set req.http.ua_family = "IE";
  set req.http.ua_major = "10";
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Trident)/(5)\.(0)") {
  set req.http.ua_family = "IE";
  set req.http.ua_major = "9";
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Trident)/(4)\.(0)") {
  set req.http.ua_family = "IE";
  set req.http.ua_major = "8";
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Espial)/(\d+)(?:\.(\d+))?(?:\.(\d+))?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(AppleWebKit)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Apple Mail";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Firefox)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Firefox)/(\d+)\.(\d+)(pre|[ab]\d+[a-z]*)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "([MS]?IE) (\d+)\.(\d+)") {
  set req.http.ua_family = "IE";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(python-requests)/(\d+)\.(\d+)") {
  set req.http.ua_family = "Python Requests";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "\b(Windows-Update-Agent|Microsoft-CryptoAPI|SophosUpdateManager|SophosAgent|Debian APT-HTTP|Ubuntu APT-HTTP|libcurl-agent|libwww-perl|urlgrabber|curl|PycURL|Wget|aria2|Axel|OpenBSD ftp|lftp|jupdate)(?:[ /](\d+)(?:\.(\d+)(?:\.(\d+))?)?)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "(Java)[/ ]{0,1}\d+\.(\d+)\.(\d+)[_-]*([a-zA-Z0-9]+)*") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(Cyberduck)/(\d+)\.(\d+)\.(\d+)(?:\.\d+)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(S3 Browser) (\d+)-(\d+)-(\d+)(?:\s*http://s3browser\.com)?") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(rclone)/v(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "^(Roku)/DVP-(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
} else if (req.http.user-agent ~ "(Kurio)\/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = "Kurio App";
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else if (req.http.user-agent ~ "^(Box(?: Sync)?)/(\d+)\.(\d+)\.(\d+)") {
  set req.http.ua_family = re.group.1;
  set req.http.ua_major = re.group.2;
  set req.http.ua_minor = re.group.3;
  set req.http.ua_patch = re.group.4;
} else {
  set req.http.ua_family = "Other";
}
if (!req.http.ua_major) {
  set req.http.ua_major = "null";
}
if (!req.http.ua_minor) {
  set req.http.ua_minor = "null";
}
if (!req.http.ua_patch) {
  set req.http.ua_patch = "null";
}

