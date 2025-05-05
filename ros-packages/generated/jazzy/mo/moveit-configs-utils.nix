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
  version = "2.12.3-1";
  src = finalAttrs.passthru.sources."moveit_configs_utils";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  propagatedBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_configs_utils" = substituteSource {
      src = fetchgit {
        name = "moveit_configs_utils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "8f60f9ab36f879ff2ebd828d0599dfd48f700e95";
        hash = "sha256-HQfYdBWKftxw5HxReNZLFUmST8odKo/5w+YDC1FBN6g=";
      };
    };
  });
  meta = {
    description = "Python library for loading moveit config parameters in launch files";
  };
})
