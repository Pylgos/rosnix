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
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit_configs_utils";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  propagatedBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_configs_utils" = substituteSource {
      src = fetchgit {
        name = "moveit_configs_utils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "a468f637389b1c0aeeb9a4712abc140013a8a1a2";
        hash = "sha256-Aay28Lvyi/0HbZWrSIaQt47aHNauaCTLwLhZzEbZPXQ=";
      };
    };
  });
  meta = {
    description = "Python library for loading moveit config parameters in launch files";
  };
})
