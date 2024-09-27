{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtle_nest-c72ef68cf0a0269dbe9a93fc49b4d2bbd44ce78c = substituteSource {
      src = fetchgit {
        name = "turtle_nest-c72ef68cf0a0269dbe9a93fc49b4d2bbd44ce78c-source";
        url = "https://github.com/ros2-gbp/turtle_nest-release.git";
        rev = "c72ef68cf0a0269dbe9a93fc49b4d2bbd44ce78c";
        hash = "sha256-ZOCujpxbSs8G7iK430a6Q5AzSeAzQ5Dh2CfDIZ1XlAY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtle_nest";
  version = "1.0.2-1";
  src = sources.turtle_nest-c72ef68cf0a0269dbe9a93fc49b4d2bbd44ce78c;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS 2 Package Creator";
  };
}
