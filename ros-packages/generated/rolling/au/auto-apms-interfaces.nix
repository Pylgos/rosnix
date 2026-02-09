{
  ament-cmake,
  ament-cmake-copyright,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "auto_apms_interfaces";
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."auto_apms_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators ];
  checkInputs = [ ament-cmake-copyright ];
  passthru.sources = mkSourceSet (sources: {
    "auto_apms_interfaces" = substituteSource {
      src = fetchgit {
        name = "auto_apms_interfaces-source";
        url = "https://github.com/ros2-gbp/autoapms-release.git";
        rev = "ff8cb93d30f167e737ae274cfc11026a3a1e4020";
        hash = "sha256-9ivFdyX8HdN+/HVIuPYk4xopMyDvWExHLc4voTjtmss=";
      };
    };
  });
  meta = {
    description = "ROS 2 interfaces for AutoAPMS";
  };
})
