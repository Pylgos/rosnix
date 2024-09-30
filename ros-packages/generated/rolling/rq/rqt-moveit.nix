{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rclpy,
  rosSystemPackages,
  rosidl-default-generators,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  rqt-topic,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rqt_moveit" = substituteSource {
      src = fetchgit {
        name = "rqt_moveit-source";
        url = "https://github.com/ros2-gbp/rqt_moveit-release.git";
        rev = "77d26a0f8c1dbfb5f7e482933936a95ff0173b5d";
        hash = "sha256-A4bGoHfpokKaYjSrBzvtYgzyf6sJGECfPJCIM0iZgYU=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rqt_moveit";
  version = "1.0.1-4";
  src = sources."rqt_moveit";
  nativeBuildInputs = [ rosidl-default-generators wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ python-qt-binding rclpy rqt-gui rqt-gui-py rqt-py-common rqt-topic sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "An rqt-based tool that assists monitoring tasks for";
  };
}
