{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "ros_image_to_qimage" = substituteSource {
      src = fetchgit {
        name = "ros_image_to_qimage-source";
        url = "https://github.com/ros2-gbp/ros_image_to_qimage-release.git";
        rev = "5f468c90083c075edb30b8ec93f78561c542cd1a";
        hash = "sha256-qxt94vxyKVhWR64DyvjU5D5xKcJcflZdDd/jA2e0d9U=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ros_image_to_qimage";
  version = "0.4.1-3";
  src = sources."ros_image_to_qimage";
  nativeBuildInputs = [ ament-cmake ament-cmake-pytest ament-cmake-python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge python-qt-binding sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package that converts a ros image msg to a qimage object";
  };
}
