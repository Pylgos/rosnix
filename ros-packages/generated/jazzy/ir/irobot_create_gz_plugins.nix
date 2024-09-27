{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_gui_vendor,
  mkSourceSet,
  rosSystemPackages,
  ros_gz,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "irobot_create_gz_plugins" = substituteSource {
      src = fetchgit {
        name = "irobot_create_gz_plugins-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "7c8996dfb742fd0c0abca43f5a3676b6e9b8482d";
        hash = "sha256-/XHjWowA0gP5cmUkNAlTU9fqAU+5QfiJvT+IDY+I7o8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "irobot_create_gz_plugins";
  version = "3.0.2-2";
  src = sources."irobot_create_gz_plugins";
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_gui_vendor ros_gz ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_lint_cmake ament_cmake_pep257 ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Ignition plugins for simulated iRobot(R) Create(R) 3 Educational Robot.";
  };
}
