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
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."moveit_configs_utils";
  propagatedBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_configs_utils" = substituteSource {
      src = fetchgit {
        name = "moveit_configs_utils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "da4d746e7b45afb3ddbcdc974c3be5c4c3202433";
        hash = "sha256-bFO6kuo0OkGbBu8Agn1SSqgabMA7bwjBfvqLG11/D8U=";
      };
    };
  });
  meta = {
    description = "Python library for loading moveit config parameters in launch files";
  };
})
