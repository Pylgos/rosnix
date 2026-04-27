{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  qml6-ros2-plugin,
  rosSystemPackages,
  rqml-core,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqml_plugin_example";
  version = "3.26.41-1";
  src = finalAttrs.passthru.sources."rqml_plugin_example";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ qml6-ros2-plugin rqml-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qml6-module-qtquick-controls" "qml6-module-qtquick-layouts" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ qml6-ros2-plugin rqml-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qml6-module-qtquick-controls" "qml6-module-qtquick-layouts" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqml_plugin_example" = substituteSource {
      src = fetchgit {
        name = "rqml_plugin_example-source";
        url = "https://github.com/ros2-gbp/rqml-release.git";
        rev = "106a660d16bbc97800fafb66cfe482b18a1a9e0b";
        hash = "sha256-OO4sM+DqfM8+8FPumwnVhEtyMAqJx+75eVo2BlLSP0k=";
      };
    };
  });
  meta = {
    description = "An example plugin for RQml";
  };
})
