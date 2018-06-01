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

try {
  const doc = yaml.safeLoad(
    fs.readFileSync(require.resolve('uap-core/tests/test_ua.yaml'), 'utf8')
  );
  doc['test_cases'].forEach(test => {
    it(`receives a response for ${test.user_agent_string} to be ${
      test.family
    } / ${test.major}`, () =>
      chai
        .request(uri)
        .get('/')
        .set('User-Agent', test.user_agent_string)
        .then(res => {
          //console.log(res.text);
          expect(res).to.have.status(200);
          expect(res).to.be.html;
          expect(res.text).to.include('ua-parser in VCL');
          expect(res.text).to.include(
            `<th>ua_family</th><td>${test.family}</td>`
          );
          expect(res.text).to.include(
            `<th>ua_major</th><td>${test.major}</td>`
          );
          expect(res.text).to.include(
            `<th>ua_minor</th><td>${test.minor}</td>`
          );
          expect(res.text).to.include(
            `<th>ua_patch</th><td>${test.patch}</td>`
          );
        })).timeout(5000);
  });
} catch (e) {
  console.error(e);
}
