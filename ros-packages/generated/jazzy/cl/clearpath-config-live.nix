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
  version = "2.0.0-1";
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
        rev = "cb91c262f4cd2af1775ad1a42b78f0c6ea9ae4bd";
        hash = "sha256-joVPz7TY962qzlSFEIALkm601OK84C8wcys2HQkkGdI=";
      };
    };
  });
  meta = {
    description = "Live URDF Updater from Clearpath Configuration.";
  };
})
