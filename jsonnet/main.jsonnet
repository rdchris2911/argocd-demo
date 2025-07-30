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

local swaggerEditorDeployment = {
  'apiVersion': 'apps/v1',
  'kind': 'Deployment',
  'metadata': {
    'name': 'swagger-editor',
    'labels': {
      'app.kubernetes.io/name': 'swagger-editor',
    },
  },
  'spec': {
    'replicas': 1,
    'selector': {
      'matchLabels': {
        'app.kubernetes.io/name': 'swagger-editor',
      },
    },
    'template': {
      'metadata': {
        'labels': {
          'app.kubernetes.io/name': 'swagger-editor',
        },
      },
      'spec': {
        'containers': [
          {
            'name': 'swagger-editor',
            'image': 'docker.swagger.io/swaggerapi/swagger-editor@sha256:de2f59f66185952c5a41ea64fac5e6269cd1ce443b9301dcde49dacd131df510',
            'ports': [
              {
                'containerPort': 8080,
              },
            ],
          },
        ],
      },
    },
  },
};

function() {
  'apiVersion': 'v1',
  'kind': 'List',
  'items': [
    appConfig,
    swaggerEditorDeployment,
  ],
}
