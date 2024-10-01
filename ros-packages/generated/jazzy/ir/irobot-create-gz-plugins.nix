{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-gui-vendor,
  mkSourceSet,
  ros-gz,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "irobot_create_gz_plugins" = substituteSource {
      src = fetchgit {
        name = "irobot_create_gz_plugins-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "f9bbd3646b138106e0ab2cae623fe87d6e35a22c";
        hash = "sha256-9K7OGvwBvi/5V5TORIrO8ewJQHDvM/sneSUnW9aGg9A=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "irobot_create_gz_plugins";
  version = "3.0.3-1";
  src = sources."irobot_create_gz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz-gui-vendor ros-gz ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Ignition plugins for simulated iRobot(R) Create(R) 3 Educational Robot.";
  };
}
