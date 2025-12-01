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
  version = "0.4.0-1";
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
        rev = "b896565a3b7c20b06c1c0c037e5cb07a0b172dee";
        hash = "sha256-+ubhlTakWl3koitjax1o6BJTjosM9BB7zg1TKZX5hOs=";
      };
    };
  });
  meta = {
    description = "ROS 2 interfaces for NavMap (messages for visualization and layers)";
  };
})
