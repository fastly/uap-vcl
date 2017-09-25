const yaml = require('js-yaml');
const fs = require('fs');

// Get document, or throw exception on error
let regexes;
try {
  regexes = yaml.safeLoad(fs.readFileSync('regexes.yaml', 'utf8'));
} catch (e) {
  console.log(e);
}

let vcl = '# uap-vcl\n';
for (let i = 0; i < regexes.user_agent_parsers.length; i++) {
  const part = regexes.user_agent_parsers[i];
  if (i === 0) {
    vcl += `if `;
  } else {
    vcl += `} else if `;
  }
  vcl += `(req.http.user-agent ~ "${part.regex}") {\n`;
  if (part.family_replacement) {
    const m = part.family_replacement.match(/^(.*)\$1(.*)/);
    if (m) {
      vcl += `  set req.http.ua_family = "${m[1]}" + re.group.1 "${m[2]}";\n`;
    } else {
      vcl += `  set req.http.ua_family = "${part.family_replacement}";\n`;
    }
  } else {
    vcl += `  set req.http.ua_family = re.group.1;\n`;
  }
  if (part.v1_replacement) {
    vcl += `  set req.http.ua_major = "${part.v1_replacement}";\n`;
  } else {
    vcl += `  set req.http.ua_major = re.group.2;\n`;
  }
  if (part.v2_replacement) {
    vcl += `  set req.http.ua_minor= "${part.v2_replacement}";\n`;
  } else {
    vcl += `  set req.http.ua_minor = re.group.3;\n`;
  }
  if (part.v3_replacement) {
    vcl += `  set req.http.ua_patch = "${part.v3_replacement}";\n`;
  } else {
    vcl += `  set req.http.ua_patch = re.group.4;\n`;
  }
}

vcl += `} else {
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
}\n`;
console.log(vcl);