{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "navmap_ros_interfaces";
  version = "0.2.5-1";
  src = finalAttrs.passthru.sources."navmap_ros_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "navmap_ros_interfaces" = substituteSource {
      src = fetchgit {
        name = "navmap_ros_interfaces-source";
        url = "https://github.com/EasyNavigation/NavMap-release.git";
        rev = "2a429e2a46e3bf25e245575e4f4adba669fe5f3d";
        hash = "sha256-enDxcFCwwtk9tqpgHWyeiKsqH3ZCRW5AhaII8+Lai68=";
      };
    };
  });
  meta = {
    description = "ROS 2 interfaces for NavMap (messages for visualization and layers)";
  };
})
