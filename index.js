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

/**
 * Converts non-ASCII characters into their equivalent unicode escape sequence.
 * @param {String} str The string that you want to convert into ASCII and unicode escape sequences
 * @returns {String}
 */
function escapeNonAsciiCharacters(str) {
  return str
    .split('')
    .map(c => {
      if (c.charCodeAt(0) > 127) {
        return (
          '%u' +
          c
            .charCodeAt(0)
            .toString(16)
            .toUpperCase()
            .padStart(4, 0)
        );
      } else {
        return c;
      }
    })
    .join('');
}

let vcl = '# uap-vcl\n';
for (let i = 0; i < regexes.user_agent_parsers.length; i++) {
  const part = regexes.user_agent_parsers[i];
  if (i === 0) {
    vcl += `if `;
  } else {
    vcl += `} else if `;
  }
  vcl += `(req.http.user-agent ~ "${part.regex.replace('%', '%25')}") {\n`;
  if (part.family_replacement) {
    const m = part.family_replacement.match(/^(.*)\$1(.*)/);
    if (m) {
      vcl += `  set req.http.ua_family = "${m[1]}" + re.group.1 "${m[2]}";\n`;
    } else {
      vcl += `  set req.http.ua_family = "${escapeNonAsciiCharacters(
        part.family_replacement
      )}";\n`;
    }
  } else {
    vcl += `  set req.http.ua_family = re.group.1;\n`;
  }
  if (part.v1_replacement) {
    vcl += `  set req.http.ua_major = "${escapeNonAsciiCharacters(
      part.v1_replacement
    )}";\n`;
  } else {
    vcl += `  set req.http.ua_major = re.group.2;\n`;
  }
  if (part.v2_replacement) {
    vcl += `  set req.http.ua_minor= "${escapeNonAsciiCharacters(
      part.v2_replacement
    )}";\n`;
  } else {
    vcl += `  set req.http.ua_minor = re.group.3;\n`;
  }
  if (part.v3_replacement) {
    vcl += `  set req.http.ua_patch = "${escapeNonAsciiCharacters(
      part.v3_replacement
    )}";\n`;
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
