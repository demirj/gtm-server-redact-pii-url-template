___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Redact PII from URL",
  "description": "Removes PII data from URL based on typical PII pattern.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "CHECKBOX",
    "name": "allow_event_data",
    "checkboxText": "Get URL from Event Data",
    "simpleValueType": true,
    "help": "Get the page_location value from the Event Data."
  },
  {
    "type": "GROUP",
    "name": "custom_options",
    "displayName": "Get custom Page URL value.",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "SELECT",
        "name": "url_value",
        "displayName": "",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "help": "Provide URL value to be redacted."
      }
    ],
    "enablingConditions": [
      {
        "paramName": "allow_event_data",
        "paramValue": true,
        "type": "NOT_EQUALS"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

// Load required APIs
const getEventData = require('getEventData');
const queryPermission = require('queryPermission');

// Variable setup
const pageLocation = 'page_location';
var inputUrl = data.url_value ? data.url_value : getEventData(pageLocation);

// Logic to redact PII from URL
if(queryPermission('read_event_data', pageLocation)){
  
  if (inputUrl.indexOf('tel=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('telephone=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('phone=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('mobile=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('mob=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('firstname=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('lastname=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('username=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('surname=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('name=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('user=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('password=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('passwd=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('pass=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('zipcode=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('latitude=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('lat=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('longitude=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('long=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('lng=') >= 0) inputUrl = '[Redacted]';
  if (inputUrl.indexOf('@') >= 0) inputUrl = '[Redacted]';
    
  return inputUrl;
  
}


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "page_location"
              }
            ]
          }
        },
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 17.5.2022, 14:24:01
