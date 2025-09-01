{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clearpath-generator-common,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_config_live";
  version = "2.7.0-2";
  src = finalAttrs.passthru.sources."clearpath_config_live";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-generator-common rclpy xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-watchdog" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ clearpath-generator-common rclpy xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-watchdog" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_config_live" = substituteSource {
      src = fetchgit {
        name = "clearpath_config_live-source";
        url = "https://github.com/clearpath-gbp/clearpath_desktop-release.git";
        rev = "f24700576c5f77d7527302af18b8cb04775420ed";
        hash = "sha256-HrOxMeX1UO80c4TZUm1yrdopHG27JtOgSpm/QVobJhQ=";
      };
    };
  });
  meta = {
    description = "Live URDF Updater from Clearpath Configuration.";
  };
})
