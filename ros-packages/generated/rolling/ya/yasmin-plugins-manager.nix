{
  ament-index-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  yasmin,
  yasmin-factory,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "yasmin_plugins_manager";
  version = "5.0.0-1";
  src = finalAttrs.passthru.sources."yasmin_plugins_manager";
  propagatedNativeBuildInputs = [ ament-index-python rclpy yasmin yasmin-factory ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-lxml" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy yasmin yasmin-factory ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lxml" "python3-yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin_plugins_manager" = substituteSource {
      src = fetchgit {
        name = "yasmin_plugins_manager-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "641ce940c9f9637519b637333c6d243af6fddfbc";
        hash = "sha256-jHUGQQ29sseHJyr/HRqL8+aQhVu+ZEx1Bw/cEve5fCc=";
      };
    };
  });
  meta = {
    description = "Plugin discovery and caching for YASMIN states.";
  };
})
