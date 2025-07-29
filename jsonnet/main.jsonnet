local appConfigApplicationProperties = |||
  color.good=purple
  color.bad=yellow
  allow.textmode=true
|||;

local appConfig = {
  'apiVersion': 'v1',
  'kind': 'ConfigMap',
  'metadata': {
    'name': 'app-config',
  },
  'data': {
    'application.properties': appConfigApplicationProperties,
  },
};

function() {
  'apiVersion': 'v1',
  'kind': 'List',
  'items': [
    appConfig,
  ],
}
