const chai = require('chai');
const chaiHttp = require('chai-http');
const expect = require('chai').expect;
const fs = require('fs');
const yaml = require('js-yaml');
chai.use(chaiHttp);

const uri = process.env.URI || 'https://uap-vcl.freetls.fastly.net';

it('receives an HTML response from /', () =>
  chai
    .request(uri)
    .get('/')
    .then(res => {
      expect(res).to.have.status(200);
      expect(res).to.be.html;
      expect(res.text).to.include('ua-parser in VCL');
    }));

const filenames = [
  'uap-core/test_resources/firefox_user_agent_strings.yaml',
  'uap-core/test_resources/opera_mini_user_agent_strings.yaml',
  'uap-core/test_resources/pgts_browser_list.yaml',
  'uap-core/test_resources/podcasting_user_agent_strings.yaml',
  'uap-core/tests/test_ua.yaml'
];

try {
  filenames.forEach(filename => {
    const doc = yaml.safeLoad(
      fs.readFileSync(require.resolve(filename), 'utf8')
    );
    doc['test_cases'].forEach(test => {
      it(`receives a response for ${test.user_agent_string} to be ${
        test.family
      } / ${test.major}`, () =>
        chai
          .request(uri)
          .get('/')
          .set('accept', 'application/json')
          .set('user-agent', test.user_agent_string)
          .then(res => {
            // console.log('text is', res.text);
            // console.log('json is', res.body);
            expect(res).to.have.status(200);
            expect(res).to.be.json;
            expect(res.body.ua_family).to.equal(test.family);
            expect(res.body.ua_major).to.equal(test.major);
            expect(res.body.ua_minor).to.equal(test.minor);
            expect(res.body.ua_patch).to.equal(test.patch);
          })).timeout(5000);
    });
  });
} catch (e) {
  console.error(e);
}
