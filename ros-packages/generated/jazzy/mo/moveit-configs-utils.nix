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
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_configs_utils";
  propagatedBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_configs_utils" = substituteSource {
        src = fetchgit {
          name = "moveit_configs_utils-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "5b1a56d796279057a36d9738191655ecf616b024";
          hash = "sha256-8DDHsJCi1DVNRwZcC9PrM6vw7VJA2mZjeOroGm+NewY=";
        };
      };
    });
  };
  meta = {
    description = "Python library for loading moveit config parameters in launch files";
  };
})
