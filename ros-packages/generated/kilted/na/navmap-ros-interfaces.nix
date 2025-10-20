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
  version = "0.2.3-1";
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
        rev = "a43cf58c1c24279ee2939aaa78a278bcb9dc1e99";
        hash = "sha256-XS1hszN/ZWCFoXrUh2SMCAFlFh1gCLtvEw5LF0V27sM=";
      };
    };
  });
  meta = {
    description = "ROS 2 interfaces for NavMap (messages for visualization and layers)";
  };
})
