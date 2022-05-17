# Redact PII from URL
With this variable template for Google Tag Manager Server-Container you can redact PII (Personally Identifiable Information) in the URL. Goal is to avoid sending PII to Google Analytics and other vendors when collecting analytics data, in order to protect user privacy.

## How it works
When you activate the setting "Get URL from Event Data", then the variable will take the page_location field and check it against common PII pattern. If you want to provide a custom event data field then leave the setting "Get URL from Event Data" unchecked. As a result you will see another variable setting called "Get custom Page URL value." where you can provide your own variable to redact PII.

The variable checks the URL for following pattern and returns "[Redacted]" if one of the pattern is found within the URL:

- tel=
- telephone=
- phone=
- mobile=
- mob=
- firstname=
- lastname=
- username=
- surname=
- name=
- user=
- password=
- passwd=
- pass=
- zipcode=
- latitude=
- lat=
- longitude=
- long=
- lng=
- @

## Editing history

- 2022/05/17: Initial release.
