const yaml = require('js-yaml');
const fs = require('fs');

// Get document, or throw exception on error
let regexes;
try {
  regexes = yaml.safeLoad(
    fs.readFileSync(require.resolve('uap-core/regexes.yaml'), 'utf8')
  );
} catch (e) {
  console.error(e);
}

function escapeUnicode(str) {
  return str.replace(/\S/g, c => {
    return c.charCodeAt(0) > 127
      ? `%u${('0000' + c.charCodeAt().toString(16)).slice(-4)}`
      : c;
  });
}

let vcl = '# uap-vcl\n';
vcl += `
unset req.http.ua_family;
unset req.http.ua_major;
unset req.http.ua_minor;
unset req.http.ua_patch;
`;
for (let i = 0; i < regexes.user_agent_parsers.length; i++) {
  const part = regexes.user_agent_parsers[i];
  if (i === 0) {
    vcl += `if `;
  } else {
    vcl += `} else if `;
  }
  const groups = new RegExp(part.regex.toString() + '|').exec('').length - 1;
  vcl += `(req.http.user-agent ~ "${part.regex.replace('%', '%25')}") {\n`;
  if (part.family_replacement) {
    const m = part.family_replacement.match(/^(.*)\$1(.*)/);
    if (m) {
      vcl += `  set req.http.ua_family = "${m[1]}" + re.group.1 "${m[2]}";\n`;
    } else {
      vcl += `  set req.http.ua_family = "${escapeUnicode(
        part.family_replacement
      )}";\n`;
    }
  } else {
    vcl += `  set req.http.ua_family = re.group.1;\n`;
  }
  if (part.v1_replacement) {
    vcl += `  set req.http.ua_major = "${escapeUnicode(
      part.v1_replacement
    )}";\n`;
  } else if (groups >= 2) {
    vcl += `  set req.http.ua_major = re.group.2;\n`;
  }
  if (part.v2_replacement) {
    vcl += `  set req.http.ua_minor= "${escapeUnicode(
      part.v2_replacement
    )}";\n`;
  } else if (groups >= 3) {
    vcl += `  set req.http.ua_minor = re.group.3;\n`;
  }
  if (part.v3_replacement) {
    vcl += `  set req.http.ua_patch = "${escapeUnicode(
      part.v3_replacement
    )}";\n`;
  } else if (groups >= 4) {
    vcl += `  set req.http.ua_patch = re.group.4;\n`;
  }
}

vcl += `} else {
  set req.http.ua_family = "Other";
}
if (req.http.ua_major == "") {
  unset req.http.ua_major;
}
if (req.http.ua_minor == "") {
  unset req.http.ua_minor;
}
if (req.http.ua_patch == "") {
  unset req.http.ua_patch;
}\n`;
console.log(vcl);
