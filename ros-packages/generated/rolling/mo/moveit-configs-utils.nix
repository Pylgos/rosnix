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
  version = "2.14.0-1";
  src = finalAttrs.passthru.sources."moveit_configs_utils";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  propagatedBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_configs_utils" = substituteSource {
      src = fetchgit {
        name = "moveit_configs_utils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "c024c9c9f5b3ff64b5b0e2a1cceaa519b32f353d";
        hash = "sha256-QDPMKjC97ERRYLjvE+S9LTdBPakXkDm3S2ijgA8Id94=";
      };
    };
  });
  meta = {
    description = "Python library for loading moveit config parameters in launch files";
  };
})
