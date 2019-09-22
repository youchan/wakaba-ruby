function doGet(e) {
  var translatedText = LanguageApp.translate(e.parameter.q, 'en', 'ja');
  var output = ContentService.createTextOutput();
  output.setMimeType(ContentService.MimeType.JSON);
  output.setContent(JSON.stringify({body: translatedText}));
  return output;
}

