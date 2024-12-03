{
  ament-index-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-param-builder,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  srdfdom,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "moveit_configs_utils";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit_configs_utils";
  propagatedBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_configs_utils" = substituteSource {
      src = fetchgit {
        name = "moveit_configs_utils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "15f4795b2bcbc2fcfd48ea276ad478301cd176de";
        hash = "sha256-3mPVZAu4cfPHrtEcxq+jShmlB0hvmr0XNls07aorKSM=";
      };
    };
  });
  meta = {
    description = "Python library for loading moveit config parameters in launch files";
  };
})
