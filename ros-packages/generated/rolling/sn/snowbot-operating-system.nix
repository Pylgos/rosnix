{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  rviz-common,
  rviz-rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "snowbot_operating_system" = substituteSource {
      src = fetchgit {
        name = "snowbot_operating_system-source";
        url = "https://github.com/ros2-gbp/snowbot_release.git";
        rev = "cc969e3a6ae8b55e35a55cc08be7045d805c037a";
        hash = "sha256-jsc6W+E4XVtTLGd+ZSn45ChfZmV6/c9nUg1FpqA6d8s=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "snowbot_operating_system";
  version = "0.1.2-4";
  src = sources."snowbot_operating_system";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs pluginlib rviz-common rviz-rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-clang-format ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The weather outside is frightful";
  };
}
