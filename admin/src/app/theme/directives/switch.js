(function() {
  'use strict';

  angular.module('Admin.theme')
    .directive('switch', switchDirective);

  function switchDirective($timeout) {
    return {
      restrict: 'EA',
      replace: true,
      scope: {
        ngModel: '=',
        ngData: '='
      },
      template: function(el, attrs) {
        return '<div class="switch-container ' + (attrs.color || '') + '"><input type="checkbox" ng-model="ngModel"></div>';
      },
      link: function(scope, elem, attr) {
        $timeout(function() {
          var input = $(elem).find('input');
          input.bootstrapSwitch({
            size: 'small',
            onColor: attr.color,
            labelText: scope.ngData
          });
          input.on('switchChange.bootstrapSwitch', function(event, state) {
            scope.ngModel = state;
            scope.$apply();
          });

        });
      }
    };
  }
})();