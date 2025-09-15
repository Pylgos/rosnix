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
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."moveit_configs_utils";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  propagatedBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_configs_utils" = substituteSource {
      src = fetchgit {
        name = "moveit_configs_utils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "1fdb9f53b562219149f5e437f5570346bc1a80b6";
        hash = "sha256-vG0XebI8TscnDhOievfMKH+epFwA5XGXUFKT5phKgFs=";
      };
    };
  });
  meta = {
    description = "Python library for loading moveit config parameters in launch files";
  };
})
