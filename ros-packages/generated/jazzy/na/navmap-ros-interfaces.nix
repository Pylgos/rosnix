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
  version = "0.3.0-1";
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
        rev = "746fdc6db18fd813c60710e2cacd0660115740df";
        hash = "sha256-iLoAU5Y2BfgJQSDt66DR1wE+MNDUdOUQnGRy8fcyDvg=";
      };
    };
  });
  meta = {
    description = "ROS 2 interfaces for NavMap (messages for visualization and layers)";
  };
})
