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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_configs_utils";
  propagatedBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_configs_utils" = substituteSource {
      src = fetchgit {
        name = "moveit_configs_utils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "437dfe9b924e24cbf9aa8a2ad6f2bc48f7d735b2";
        hash = "sha256-Jy/i4PAdRJ3i+ljnu4dR7DPz+48obs2/yr4mpZMESJo=";
      };
    };
  });
  meta = {
    description = "Python library for loading moveit config parameters in launch files";
  };
})
