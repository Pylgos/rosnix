{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosbot-controller,
  rosbot-description,
  rosbot-hardware-interfaces,
  rosbot-joy,
  rosbot-localization,
  rosbot-moveit,
  rosbot-utils,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."rosbot";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rosbot-controller rosbot-description rosbot-hardware-interfaces rosbot-joy rosbot-localization rosbot-moveit rosbot-utils ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosbot-controller rosbot-description rosbot-hardware-interfaces rosbot-joy rosbot-localization rosbot-moveit rosbot-utils ];
  passthru.sources = mkSourceSet (sources: {
    "rosbot" = substituteSource {
      src = fetchgit {
        name = "rosbot-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "5482d681d9261e169338201510d37573ad8acf8f";
        hash = "sha256-I7pfZKHSwS1E11n3DFY5WsruXnwQutp/SfrGiJrlhcM=";
      };
    };
  });
  meta = {
    description = "Meta package that contains all packages of ROSbot Series";
  };
})
