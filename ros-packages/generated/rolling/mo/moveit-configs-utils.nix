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
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."moveit_configs_utils";
  propagatedBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_configs_utils" = substituteSource {
        src = fetchgit {
          name = "moveit_configs_utils-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "54434ddd394a6e34f41041e0eec4d8ca590e1cf3";
          hash = "sha256-w02c4XLWlpC5t4RdhfIgbKqP6cEwdCwxstnv5uNWxqA=";
        };
      };
    });
  };
  meta = {
    description = "Python library for loading moveit config parameters in launch files";
  };
})
