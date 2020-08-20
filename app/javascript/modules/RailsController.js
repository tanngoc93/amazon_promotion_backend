export function controllerPath() {
  return $("body").data("controllerPath");
}

export function actionName() {
  return $("body").data("actionName");
}

export function wrongControlAndAction(controller, action) {
  if (controllerPath() !== controller || actionName() !== action) {
    return true;
  }

  return false;
}
